from starkware.cairo.common.bitwise import bitwise_and, bitwise_xor
from starkware.cairo.common.cairo_builtins import BitwiseBuiltin, HashBuiltin

// %builtins bitwise --> should be removed because import order of pointers should not be violated (follow %builtins import order, and follow this also while passing them to the functions)

func sum_even{bitwise_ptr: BitwiseBuiltin*}(arr_len: felt, arr: felt*, run: felt, idx: felt) -> (
    sum: felt
) {
    if ( idx == arr_len ) {
        return (0,);
    }

    let (tmp_sum) = sum_even(arr_len, arr, run, idx+1);

    let (bitwise_check) = bitwise_and(arr[idx], 1);
    if ( bitwise_check != 0 ) {
        return (tmp_sum,);
    }
    return (tmp_sum + arr[idx],);
}