//
//  PasswordUpperCaseValidator.swift
//  validators
//
//  Created by iulian david on 4/22/17.
//
//

import Foundation
struct PasswordUpperCaseValidator: Validator {
    
    func validate(_ value: String) -> ValidatorResult {
        
        let uppercaseLetterRegex = ".*[A-Z]+.*"
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
