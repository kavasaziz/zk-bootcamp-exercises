%builtins output

from starkware.cairo.common.serialize import serialize_word

// Return summation of every number below and up to including n
func calculate_sum(n: felt) -> (sum: felt) {
    return (sum=n * (n + 1) / 2);
}

func main{output_ptr: felt*}() {
    let a: felt = calculate_sum(10);
    serialize_word(a);
    return ();
}