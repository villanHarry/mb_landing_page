import 'package:tadbir_landing_page/widgets/app_regular_expressions.dart';

extension AppValidator on String {
  //-------------- Email Validator -------------------
  get validateEmail {
    if (!RegularExpressions.EMAIL_VALID_REGIX.hasMatch(this) && isNotEmpty) {
      return "Please enter valid email address";
    } else if (isEmpty) {
      return "Email field cannot be empty";
    }
    return null;
  }

  //---------------- Empty Validator -----------------
  String? validateEmpty(String message) {
    if (isEmpty) {
      // return '$message field_cant_be_empty'.tr();
      String returningString = 'field cannot be empty';
      return '$message $returningString';
    } else {
      return null;
    }
  }

//---------------- OTP Validator ---------------
  get validateOtp {
    if (length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }
}
