// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  // FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _users = FirebaseFirestore.instance.collection('users');
  Future addUser(String name) {
    return _users
        .add({
          //
          'name': name,
          'email': name,
          'about': 'Hello Apps',
          'createdAt': DateTime.now()
        })
        .then((value) => print("User Added"))
        .catchError((onError) => print('Failed to add user: $onError'));
  }
}
