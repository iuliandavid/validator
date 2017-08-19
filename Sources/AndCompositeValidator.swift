//
//  CompositeValidator.swift
//  validators
//
//  Created by iulian david on 4/22/17.
//
//

import Foundation

/// Acting as an And validator
struct AndCompositeValidator: Validator {
    
    private let validators: [Validator]
    
    init(validators: Validator...) {
        self.validators = validators
    }
    
    func validate(_ value: String) -> ValidatorResult {

        return validators.reduce(.valid) { (validatorResult, validator) in
            switch validator.validate(value) {
            case .valid:
                return validatorResult
            case .invalid(let validationErrors):
                switch validatorResult {
                case .valid:
                    return .invalid(errors: validationErrors)
                case .invalid(let validationErrorResults) :
                    return .invalid(errors: validationErrorResults + validationErrors)
                }
            }
        }
//        for validator in validators {
//            switch validator.validate(value) {
//            case .valid:
//                break
//            case .invalid(let error):
//                return .invalid(errors: error)
//            }
//        }
//        
//        return .valid
    }
}
