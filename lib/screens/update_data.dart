import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:simple_firebase_crud/dataModel/prople.dart';
import 'package:simple_firebase_crud/firestore%20services/firestore.dart';
import 'package:simple_firebase_crud/screens/show_data.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';
import 'package:simple_firebase_crud/utils/navigator.dart';
import 'package:simple_firebase_crud/widgets/app_text_field_widget.dart';
import 'package:simple_firebase_crud/widgets/material_button.dart';

class UpdateData extends StatefulWidget {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? age;
  final Function? fetch;
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
  late final TextEditingController _fnamectrl;
  late final TextEditingController _lnamectrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _ageCtrl;
  bool _isReload = false;

  @override
  void initState() {
    super.initState();
    _fnamectrl = TextEditingController(text: widget.firstName ?? "");
    _lnamectrl = TextEditingController(text: widget.lastName ?? "");
    _emailCtrl = TextEditingController(text: widget.email ?? "");
    _ageCtrl = TextEditingController(text: widget.age?.toString() ?? "");
  }

  @override
  void dispose() {
    _fnamectrl.dispose();
    _lnamectrl.dispose();
    _emailCtrl.dispose();
    _ageCtrl.dispose();
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
              textEditingController: _fnamectrl,
            ),
            Gap(10),
            AppTextFieldWidget(
              hintText: "Last Name",
              textEditingController: _lnamectrl,
            ),
            Gap(10),
            AppTextFieldWidget(
              hintText: "Email",
              textEditingController: _emailCtrl,
            ),
            Gap(10),
            AppTextFieldWidget(
              hintText: "Age",
              textEditingController: _ageCtrl,
            ),
            Gap(10),
            Visibility(
              visible: !_isReload,
              replacement: Center(
                child: CircularProgressIndicator(),
              ),
              child: AppMaterialButton(
                ontap: () async {
                  await _updateData(widget.id);
                  navigateTo(ShowData());
                },
                buttonName: "SAVE",
                buttonColor: AppColor.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateData(String docid) async {
    setState(() {
      _isReload = true;
    });
    try {
      await Firestore.updateData(
        people(
          firstName: _fnamectrl.text,
          lastName: _lnamectrl.text,
          age: int.tryParse(_ageCtrl.text),
          email: _emailCtrl.text,
        ),
        dataId: docid,
      );
      widget.fetch!();
    } finally {
      setState(() {
        _isReload = false;
      });
      Navigator.pop(context);
    }
  }
}
