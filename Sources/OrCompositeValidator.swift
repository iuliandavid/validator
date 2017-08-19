//
//  OrCompositeValidator.swift
//  validators
//
//  Created by iulian david on 4/22/17.
//
//

import Foundation

struct OrCompositeValidator: Validator {
    
    private let validators: [Validator]
    
    init(validators: Validator...) {
        self.validators = validators
    }
    
    func validate(_ value: String) -> ValidatorResult {
        return validators.reduce(.invalid(errors: [])) { validatorResult, validator in
            guard case .invalid(let validatorResultErrors) = validatorResult else {
                return .valid
            }
            
            switch validator.validate(value) {
            case .valid:
                return .valid
            case .invalid(let validatorErrors):
                return .invalid(errors: validatorResultErrors + validatorErrors)
            }
        }
    }
}
