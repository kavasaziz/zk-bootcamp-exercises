from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin
from starkware.cairo.common.cairo_builtins import HashBuiltin

// Using binary operations return:
// - 1 when pattern of bits is 01010101 from LSB up to MSB 1, but accounts for trailing zeros
// - 0 otherwise

// 000000101010101 PASS
// 010101010101011 FAIL

func match_pattern{range_check_ptr, bitwise_ptr: BitwiseBuiltin*}(
    n: felt, idx: felt
) -> (true: felt) {
    if (n == 2) {
        return (1,);
    }
    let (bitwise_check) = bitwise_and(n, 1);
    let (exp_bit) = bitwise_and(idx, 1);
    if ( bitwise_check == exp_bit ) {
        return match_pattern(n = (n-exp_bit)/2, idx = idx+1);
    }
    return (0,);
}

func pattern{range_check_ptr, bitwise_ptr: BitwiseBuiltin*}(
    n: felt, idx: felt, exp: felt, broken_chain: felt
) -> (true: felt) {
    let (bitwise_check) = bitwise_and(n, 1);
    return match_pattern(n,bitwise_check);
}
