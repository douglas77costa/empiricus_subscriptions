import 'package:empiricus_subscriptions/app/core/style/app_images.dart';
import 'package:empiricus_subscriptions/app/core/style/colors.dart';
import 'package:empiricus_subscriptions/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }

  PreferredSizeWidget get appBar => AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      );

  Widget get body => SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              SizedBox(
                width: 150,
                child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(AppImages.logo),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Acesse sua conta',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                validator: (value) => controller.validateEmail(value),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder(
                valueListenable: controller.obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    validator: (value) => controller.validatePassword(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: value,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: () => controller.showPassword(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ValueListenableBuilder(
                  valueListenable: controller.isLoading,
                  builder: (context, value, child) {
                    return FilledButton(
                      onPressed: () {
                        if (!controller.isLoading.value) {
                          controller.login(context);
                        }
                      },
                      child: !controller.isLoading.value
                          ? const Text('Entrar')
                          : const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
