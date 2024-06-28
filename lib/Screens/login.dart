import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/AlertModel/alert_model.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth_provider.dart';
import 'package:myfirstnotebook/Screens/Components/app_bar.dart';
import 'package:myfirstnotebook/Screens/Components/button.dart';
import 'package:myfirstnotebook/Screens/Components/custom_text_button.dart';
import 'package:myfirstnotebook/Screens/Components/custom_text_field.dart';
import 'package:myfirstnotebook/Screens/Components/google_button.dart';
import 'package:myfirstnotebook/Screens/forgot_password.dart';
import 'package:myfirstnotebook/Screens/home.dart';
import 'package:myfirstnotebook/Screens/register.dart';
import 'package:myfirstnotebook/Screens/verify_email.dart';
import 'dart:developer' as devtool show log;

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 70),
                  child: CustomAppBar(
                    text: 'Login',
                  ),
                ),
                FormField(
                  validator: (value) {
                    return null;
                  },
                  builder: (field) => Form(
                    child: Column(
                      children: [
                        CustomTextField(
                          text: 'Email',
                          hintText: 'Enter Your Password',
                          controller: emailController,
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          text: 'Password',
                          hintText: 'Enter Your Password',
                          controller: passwordController,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextButton(
                        text: 'Register',
                        onTapped: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                      ),
                      CustomTextButton(
                        text: 'Forgot Password',
                        onTapped: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen(),
                            ),
                          );
                        },
                      ),
                      CustomTextButton(
                        text: 'Verify Email',
                        onTapped: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VerifyEmailScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  text: 'Login',
                  onTapped: () async {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    if (email.isEmpty || password.isEmpty) {
                      await showAlertDialog(
                        context: context,
                        text: 'Heyy',
                        description:
                            'Heyy Please Fill Both Email And Password Fields',
                        buttonText1: '',
                        buttonText2: 'Ok',
                        onTapped1: () {
                          Navigator.of(context).pop();
                        },
                      );
                    } else {
                      await ref.read(authProvider.notifier).loginUser(
                            context: context,
                            email: email,
                            password: password,
                          );
                      emailController.clear();
                      passwordController.clear();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                      devtool.log('LoggedIn Successsfull');
                    }
                  },
                ),
                const SizedBox(height: 15),
                GoogleButton(
                  onTapped: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
