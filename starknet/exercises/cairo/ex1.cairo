// Create a function that accepts a parameter and logs it
func log_value(y: felt) {
    %{ print(f"my value: {ids.y}") %}
    return ();
}