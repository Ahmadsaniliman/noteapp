// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/AlertModel/alert_model.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              await showAlertDialog(
                context: context,
                text: 'Heyy',
                description: 'Are you sure you want to logout',
                buttonText1: 'cancel',
                buttonText2: 'yes',
                onTapped: () {
                  Navigator.of(context).pop();
                },
                onTapped1: () {
                  ref.watch(authProvider.notifier).logOut(context);
                    Navigator.of(context).pop();
                },
              );
            },
            icon: const Icon(FontAwesomeIcons.signOut),
          ),
        ],
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) => const Text('Hello'),
        ),
      ),
    );
  }
}
