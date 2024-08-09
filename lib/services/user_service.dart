import 'package:airplane/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance
      });
    } catch (e) {
      throw e;
    }
  }

  // Hydrate Data User Active in App
  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshotUser = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshotUser['email'],
        name: snapshotUser["name"],
        hobby: snapshotUser['hobby'],
        balance: snapshotUser['balance'],
      );
    } catch (e) {
      throw e;
    }
  }
}
