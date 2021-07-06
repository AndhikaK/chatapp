// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User _currentUser = FirebaseAuth.instance.currentUser;

  Future addUser(String name) async {
    CollectionReference _users = _firestore.collection('users');

    return _users.doc(name).set({
      'name': name,
      'email': name,
      'about': 'Hello Apps',
      'createdAt': DateTime.now()
    });
  }

  Future addGoogleRegisteredUser(email) async {
    CollectionReference _users = _firestore.collection('users');

    return _users.doc(email).set({
      'name': _currentUser.displayName,
      'email': email,
      'about': 'Hello Apps',
      'createdAt': DateTime.now()
    });
  }

  Future editUser(String email, String name, String about) async {
    CollectionReference _users = _firestore.collection('users');

    return _users.doc(email).update({
      'name': name,
      'about': about,
    });
  }

  Future<String> getAbout(String email) async {
    DocumentReference documentReference = _firestore.doc(email);
    String about;
    await documentReference.get().then((snapshot) {
      about = snapshot.data().toString();
    });
    return about;
  }
}
