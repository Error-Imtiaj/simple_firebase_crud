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
  List<people> data = [];
  Future<void> fetch() async {
    isload = true;
    setState(() {});
    List<people> myDt = await Firestore.getAllData();
    for (var person in myDt) {
      data.add(person);
      print(person);
    }
    isload = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: "SHOW DATA",
      ),
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
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            '${data[index].firstName.toString()} ${data[index].lastName.toString()}',
                            style: TextStyle(color: AppColor.blue),
                          ),
                          subtitle: Text(
                              '${data[index].age.toString()} - ${data[index].email.toString()}'),
                          trailing: IconButton(
                              onPressed: () {
                                // todo implement data id 
                                //showSheet(UpdateData(id:))
                              }, icon: Icon(Icons.edit)),
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
