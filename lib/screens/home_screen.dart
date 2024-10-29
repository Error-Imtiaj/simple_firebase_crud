import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:simple_firebase_crud/auth%20services/auth_services.dart';
import 'package:simple_firebase_crud/screens/show_data.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';
import 'package:simple_firebase_crud/utils/bottomsheet.dart';
import 'package:simple_firebase_crud/utils/navigator.dart';
import 'package:simple_firebase_crud/widgets/app_appbar.dart';
import 'package:simple_firebase_crud/widgets/material_button.dart';
import 'package:simple_firebase_crud/screens/write_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppMaterialButton(
              ontap: () {
                navigateTo(ShowData());
              },
              buttonName: "SHOW",
              buttonColor: AppColor.amberacc,
            ),
            const Gap(10),
            AppMaterialButton(
              ontap: () {
                showSheet(WriteData());
              },
              buttonName: "WRITE",
              buttonColor: AppColor.blue,
            ),
            const Gap(10),
            AppMaterialButton(
              ontap: () {
                navigateTo(ShowData());
              },
              buttonName: "UPDATE",
              buttonColor: AppColor.amber,
            ),
            const Gap(10),
            AppMaterialButton(
              ontap: () {},
              buttonName: "DELETE",
              buttonColor: AppColor.red,
            ),
            const Gap(10),
            AppMaterialButton(
              ontap: () async {
                await AuthServices.signOut();
              },
              buttonName: "LOG OUT",
              buttonColor: AppColor.red,
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
