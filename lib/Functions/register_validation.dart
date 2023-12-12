String? registerEmailValidation(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return "Please enter email address";
  } else if (!regex.hasMatch(value)) {
    return "Please enter valid email address";
  }
  return null;
}

String? registerFullnameValidation(String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return "Please Enter Name";
  }
  return null;
}

String? registerPhoneValidation(String? value) {
  const pattern = r"^\d{10}$";
  final regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return "Please enter phone number";
  }
  // Regex pattern = “^\d{10}$”;
  else if (value.length != 10 || !regex.hasMatch(value)) {
    return "Please enter valid phone number";
  }
  return null;
}

String? registerPasswordValidation(String? value) {
  if (value == null || value.isEmpty) {
    return "Please enter password";
  } else if (value.length < 8) {
    return "Password must be of size 8";
  }
  return null;
}

String? registerConfirmPasswordValidation(String? value, String password) {
  if (value != password) {
    return "Password not Matching";
  }
  return null;
}

String? registerBanknameValidation(String? value) {
  value = value?.trim();
  if (value == null || value.isEmpty) {
    return "Please enter bank Name";
  }
  return null;
}
