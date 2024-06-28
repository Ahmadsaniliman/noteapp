import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/Screens/Components/app_bar.dart';
import 'package:myfirstnotebook/Screens/Components/button.dart';
import 'package:myfirstnotebook/Screens/Components/custom_text_button.dart';
import 'package:myfirstnotebook/Screens/Components/custom_text_field.dart';
import 'package:myfirstnotebook/Screens/login.dart';
import 'package:myfirstnotebook/Screens/register.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomAppBar(text: 'Forgot Password'),
              Form(
                child: CustomTextField(
                  text: 'Email',
                  hintText: 'Enter Your Password',
                  controller: emailController,
                ),
              ),
              const SizedBox(height: 15),
              Row(
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
                    text: 'Login',
                    onTapped: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              CustomButton(
                text: 'Reset Password',
                onTapped: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
