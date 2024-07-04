// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth.dart';
import 'package:myfirstnotebook/Firebase/User/user_info.dart';
import 'package:myfirstnotebook/Loading/loading.dart';
import 'package:myfirstnotebook/TypeDefs/user_id.dart';

class AuthenticationState extends StateNotifier<FirebaseAuthenticator> {
  final saveUserInfo = const SaveUserMail();
  final _auth = FirebaseAuthenticator();

  AuthenticationState() : super(false as FirebaseAuthenticator);

  Future<void> saveInfo({required UserId userId, required String email}) =>
      saveUserInfo.saveUserEmail(
        userId: userId,
        email: email,
      );
  Future<void> createUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    LoadingScreen.instance().show(context: context);
    await _auth.createUser(context: context, email: email, password: password);
    // saveInfo(userId: userId, email: email);
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
    _auth.logOut(context);
    LoadingScreen.instance().hide();
  }
}
