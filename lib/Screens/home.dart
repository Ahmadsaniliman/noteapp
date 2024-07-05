// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/AlertModel/alert_model.dart';
import 'package:myfirstnotebook/Firebase/Auth/auth_provider.dart';
import 'package:myfirstnotebook/Firebase/Note/note.dart';
import 'package:myfirstnotebook/Firebase/Note/notes_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Note note;
    final notesPovider = ref.watch(notesProvider);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: notesPovider.when(data: (data) {
          if (data.isEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(),
                    ),
                  ),
                  //   title: Text(),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No Notes Please create new notes'),
            );
          }
        }, error: (_, __) {
          return const Center(
            child: Text('Error!!!'),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
