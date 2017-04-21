struct PasswordLengthValidator: Validator {
    func validate(_ value: String) -> ValidatorResult {
    
    if value.characters.count < 8 {
            return .invalid(error: PasswordValidatorError.tooShort)
        } else {
            return .valid
    }
    }
}