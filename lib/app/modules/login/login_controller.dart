import 'package:empiricus_subscriptions/app/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers/users/datasources/user_datasource_mock.dart';
import '../../core/providers/users/repositories/user_repository_impl.dart';
import '../../core/providers/users/usecase/interfaces/login_user_usecase.dart';
import '../../core/providers/users/usecase/login_user_usecase_impl.dart';
import '../../core/routes/pages.dart';

class LoginController {
  LoginUserUseCase loginUseCase = LoginUserUseCaseImpl(
    userRepository: UserRepositoryImpl(
      datasource: UserDatasourceMock(),
    ),
  );

  final formKey = GlobalKey<FormState>();

  final obscurePassword = ValueNotifier<bool>(true);

  void showPassword() => obscurePassword.value = !obscurePassword.value;

  final isLoading = ValueNotifier<bool>(false);

  var email = "";
  var password = "";

  void login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        var result = await loginUseCase.call(email: email, password: password);
        if (context.mounted) {
          context.replace(Routes.home.replaceAll(":name", result.name));
        }
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.toString().replaceAll("Exception: ", "")),
            backgroundColor: AppColors.secondary,
          ));
        }
      }
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
