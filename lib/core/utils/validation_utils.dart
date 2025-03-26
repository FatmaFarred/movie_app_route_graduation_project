class ValidationUtils {
  static bool isValidName(String? name) {
    if (name == null) return false;
    return RegExp(r'^[A-Za-z ]{5,}$').hasMatch(name);
  }

  static bool isValidEmail(String? email) {
    if (email == null) return false;
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  static bool isValidPassword(String? password) {
    if (password == null) return false;
    return RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*)(_+؟/\\|]).{8,}$')
        .hasMatch(password);
  }

  static bool isValidPhone(String? phone) {
    if (phone == null) return false;
    return RegExp(r'^\+20(10|11|12|15)\d{8}$').hasMatch(phone);
  }
}
