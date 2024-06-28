// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/AlertModel/alert_model.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth_provider.dart';
import 'package:myfirstnotebook/Screens/Components/app_bar.dart';
import 'package:myfirstnotebook/Screens/Components/button.dart';
import 'package:myfirstnotebook/Screens/Components/custom_text_button.dart';
import 'package:myfirstnotebook/Screens/Components/custom_text_field.dart';
import 'package:myfirstnotebook/Screens/Components/google_button.dart';
import 'package:myfirstnotebook/Screens/login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 70),
                  child: CustomAppBar(text: 'Register'),
                ),
                FormField(
                  builder: (field) {
                    return Form(
                      child: Column(
                        children: [
                          CustomTextField(
                            text: 'Email',
                            hintText: 'Enter Your Email',
                            controller: emailController,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            text: 'Password',
                            hintText: 'Enter Your Password',
                            controller: passwordController,
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                Consumer(
                  builder: (_, ref, child) => CustomButton(
                    text: 'Register',
                    onTapped: () async {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      if (password.isEmpty || email.isEmpty) {
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
                        await ref.read(authProvider.notifier).createUser(
                              context: context,
                              email: email,
                              password: password,
                            );
                        emailController.clear();
                        passwordController.clear();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      }
                    },
                  ),
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
