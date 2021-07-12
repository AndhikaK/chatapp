// import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User _currentUser = FirebaseAuth.instance.currentUser;

  Future addUser(String name) async {
    CollectionReference _users = _firestore.collection('users');

    return _users.doc(name).set({
      'name': name,
      'email': name,
      'profile-img': "",
      'about': 'Hello Apps',
      'createdAt': DateTime.now(),
    });
  }

  Future addGoogleRegisteredUser(email) async {
    CollectionReference _users = _firestore.collection('users');

    return _users.doc(email).set({
      'name': _currentUser.displayName,
      'email': email,
      'about': 'Hello Apps',
      'createdAt': DateTime.now(),
      'profile-img': "",
    });
  }

  Future editUser(String email, String name, String about) async {
    CollectionReference _users = _firestore.collection('users');

    return _users.doc(email).update({
      'name': name,
      'about': about,
    });
  }

  Future editProfileImg(String imgUrl) async {
    CollectionReference _users = _firestore.collection('users');

    return _users.doc(_currentUser.email).update({
      'profile-img': imgUrl,
    });
  }

  Future editSignature(String signature) async {
    CollectionReference _users = _firestore.collection('users');

    return _users.doc(_currentUser.email).update({
      'about': signature,
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

  sendMessage(
      String message, String sender, String receiver, String profileImg) async {
    CollectionReference _chatroom = _firestore
        .collection('users')
        .doc(sender)
        .collection('chatrooms')
        .doc(receiver)
        .collection('chat');

    return _chatroom.doc().set({
      'sender': sender,
      'receiver': receiver,
      'message': message,
      'createdAt': DateTime.now(),
      'profile-img': profileImg
    });
  }

  receiveMessage(
      String message, String sender, String receiver, String profileImg) async {
    CollectionReference _chatroom = _firestore
        .collection('users')
        .doc(receiver)
        .collection('chatrooms')
        .doc(sender)
        .collection('chat');

    return _chatroom.doc().set({
      'sender': sender,
      'receiver': receiver,
      'message': message,
      'createdAt': DateTime.now(),
      'profile-img': profileImg
    });
  }

  sendMessage2(String lastMessage, String myEmail, String partnerEmail,
      String profileImg) async {
    DocumentReference _chatroom = _firestore
        .collection('users')
        .doc(myEmail)
        .collection('chatrooms')
        .doc(partnerEmail);

    return _chatroom.set({
      'myEmail': myEmail,
      'partnerEmail': partnerEmail,
      'lastMessage': lastMessage,
      'lastMessageTime': DateTime.now(),
      'partnerProfile-img': profileImg
    });
  }

  receiveMessage2(String lastMessage, String myEmail, String partnerEmail,
      String profileImg) async {
    DocumentReference _chatroom = _firestore
        .collection('users')
        .doc(partnerEmail)
        .collection('chatrooms')
        .doc(myEmail);

    return _chatroom.set({
      'myEmail': partnerEmail,
      'partnerEmail': myEmail,
      'lastMessage': lastMessage,
      'lastMessageTime': DateTime.now(),
      'partnerProfile-img': profileImg
    });
  }

  /// Membuat Chat Room
  createChatRoom(String chatRoomId, Map chatRoomInfoMap) async {
    final snapShot = await FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .get();

    if (snapShot.exists) {
      // chatroom sudah ada
      return true;
    } else {
      // chatroom belum ada
      return FirebaseFirestore.instance
          .collection("chatrooms")
          .doc(chatRoomId)
          .set(chatRoomInfoMap);
    }
  }

  ///Mengembalikan Chatroom sesuai user
  Future<Stream<QuerySnapshot>> getChatRooms() async {
    String myEmail = _currentUser.email;
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .orderBy("antrian")
        .where("users", arrayContains: myEmail)
        .snapshots();
  }

  ///Menambahkan Pesan
  Future addMessage(
      String chatRoomId, String messageId, Map massageInfoMap) async {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("chats")
        .doc(messageId)
        .set(massageInfoMap);
  }

  ///Mengupdate document dengan informasi pesan terakhir
  updateLastMessageSend(String chatRoomId, lastMessageInfoMap) {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .update(lastMessageInfoMap);
  }

  Future<Stream<QuerySnapshot>> getChatRoomMessages(chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy("ts", descending: true)
        .snapshots();
  }

  static Future<String> uploadImage(File imageFIle) async {
    String fileName = basename(imageFIle.path);
    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    UploadTask task = ref.putFile(imageFIle);
    TaskSnapshot snapshot = await task;
    return await snapshot.ref.getDownloadURL();
  }

  Future addContact(Map<String, dynamic> data) async {
    CollectionReference _users = _firestore
        .collection('users')
        .doc(_currentUser.email)
        .collection('friends');

    return _users.doc(data['email']).set({
      'name': data['name'],
      'email': data['email'],
      'profile-img': data['profile-img'],
      'about': data['about'],
      'createdAt': DateTime.now(),
    });
  }

  /// Menghapus pesan
  Future deleteInfoChat(String chatRoomId) {
    return FirebaseFirestore.instance
        .collection('chatrooms')
        .doc(chatRoomId)
        .delete()
        .then((value) => print("Chat Deleted"))
        .catchError((error) => print("Failed to delete chat: $error"));
  }

  Future deleteChat(String chatRoomId) {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    return FirebaseFirestore.instance
        .collection('chatrooms')
        .doc(chatRoomId)
        .collection('chats')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        batch.delete(document.reference);
      });
      return batch.commit();
    });
  }
}
