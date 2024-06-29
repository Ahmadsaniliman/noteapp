import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:myfirstnotebook/Firebase/FieldNames/firebase_field_names.dart';

@immutable
class UserInfoPayLoad extends MapView<String, dynamic> {
  UserInfoPayLoad({required String email})
      : super(
          {
            FireBaseFieldNames.userEmail: email,
          },
        );
}
