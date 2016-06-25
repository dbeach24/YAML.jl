#!/usr/bin/env julia

import YAML

const TESTS = [
    "spec-02-01",
    "spec-02-02",
    "spec-02-03",
    "spec-02-04",
    "spec-02-05",
    "spec-02-06",
    "spec-02-07",
    "spec-02-08",
    "spec-02-09",
    "spec-02-10",
    "spec-02-11",
    "spec-02-12",
    "spec-02-13",
    "spec-02-14",
    "spec-02-15",
    "spec-02-16",
    "spec-02-17",
    "spec-02-18",
    "spec-02-19",
    "spec-02-20",
    "spec-02-21",
    "spec-02-22",
    "spec-02-23",
    "empty_scalar",
    "no_trailing_newline",
    "windows_newlines",
    "issue15",
    "issue30",
]

const TEST_DIR = dirname(@__FILE__)

function run_tests()

    testdir = TEST_DIR

    for test in TESTS
        data = YAML.load_file(joinpath(testdir, string(test, ".data")))
        expected = evalfile(joinpath(testdir, string(test, ".expected")))
        if !isequal(data, expected)
            @printf("%s: FAILED\n", test)
            @printf("Expected:\n%s\nParsed:\n%s\n",
                    expected, data)
        else
            @printf("%s: PASSED\n", test)
        end
    end

end

run_tests()
