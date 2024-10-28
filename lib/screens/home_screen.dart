import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:simple_firebase_crud/auth%20services/auth_services.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';
import 'package:simple_firebase_crud/widgets/app_appbar.dart';
import 'package:simple_firebase_crud/widgets/material_button.dart';

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
              ontap: () {},
              buttonName: "READ",
              buttonColor: AppColor.amberacc,
            ),
            const Gap(10),
            AppMaterialButton(
              ontap: () {},
              buttonName: "WRITE",
              buttonColor: AppColor.blue,
            ),
            const Gap(10),
            AppMaterialButton(
              ontap: () {},
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
              ontap: () async{
                await AuthServices.signOut();
                setState(() {});
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
