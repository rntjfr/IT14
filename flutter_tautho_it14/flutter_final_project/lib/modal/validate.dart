mixin InputValidationMix {
  bool isPasswordValid(String password) => password.length >= 6;
  bool isNameValid(String name) => name.isNotEmpty;
  bool isGenderValid(String gender) => gender.isNotEmpty;
  bool isCivilStatusValid(String civilstatus) => civilstatus.isNotEmpty;
  bool isBirthdateValid(String birthdate) => birthdate.isNotEmpty;

  bool isPasswordCorrect(
          String email, String user, String password, String pass) =>
      email == user && password == pass;

  bool isPasswordsSame(String password, String cpassword) =>
      password == cpassword;

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }
}
