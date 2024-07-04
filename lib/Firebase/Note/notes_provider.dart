import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/Firebase/FieldNames/firebase_collection_names.dart';
import 'package:myfirstnotebook/Firebase/FieldNames/firebase_field_names.dart';
import 'package:myfirstnotebook/Firebase/Note/note.dart';
import 'package:myfirstnotebook/Provider/user_id_provider.dart';

final notesProvider = StreamProvider<Iterable<Note>>(
  (ref) {
    final userId = ref.watch(userIdProvider);
    final controller = StreamController<Iterable<Note>>();
    controller.sink.add(
      [],
    );

    final sub = FirebaseFirestore.instance
        .collection(CollectionNames.notes)
        .where(FireBaseFieldNames.userId, isEqualTo: userId)
        .snapshots()
        .listen(
      (snappshots) {
        final document = snappshots.docs;
        final note = document.where((doc) => doc.metadata.hasPendingWrites).map(
              (note) => Note(
                id: note.id,
                json: note.data(),
              ),
            );

        controller.sink.add(note);
      },
    );

    ref.onDispose(
      () {
        sub.cancel();
        controller.close();
      },
    );
    return controller.stream;
  },
);
