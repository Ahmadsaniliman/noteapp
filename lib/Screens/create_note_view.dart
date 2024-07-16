import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateNoteView extends ConsumerWidget {
  const CreateNoteView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController noteController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              children: [
                const Text(
                  'Title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Your note here',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Note',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  width: double.infinity,
                  child: TextField(
                    controller: noteController,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
