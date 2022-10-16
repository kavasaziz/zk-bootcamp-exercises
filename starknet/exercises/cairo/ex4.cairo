// Return summation of every number below and up to including n
func calculate_sum(n: felt) -> (sum: felt) {
    return (sum=n * (n + 1) / 2);
}