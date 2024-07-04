import 'package:flutter/material.dart';
import 'package:myfirstnotebook/Firebase/FieldNames/firebase_field_names.dart';
import 'package:uuid/uuid.dart';

@immutable
class Note {
  final String id;
  final String title;
  final String noteText;

  @override
  bool operator ==(covariant Note other) =>
      identical(other, this) ||
      id == other.id ||
      title == other.title ||
      noteText == other.noteText;

  @override
  int get hashCode => Object.hashAll(
        [
          id,
          title,
          noteText,
        ],
      );

  @override
  String toString() => 'Note (id:$id, title:$title, noteText:$noteText)';

  Note({
    required this.id,
    required Map<String, dynamic> json,
  })  : title = json[FireBaseFieldNames.noteTile],
        noteText = json[FireBaseFieldNames.noteText];

  // factory Note.fromJson(String source) =>
  //     Note.fromMap(json.decode(source) as Map<String, dynamic>);
}
