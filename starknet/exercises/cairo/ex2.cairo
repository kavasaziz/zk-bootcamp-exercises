%builtins output range_check

from starkware.cairo.common.serialize import serialize_word
from starkware.cairo.common.uint256 import (uint256_add, Uint256)

func add_one(y: felt) -> (val: felt) {
    return (val=y+1);
}

func add_one_U256{range_check_ptr}(y: Uint256) -> (val: Uint256) {
    alloc_locals;
    let (local res, local carry) = uint256_add(y, Uint256(low=1, high=0));
    return (val=res);
}


func main{output_ptr: felt*, range_check_ptr}() {
    alloc_locals;

    tempvar y = 10;
    let (z) = add_one(y);
    serialize_word(y);
    serialize_word(z);

    local num1: Uint256 = Uint256(4, 0);
    serialize_word(num1.low);
    let (local num2: Uint256) = add_one_U256(num1);
    serialize_word(num2.low);
    return ();
}