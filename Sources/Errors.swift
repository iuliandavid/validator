enum EmailValidatorError: Error {
    case empty
    case invalidFormat
}

enum PasswordValidatorError: Error {
    case empty
    case tooShort
    case noUpperCaseLetter
    case noLowerCaseLetter
    case noNumber
}