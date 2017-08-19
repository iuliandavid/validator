enum ValidatorResult {
    case valid
    case invalid(errors: [Error])
}

/// Each validator is going to respond with whether the input it was given was valid or not. 
/// If it is not valid, it will return some type of error explaining why
protocol Validator {
    func validate(_ value: String) -> ValidatorResult
}


