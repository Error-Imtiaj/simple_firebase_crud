import 'package:flutter/material.dart';
import 'package:gap/gap.dart'; // Update import if necessary
import 'package:simple_firebase_crud/dataModel/prople.dart';
import 'package:simple_firebase_crud/firestore%20services/firestore.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';
import 'package:simple_firebase_crud/widgets/app_text_field_widget.dart';
import 'package:simple_firebase_crud/widgets/material_button.dart';

class UpdateData extends StatefulWidget {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? age;
  final Future? fetch;
  const UpdateData({
    super.key,
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.age,
    this.fetch,
  });

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  late TextEditingController fnamectrl;
  late TextEditingController lnamectrl;
  late TextEditingController emailCtrl;
  late TextEditingController ageCtrl;

  @override
  void initState() {
    super.initState();
    fnamectrl = TextEditingController(text: widget.firstName ?? "");
    lnamectrl = TextEditingController(text: widget.lastName ?? "");
    emailCtrl = TextEditingController(text: widget.email ?? "");
    ageCtrl = TextEditingController(text: widget.age?.toString() ?? "");
  }

  @override
  void dispose() {
    fnamectrl.dispose();
    lnamectrl.dispose();
    emailCtrl.dispose();
    ageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppTextFieldWidget(
              hintText: "First Name",
              textEditingController: fnamectrl,
            ),
            Gap(10),
            AppTextFieldWidget(
              hintText: "Last Name",
              textEditingController: lnamectrl,
            ),
            Gap(10),
            AppTextFieldWidget(
              hintText: "Email",
              textEditingController: emailCtrl,
            ),
            Gap(10),
            AppTextFieldWidget(
              hintText: "Age",
              textEditingController: ageCtrl,
            ),
            Gap(10),
            AppMaterialButton(
              ontap: () {
                _updateData(widget.id);
              },
              buttonName: "SAVE",
              buttonColor: AppColor.blue,
            ),
          ],
        ),
      ),
    );
  }

  void _updateData(String docid) {
    Firestore.updateData(
      people(
        firstName: fnamectrl.text,
        lastName: lnamectrl.text,
        age: int.tryParse(ageCtrl.text),
        email: emailCtrl.text,
      ),
      dataId: docid,
    );
    widget.fetch!;
  }
}
