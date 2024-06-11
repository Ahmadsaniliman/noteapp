import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/Screens/Components/app_bar.dart';
import 'package:myfirstnotebook/Screens/Components/button.dart';
import 'package:myfirstnotebook/Screens/Components/custom_text_button.dart';
import 'package:myfirstnotebook/Screens/Components/custom_text_field.dart';
import 'package:myfirstnotebook/Screens/Components/google_button.dart';
import 'package:myfirstnotebook/Screens/forgot_password.dart';
import 'package:myfirstnotebook/Screens/register.dart';
import 'package:myfirstnotebook/Screens/verify_email.dart';


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
                              builder: (context) => RegisterScreen(),
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
                  onTapped: () {},
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
