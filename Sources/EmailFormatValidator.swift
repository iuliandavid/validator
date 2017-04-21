import Foundation
struct EmailFormatValidator: Validator {
    
    func validate(_ value: String) -> ValidatorResult {
        let magicEmailRegexStolenFromTheInternet = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        var emailTest:NSPredicate?
        
        #if os(Linux)
            magicEmailRegexStolenFromTheInternet.withCString {
            emailTest = NSPredicate(format:"SELF MATCHES %s", $0)
            }
        #else
            emailTest = NSPredicate(format:"SELF MATCHES %@", magicEmailRegexStolenFromTheInternet)
        #endif
        
        if emailTest!.evaluate(with: value) {
            return .valid
        } else {
            return .invalid(error: EmailValidatorError.invalidFormat)
        }
    }
}