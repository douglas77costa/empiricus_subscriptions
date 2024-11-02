import 'package:flutter/material.dart';

class LoginController {

  final formKey = GlobalKey<FormState>();

  var obscurePassword = ValueNotifier<bool>(true);

  void showPassword() => obscurePassword.value = !obscurePassword.value;

  var email = "";
  var password = "";

  void login() async {
    if (formKey.currentState!.validate()) {
      print('Login success');
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Insira um e-mail válido";
    }
    email = value;
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Insira uma senha válido";
    }
    password = value;
    return null;
  }
}
