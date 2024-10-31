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

  // get data with docs id
  static Future<List<Map<String, dynamic>>> getAllData() async {
    List<Map<String, dynamic>> myData = [];
    QuerySnapshot snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('data')
        .get();

    myData = snapshot.docs.map((doc) {
      var data = people.fromMap(doc.data() as Map<String, dynamic>);
      return {'data': data, 'id': doc.id}; // Include document ID
    }).toList();

    return myData;
  }

  // upadete data
  static Future<void> updateData(people updateModel, {String? dataId}) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('data')
        .doc(dataId)
        .update(
          updateModel.toMap(),
        );
  }

  static Future<void> deleteData(String dataId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('data')
        .doc(dataId)
        .delete();
  }
}
