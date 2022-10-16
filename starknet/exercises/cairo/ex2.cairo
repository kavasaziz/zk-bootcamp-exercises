%builtins range_check

from starkware.cairo.common.uint256 import (uint256_add, Uint256)

func add_one(y: felt) -> (val: felt) {
    return (val=y+1);
}

func add_one_U256{range_check_ptr}(y: Uint256) -> (val: Uint256) {
    alloc_locals;
    let (local res, local carry) = uint256_add(y, Uint256(low=1, high=0));
    return (val=res);
}