import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myfirstnotebook/Firebase/FieldNames/firebase_collection_names.dart';
import 'package:myfirstnotebook/Firebase/FieldNames/firebase_field_names.dart';
import 'package:myfirstnotebook/Firebase/User/user_info_pay_load.dart';
import 'package:myfirstnotebook/TypeDefs/user_id.dart';

class SaveUserInfo {
  const SaveUserInfo();

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
        await userInfo.docs.first.reference.update(
          {
            FireBaseFieldNames.userEmail: email,
          },
        );
        return true;
      } else {
        final userPayLoad = UserInfoPayLoad(email: email);
        await FirebaseFirestore.instance
            .collection(CollectionNames.users)
            .add(userPayLoad);
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
