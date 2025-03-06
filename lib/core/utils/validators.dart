class Validators {
  static String? validateUsername(String? username) {
    if (username == null || username.trim().isEmpty) {
      // TODO: make a message file for all explicit strings and use the key only here
      return "Please enter a user name";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return "Please enter a password";
    } else if (password.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }
}
