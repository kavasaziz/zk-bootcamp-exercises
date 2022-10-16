%builtins range_check

from starkware.cairo.common.math import unsigned_div_rem

// Perform and log output of simple arithmetic operations
func simple_math{range_check_ptr}() {
    // adding 13 +  14
    tempvar a = 13 + 14;
    %{ print(f"a: {ids.a}") %}
    // multiplying 3 * 6
    tempvar b = 3 + 6;
    %{ print(f"b: {ids.b}") %}
    // dividing 6 by 2
    tempvar c = 6 / 2;
    %{ print(f"c: {ids.c}") %}
    // dividing 70 by 2
    tempvar d = 70 / 2;
    %{ print(f"d: {ids.d}") %}
    // dividing 7 by 2
    let (e,_) = unsigned_div_rem(7,2);
    %{ print(f"e: {ids.e}") %}

    return ();
}
