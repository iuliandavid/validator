//
//  ValidatorConfigurator.swift
//  validators
//
//  Created by iulian david on 4/22/17.
//
//
///  Helper class to make the code easy to read, use, and change later.
import Foundation
struct ValidatorConfigurator {
    
    // Interface
    
    static let sharedInstance = ValidatorConfigurator()
    
    func emailValidator() -> Validator {
        return CompositeValidator(validators: emptyEmailStringValidator(), EmailFormatValidator())
    }
    
    func passwordValidator() -> Validator {
        return CompositeValidator(validators: emptyPasswordStringValidator(), PasswordLengthValidator(), PasswordLowerCaseValidator(), PasswordUpperCaseValidator(),
        PasswordContainsNumberValidator())
    }
    
    /// Helper Methods
    private func emptyEmailStringValidator() -> Validator {
        return EmptyStringValidator(invalidError: EmailValidatorError.empty)
    }
    
    private func emptyPasswordStringValidator() -> Validator {
        return EmptyStringValidator(invalidError: PasswordValidatorError.empty)
    }
}
