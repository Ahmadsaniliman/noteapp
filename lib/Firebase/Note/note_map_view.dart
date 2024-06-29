import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:myfirstnotebook/Firebase/FieldNames/firebase_field_names.dart';

@immutable
class NoteMapView extends MapView<String, dynamic> {
  NoteMapView({
    required String id,
    required String title,
    required String noteText,
  }) : super(
          {
            FireBaseFieldNames.nodeId: id,
            FireBaseFieldNames.noteTile: title,
            FireBaseFieldNames.noteText: noteText,
          },
        );
}
