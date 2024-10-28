import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  const AppAppbar({super.key, this.title});

  @override
  State<AppAppbar> createState() => _AppAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}

class _AppAppbarState extends State<AppAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title ?? 'Title'),
      actions: [
        IconButton.filled(
          onPressed: () {
            Get.changeTheme(ThemeData.dark());
            setState(() {});
          },
          icon: const Icon(
            Icons.sunny,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
