import Foundation
struct PasswordLowerCaseValidator: Validator {
    
    func validate(_ value: String) -> ValidatorResult {
    
    let uppercaseLetterRegex = ".*[a-z]+.*"
    var uppercaseLetterTest:NSPredicate?
    
    #if os(Linux)
            uppercaseLetterRegex.withCString {
            uppercaseLetterTest = NSPredicate(format:"SELF MATCHES %s", $0)
            }
    #else
            uppercaseLetterTest = NSPredicate(format:"SELF MATCHES %@", uppercaseLetterRegex)
    #endif
    
    if uppercaseLetterTest!.evaluate(with: value) {
            return .valid
        } else {
            return .invalid(error: PasswordValidatorError.noLowerCaseLetter)
    }
    
    }
}