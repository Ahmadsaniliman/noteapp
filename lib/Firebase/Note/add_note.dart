import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/Firebase/FieldNames/firebase_collection_names.dart';
import 'package:myfirstnotebook/Firebase/Note/note.dart';
import 'package:myfirstnotebook/Firebase/Note/note_map_view.dart';
import 'package:myfirstnotebook/TypeDefs/user_id.dart';

class AddNote extends StateNotifier<Note> {
  AddNote() : super([] as Note);

  Future<void> addNote({
    required UserId userId,
    required String title,
    required String noteText,
  }) async {
    final notePayoad = NoteMapView(
      // id: id,
      title: title,
      noteText: noteText,
    );

    await FirebaseFirestore.instance
        .collection(CollectionNames.notes)
        .add(notePayoad);
  }
}
