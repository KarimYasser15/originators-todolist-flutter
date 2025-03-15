import 'package:email_validator/email_validator.dart';
import 'package:todo_list/core/utils/messages.dart';

class Validators {
  static String? validateUsername(String? username) {
    if (username == null || username.trim().isEmpty) {
      return Messages.userNameRequired;
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return Messages.emailRequired;
    }
    bool isValid = EmailValidator.validate(email);
    if (!isValid) {
      return Messages.wrongEmail;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return Messages.passwordRequired;
    } else if (password.length < 6) {
      return Messages.passwordIsSmall;
    }
    return null;
  }

  static String? validateTwoPasswords(
      String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return Messages.passwordsDontMatch;
    }
    return null;
  }

  static String? validateTask(String? value, String message) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }
}
