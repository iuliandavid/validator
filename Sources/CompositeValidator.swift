//
//  CompositeValidator.swift
//  validators
//
//  Created by iulian david on 4/22/17.
//
//

import Foundation
struct CompositeValidator: Validator {
    
    private let validators: [Validator]
    
    init(validators: Validator...) {
        self.validators = validators
    }
    
    func validate(_ value: String) -> ValidatorResult {
        for validator in validators {
            switch validator.validate(value) {
            case .valid:
                break
            case .invalid(let error):
                return .invalid(error: error)
            }
        }
        
        return .valid
    }
}
