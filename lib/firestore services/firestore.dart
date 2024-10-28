import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_firebase_crud/dataModel/prople.dart';

class Firestore {
  // INSTANCE
  static final _firestore = FirebaseFirestore.instance;

  static final userId = FirebaseAuth.instance.currentUser?.uid;

  // ADD DATA
  static Future<void> addData(people model) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('data')
        .add(model.toMap());
  }

  // get data
  static Future<List<people>> getAllData() async {
    List<people> myData = [];
    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('data')
        .get();
    myData = snapshot.docs
        .map((doc) => people.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
    return myData;
  }
}
