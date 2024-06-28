import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class Note {
  final String id;
  final String title;
  final String noteText;

  Note({
    String? id,
    required this.title,
    required this.noteText,
  }) : id = id ?? const Uuid().v4();

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

  factory Note.fromMap(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as String,
      title: json['title'] as String,
      noteText: json['noteText'] as String,
    );
  }

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);
}
