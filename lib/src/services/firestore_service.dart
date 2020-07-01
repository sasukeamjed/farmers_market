import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmersmarket/src/models/user.dart';

class FirestoreService{
  Firestore _db = Firestore.instance;

  Future<void> addUser(User user){
    return _db.collection('users').document(user.userId).setData(user.toMap());
  }

  Future<User> fetchUser(String userId){
    return _db.collection('users').document(userId).get().then((snapshot) => User.fromFireStore(snapshot.data));
  }
}