import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myfirstnotebook/Firebase/Note/note.dart';

final notesProvider = StreamProvider<Iterable<Note>>(
  (ref) {
    final controller = StreamController<Iterable<Note>>();
    controller.sink.add(
      [],
    );
    ref.onDispose(
      () {
        controller.close();
      },
    );
    return controller.stream;
  },
);
