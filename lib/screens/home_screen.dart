import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

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
        title: Text("Home"),
        actions: [
          IconButton.filled(
              onPressed: () {
                Get.changeTheme(ThemeData.dark());
                setState(() {});
              },
              icon: Icon(
                Icons.sunny,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {},
              child: Text("READ"),
              color: Colors.amberAccent,
            ),
            Gap(10),
            MaterialButton(
              onPressed: () {},
              child: Text("WRITE"),
              color: Colors.blue,
            ),
            Gap(10),
            MaterialButton(
              onPressed: () {},
              child: Text("UPDATE"),
              color: Colors.amber,
            ),
            Gap(10),
            MaterialButton(
              onPressed: () {},
              child: Text("Delete"),
              color: Colors.red,
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
