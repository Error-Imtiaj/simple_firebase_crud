import 'package:flutter/material.dart';
import 'package:simple_firebase_crud/dataModel/prople.dart';
import 'package:simple_firebase_crud/firestore%20services/firestore.dart';
import 'package:simple_firebase_crud/screens/update_data.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';
import 'package:simple_firebase_crud/utils/bottomsheet.dart';
import 'package:simple_firebase_crud/widgets/app_appbar.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  bool isload = false;
  List<Map<String, dynamic>> dataWithIds =
      []; // List to store both data and IDs

  Future<void> fetch() async {
    setState(() {
      isload = true;
    });
    dataWithIds = await Firestore.getAllData();
    setState(() {
      isload = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> deleteData(String docId) async {
    await Firestore.deleteData(docId); // Call delete function with ID
    fetch(); // Refresh data after deletion
  }
  // Future<void> update(String docId) async {
  //   await Firestore.updateData(docId, ); // Call delete function with ID
  //   fetch(); // Refresh data after deletion
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(title: "SHOW DATA"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: !isload,
                replacement: CircularProgressIndicator(),
                child: Expanded(
                  child: ListView.builder(
                      itemCount: dataWithIds.length,
                      itemBuilder: (context, index) {
                        final person = dataWithIds[index]['data'] as people;
                        final docId = dataWithIds[index]['id'] as String;

                        return ListTile(
                          title: Text(
                            '${person.firstName} ${person.lastName}',
                            style: TextStyle(color: AppColor.blue),
                          ),
                          subtitle: Text('${person.age} - ${person.email}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Edit functionality can go here
                                  showSheet(UpdateData(
                                    id: dataWithIds[index]['id'],
                                    firstName: person.firstName,
                                    lastName: person.lastName,
                                    email: person.email,
                                    age: person.age,
                                    fetch: fetch,
                                  ));
                                },
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () =>
                                    deleteData(docId), // Call delete
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
