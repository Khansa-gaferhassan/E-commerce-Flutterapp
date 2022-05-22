import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_nosa/models/userModel.dart';

class UserFireStore {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
}
