// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _auth = FirebaseAuthenticator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        elevation: 0,
        actions: [
          Consumer(
            builder: (_, ref, child) {
              return IconButton(
                onPressed: () async {
                  await ref.read(authProvider.notifier).logOut(context);
                },
                icon: const Icon(FontAwesomeIcons.signOut),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) =>
              Text(_auth.currentUser!.email.toString()),
        ),
      ),
    );
  }
}
