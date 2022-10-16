%builtins output range_check

from starkware.cairo.common.serialize import serialize_word
from starkware.cairo.common.math import abs_value

// Implement a funcion that returns:
// - 1 when magnitudes of inputs are equal
// - 0 otherwise
func abs_eq{range_check_ptr}(x: felt, y: felt) -> (bit: felt) {
    let x_abs = abs_value(x);
    let y_abs = abs_value(y);

    if(x_abs == y_abs) {
        return (1,);
    }

    return (0,);
}

func main{output_ptr: felt*, range_check_ptr}() {
    let (a) = abs_eq(5,-5);
    serialize_word(a);
    let (b) = abs_eq(5,-4);
    serialize_word(b);

    return ();
}