import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_demo_flutter/constants/strings/text_strings.dart';

class Validator {
  static final Validator _singleton = Validator._internal();
  factory Validator() {
    return _singleton;
  }
  Validator._internal();

  RequiredValidator requiredValidator =
      RequiredValidator(errorText: 'Required Field');
  EmailValidator emailValidator = EmailValidator(errorText: 'Invalid Email');
}

class Validations {
  static Validator validator = Validator();
  static decimalTextFieldValidator(dynamic value) {
    if (value == "" || value == null) {
      return TextStrings.REQUIRED;
    } else if (value == "." ||
        value == "0." ||
        value == "0" ||
        value.toString().split("")[0] == "-" ||
        value.toString().contains("..") ||
        double.parse(value) == 0) {
      return TextStrings.FAIL;
    }
  }
}
