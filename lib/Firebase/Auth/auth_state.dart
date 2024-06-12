// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth.dart';
import 'package:myfirstnotebook/Loading/loading.dart';

class AuthenticationState extends StateNotifier {
  final _auth = FirebaseAuthenticator();

  AuthenticationState() : super(false);
  Future<void> createUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    LoadingScreen.instance().show(context: context);
    await _auth.createUser(context: context, email: email, password: password);
    LoadingScreen.instance().hide();
  }

  Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    LoadingScreen.instance().show(context: context);
    await _auth.loginUser(context: context, email: email, password: password);
    LoadingScreen.instance().hide();
  }

  Future<void> googleSignIn({
    required BuildContext context,
    required String email,
  }) async {
    LoadingScreen.instance().show(context: context);
    await _auth.signInWithGoogle(context, email);
    LoadingScreen.instance().hide();
  }

  Future<void> verifyEmail({
    required BuildContext context,
    required String email,
  }) async {
    LoadingScreen.instance().show(context: context);
    await _auth.verifyEmail(context, email);
    LoadingScreen.instance().hide();
  }

  Future<void> forgotPassword(BuildContext context, String email) async {
    LoadingScreen.instance().show(context: context);
    await _auth.forgotPassword(context, email);
    LoadingScreen.instance().hide();
  }

  Future<void> logOut(BuildContext context) async {
    LoadingScreen.instance().show(context: context);
    await _auth.logOut(context);
    LoadingScreen.instance().hide();
  }
}
