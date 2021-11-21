#!/bin/bash

source energyWatch.sh "source"

fail(){
    test="$1"
    is="$2"
    expected="$3"
    echo "Fail: $test, expected ($expected), but was ($is)"
}

assert(){
    echo "-- Testing $test $test_no"
    test "$is_output" = "$expected_output" || fail "$test $test_no" "$is_output" "$expected_output"
}

test_format_output(){
    test=test_format_output

    test_no=1
    return_raw_output=true
    is_output=$(format_output "data" "raw output" "nice output")
    expected_output="raw output"
    assert

    test_no=2
    return_raw_output=true
    is_output=$(format_output "" "raw output" "nice output")
    expected_output="$empty_value"
    assert
    
    test_no=3
    return_raw_output=""
    is_output=$(format_output "data" "raw output" "nice output")
    expected_output="nice output"
    assert

    test_no=4
    return_raw_output=""
    is_output=$(format_output "" "raw output" "nice output")
    expected_output="$empty_value"
    assert
}

test_remove_all_from_text(){
    test=test_format_output

    test_no=1
    is_output=$(remove_all_from_text "this is my text" " ")
    expected_output="thisismytext"
    assert 

    test_no=2
    is_output=$(remove_all_from_text "this is my text" "t" "e" "y x")
    expected_output="his is m"
    assert
}

test_format_output
test_remove_all_from_text
