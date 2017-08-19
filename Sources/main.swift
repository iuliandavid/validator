let validatorConfigurator = ValidatorConfigurator.sharedInstance
let emailValidator = validatorConfigurator.emailValidator()
let passwordValidator = validatorConfigurator.passwordValidator()

print("\"\": \(emailValidator.validate(""))")
print("invalidEmail@ : \(emailValidator.validate("invalidEmail@"))")
print("invalidEmail@com : \(emailValidator.validate("invalidEmail@com"))")
print("validEmail@validDomain.com : \(emailValidator.validate("validEmail@validDomain.com"))")

print("\"\": \(passwordValidator.validate(""))")
print("psS$ : \(passwordValidator.validate("psS$"))")
print("passw0rd : \(passwordValidator.validate("passw0rd"))")
print("paSSw0rd : \(passwordValidator.validate("paSSw0rd"))")



print(passwordValidator.validate("Password"))
print(passwordValidator.validate("Password1"))
print(passwordValidator.validate("Password$"))
print(passwordValidator.validate("Password1$"))
