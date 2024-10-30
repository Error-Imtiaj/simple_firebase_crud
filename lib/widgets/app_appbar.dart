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
  bool _isLight = true;
  void toggleTheme() {
    if (_isLight) {
      Get.changeTheme(ThemeData.light());
      _isLight = false;
    } else {
      Get.changeTheme(ThemeData.dark());
      _isLight = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title ?? 'Title'),
      actions: [
        IconButton.filled(
          onPressed: () {
            toggleTheme();
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
