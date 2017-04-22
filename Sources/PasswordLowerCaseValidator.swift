import Foundation
struct PasswordLowerCaseValidator: Validator {
    
    func validate(_ value: String) -> ValidatorResult {
    
    let lowerCaseLetterRegex = ".*[a-z]+.*"
    var lowerCaseLetterTest:NSPredicate?
    
    #if os(Linux)
            lowerCaseLetterRegex.withCString {
            lowerCaseLetterTest = NSPredicate(format:"SELF MATCHES %s", $0)
            }
    #else
            lowerCaseLetterTest = NSPredicate(format:"SELF MATCHES %@", lowerCaseLetterRegex)
    #endif
    
    if lowerCaseLetterTest!.evaluate(with: value) {
            return .valid
        } else {
            return .invalid(error: PasswordValidatorError.noLowerCaseLetter)
    }
    
    }
}
