import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';
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
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton.filled(
              onPressed: () {
                Get.changeTheme(ThemeData.dark());
                setState(() {});
              },
              icon: const Icon(
                Icons.sunny,
                color: Colors.white,
              ))
        ],
      ),
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
          ],
        ),
      ),
    );
  }
}
