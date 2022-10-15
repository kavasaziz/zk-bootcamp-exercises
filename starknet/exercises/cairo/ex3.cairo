%builtins output range_check

from starkware.cairo.common.serialize import serialize_word
from starkware.cairo.common.math import unsigned_div_rem

func main{output_ptr: felt*, range_check_ptr}() {
    simple_math();
    return ();
}


// Perform and log output of simple arithmetic operations
func simple_math{output_ptr: felt*, range_check_ptr}() {
    // adding 13 +  14
    tempvar a = 13 + 14;
    serialize_word(a);
    // multiplying 3 * 6
    tempvar b = 3 + 6;
    serialize_word(b);
    // dividing 6 by 2
    tempvar c = 6 / 2;
    serialize_word(c);
    // dividing 70 by 2
    tempvar d = 70 / 2;
    serialize_word(d);
    // dividing 7 by 2
    let (e,_) = unsigned_div_rem(7,2);
    serialize_word(e);

    return ();
}
