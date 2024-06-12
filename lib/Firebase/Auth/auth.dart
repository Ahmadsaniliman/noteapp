// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myfirstnotebook/AlertModel/alert_model.dart';
import 'package:myfirstnotebook/Loading/loading.dart';
import 'dart:developer' as devtool show log;
import 'package:myfirstnotebook/TypeDefs/user_id.dart';

class FirebaseAuthenticator {
  FirebaseAuthenticator();

  UserId? get userId => FirebaseAuth.instance.currentUser!.uid;
//   bool isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified ?? false;
//   String get displayName =>
  //   FirebaseAuth.instance.currentUser!.displayName ?? 'no name';
  User? get currentUser => FirebaseAuth.instance.currentUser;

  Future<void> createUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      devtool.log(credentials.toString());
      await currentUser!.sendEmailVerification();
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        // LoadingScreen.instance().show(context: context);
        LoadingScreen.instance().hide();
        await showAlertDialog(
          context: context,
          text: 'Heyy',
          description: 'User Already Exists',
          buttonText1: '',
          buttonText2: 'OK',
          onTapped1: () {
            Navigator.of(context).pop();
          },
        );
        devtool.log('user already exist');
      } else if (e.code == 'weak-password') {
        LoadingScreen.instance().hide();
        await showAlertDialog(
          context: context,
          text: 'Heyy',
          description: 'Weak Password Used',
          buttonText1: '',
          buttonText2: 'OK',
          onTapped1: () {
            Navigator.of(context).pop();
          },
        );
        devtool.log('weak password used');
      }
    } catch (e) {
      LoadingScreen.instance().hide();
      await showAlertDialog(
        context: context,
        text: 'Heyy',
        description: 'Something Went Wrong',
        buttonText1: '',
        buttonText2: 'OK',
        onTapped1: () {
          Navigator.of(context).pop();
        },
      );
      devtool.log(e.toString());
    }
  }

  Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final credentials =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      verifyEmail(context, email);

      devtool.log(credentials.toString());
    } on FirebaseException catch (e) {
      if (e.code == 'wrong-password') {
        LoadingScreen.instance().hide();
        await showAlertDialog(
          context: context,
          text: 'Heyy',
          description: 'Wrong Credentials Used',
          buttonText1: '',
          buttonText2: 'OK',
          onTapped1: () {
            Navigator.of(context).pop();
          },
        );
        devtool.log('wrong password used');
      } else if (e.code == 'user-not-found') {
        LoadingScreen.instance().hide();
        await showAlertDialog(
          context: context,
          text: 'Heyy',
          description: 'Invalid Credentiails Used',
          buttonText1: '',
          buttonText2: 'OK',
          onTapped1: () {
            Navigator.of(context).pop();
          },
        );
        devtool.log('invalid user');
      }
    } catch (e) {
      devtool.log(e.toString());
    }
  }

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> verifyEmail(BuildContext context, String email) async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    LoadingScreen.instance().hide();
    await showAlertDialog(
      context: context,
      text: 'Heyy',
      description: 'Verification Email Haas Been Sent To Your Mail',
      buttonText1: '',
      buttonText2: 'OK',
      onTapped1: () {
        Navigator.of(context).pop();
      },
    );
  }

  Future<bool> signInWithGoogle(BuildContext context, String email) async {
    try {
      final signInWithGoogle = GoogleSignIn(
        scopes: [email],
      );

      final signIn = await signInWithGoogle.signIn();
      if (signIn == null) {
        await showAlertDialog(
          context: context,
          text: 'Heyy',
          description: 'No Email is Selected',
          buttonText1: '',
          buttonText2: 'OK',
          onTapped1: () {
            Navigator.of(context).pop();
          },
        );
      }
      final googleAuth = await signIn!.authentication;
      final authCredentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final result =
          await FirebaseAuth.instance.signInWithCredential(authCredentials);

      devtool.log(result.toString());
      return true;
    } catch (e) {
      devtool.log(e.toString());
      return false;
    }
  }

  Future<void> forgotPassword(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      await showAlertDialog(
        context: context,
        text: 'Heyy',
        description: 'Reset mail has been sent to your mail',
        buttonText1: '',
        buttonText2: 'OK',
        onTapped: () {
          Navigator.of(context).pop();
        },
      );
      devtool.log('mail sent successfully');
    } catch (e) {
      devtool.log(e.toString());
    }
  }
}
