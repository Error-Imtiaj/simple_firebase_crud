import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_firebase_crud/utils/app_color.dart';

void showSheet(Widget widget) {
  Get.bottomSheet(widget, backgroundColor: AppColor.white);
}
