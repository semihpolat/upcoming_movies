import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_project/logic/controller/auth_controller.dart';
import 'package:movies_project/logic/controller/user_controller.dart';
import 'package:movies_project/view/auth/login.dart';
import 'package:movies_project/view/movies_list_view.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return MoviesListView();
        } else {
          return Login();
        }
      },
    );
  }
}
