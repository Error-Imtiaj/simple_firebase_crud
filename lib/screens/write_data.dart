import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:simple_firebase_crud/dataModel/prople.dart';
import 'package:simple_firebase_crud/firestore%20services/firestore.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';
import 'package:simple_firebase_crud/widgets/app_text_field_widget.dart';
import 'package:simple_firebase_crud/widgets/material_button.dart';

class WriteData extends StatefulWidget {
  const WriteData({super.key});

  @override
  State<WriteData> createState() => _WriteDataState();
}

class _WriteDataState extends State<WriteData> {
  final TextEditingController fnamectrl = TextEditingController();
  final TextEditingController lnamectrl = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController age = TextEditingController();
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
              textEditingController: email,
            ),
            Gap(10),
            AppTextFieldWidget(
              hintText: "Age",
              textEditingController: age,
            ),
            Gap(10),
            AppMaterialButton(
              ontap: () {
                _addData();
              },
              buttonName: "SAVE",
              buttonColor: AppColor.blue,
            ),
          ],
        ),
      ),
    );
  }

  void _addData() {
    Firestore.addData(
      people(
        firstName: fnamectrl.text,
        lastName: lnamectrl.text,
        age: int.tryParse(age.text),
        email: email.text,
      ),
    );
  }
}
