import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myfirstnotebook/Firebase/FieldNames/firebase_collection_names.dart';
import 'package:myfirstnotebook/Firebase/FieldNames/firebase_field_names.dart';
import 'package:myfirstnotebook/Firebase/User/user_info_pay_load.dart';
import 'package:myfirstnotebook/TypeDefs/user_id.dart';

class SaveUserMail {
  const SaveUserMail();

  Future<bool> saveUserEmail({
    required String email,
    required UserId userId,
  }) async {
    try {
      final userInfo = await FirebaseFirestore.instance
          .collection(CollectionNames.users)
          .where(FireBaseFieldNames.userId, isEqualTo: userId)
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        userInfo.docs.first.reference.update(
          {
            FireBaseFieldNames.userEmail: email,
          },
        );
        return true;
      }

      final userInfoPayLoad = UserInfoPayLoad(email: email);
      await FirebaseFirestore.instance
          .collection(CollectionNames.users)
          .add(userInfoPayLoad);
      return true;
    } catch (e) {
      return false;
    }
  }
}
