%builtins output

// Import the serialize_word() function.
from starkware.cairo.common.serialize import serialize_word

// Create a function that accepts a parameter and logs it
func log_value{output_ptr: felt*}(y: felt) {
    serialize_word(y);
    return ();
}

func main{output_ptr: felt*}() {
    tempvar y = 10;
    log_value(y);
    return ();
}