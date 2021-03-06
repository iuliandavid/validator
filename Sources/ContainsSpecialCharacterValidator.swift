//
//  ContainsSpecialCharacterValidator.swift
//  validators
//
//  Created by iulian david on 4/22/17.
//
//

import Foundation


struct ContainsSpecialCharacterValidator: Validator {
    
    func validate(_ value: String) -> ValidatorResult {
        
        let numberRegex = "^[^<>{}\"/|;:.,~!?@#$%^=&*\\]\\\\()\\[¿§«»ω⊙¤°℃℉€¥£¢¡®©_+]*$"
        var numberTest:NSPredicate?
        
        #if os(Linux)
            numberRegex.withCString {
                numberTest = NSPredicate(format:"SELF MATCHES %s", $0)
            }
        #else
            numberTest = NSPredicate(format:"SELF MATCHES %@", numberRegex)
        #endif
        
        if numberTest!.evaluate(with: value) {
            return .valid
        } else {
            return .invalid(errors: [PasswordValidatorError.noNumber])
        }
        
    }
}
