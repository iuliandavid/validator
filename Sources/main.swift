let validatorConfigurator = ValidatorConfigurator.sharedInstance
let emailValidator = validatorConfigurator.emailValidator()
let passwordValidator = validatorConfigurator.passwordValidator()

print(emailValidator.validate(""))
print(emailValidator.validate("invalidEmail@"))
print(emailValidator.validate("invalidEmail@com"))
print(emailValidator.validate("validEmail@validDomain.com"))

print(passwordValidator.validate(""))
print(passwordValidator.validate("psS$"))
print(passwordValidator.validate("passw0rd"))
print(passwordValidator.validate("paSSw0rd"))

