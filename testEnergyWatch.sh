#!/bin/bash

source energyWatch.sh "source"

fail(){
    test="$1"
    is="$2"
    expected="$3"
    echo "Fail: $test, expected ($expected), but was ($is)"
    exit 1
}

test_format_output(){
    test=test_format_output

    test_no=1
    return_raw_output=true
    is_output=$(format_output "data" "raw output" "nice output")
    expected_output="raw output"
    test "$is_output" = "$expected_output" || fail "$test $test_no" "$is_output" "$expected_output"

    test_no=2
    return_raw_output=true
    is_output=$(format_output "" "raw output" "nice output")
    expected_output="raw output"
    test "$is_output" = "$expected_output" || fail "$test $test_no" "$is_output" "$expected_output"
    
    test_no=3
    return_raw_output=""
    is_output=$(format_output "" "raw output" "nice output")
    expected_output="nice output"
    test "$is_output" = "$expected_output" || fail "$test $test_no" "$is_output" "$expected_output"
}

test_format_output
