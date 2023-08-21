



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_update_http_2_flutter/themes.dart';

class ThemeController extends GetxController {
  Rx<ThemeData> appTheme = Rx(Themes.lightTheme);

  changeTheme(ThemeData theme) {
    appTheme.value = theme;
    update();
  }
}