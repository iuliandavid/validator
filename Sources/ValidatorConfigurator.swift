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
        return AndCompositeValidator(validators: emptyEmailStringValidator(), EmailFormatValidator())
    }
    
    func passwordValidator() -> Validator {
        return AndCompositeValidator(validators: emptyPasswordStringValidator(), passwordStrengthValidator())
    }
    
    /// Helper Methods
    private func emptyEmailStringValidator() -> Validator {
        return EmptyStringValidator(invalidError: EmailValidatorError.empty)
    }
    
    private func emptyPasswordStringValidator() -> Validator {
        return EmptyStringValidator(invalidError: PasswordValidatorError.empty)
    }
    private func passwordStrengthValidator() -> Validator {
        return AndCompositeValidator(validators: PasswordLengthValidator(), PasswordLowerCaseValidator(), PasswordUpperCaseValidator(),
                                     numberOrSpecialCharacterValidator())
    }
    private func numberOrSpecialCharacterValidator() -> Validator {
        return OrCompositeValidator(validators: ContainsNumberValidator(),  ContainsSpecialCharacterValidator())
    }
}
