struct EmptyStringValidator : Validator {
    
    // This error is passed via the initializer to allow this validator to be reused
    private let invalidError: Error
    
    init(invalidError: Error) {
        self.invalidError = invalidError
    }
    
    func validate(_ value: String) -> ValidatorResult {
        if value.isEmpty {
            return .invalid(errors: [invalidError])
        } else {
            return .valid
        }
    }
}
