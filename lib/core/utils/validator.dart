class Validator {
  // min length
  static bool hasMinLength(String? value, {int minLength = 1}) {
    if (value == null) return false;
    return value.trim().length >= minLength;
  }

  //email
  static bool isEmail(String? value) {
    if (value == null) return false;
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  //password
  static bool isPassword(String? value) {
    if (value == null) return false;
    return value.trim().length >= 6;
  }

  //phone
  static bool isEGPhoneNumber(String? value) {
    if (value == null) return false;
    return RegExp(r"^(010|011|012|015)[0-9]{8}$").hasMatch(value);
  }
}
