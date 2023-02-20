import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:limitless.eelon/app/controller/fcm.dart';
import 'package:limitless.eelon/app/ui/screens/login.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/main_screen_bottom_bar.dart';
import '../data/repository/auth.dart';
import '../ui/widgets/common_alert.dart';
import '../ui/widgets/common_print.dart';
import '../ui/widgets/common_snackbar.dart';
import 'main.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  final repository = AuthRepository();

  final loginKey = GlobalKey<FormState>();

  // login textController
  TextEditingController lEmail = TextEditingController();
  TextEditingController lPassword = TextEditingController();

  final _loginLoading = false.obs;

  get loginLoading => _loginLoading.value;

  set loginLoading(value) {
    _loginLoading.value = value;
  }

  setOnBoardDataAfterScreenCompleted() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("on_boarding", "onBoarding");
    var onBoard = preferences.getString('on_boarding');
    debugPrint("on boarding data $onBoard");
    await Get.off(() => const Login());
    return onBoard;
  }

  storeLocalDevice({required Map body}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    body.forEach((key, value) {
      debugPrint('index=$key, value=$value');
      preferences.setString(key, value);
    });
  }

  loginCheck() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('studentId');
    debugPrint("studentId $token");
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  checkOnBoarding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('on_boarding');
    if (token == null) {
      return true;
    } else {
      return false;
    }
  }

  login() async {
    loginLoading = true;
    var body = {"email": lEmail.text.trimRight(), "password": lPassword.text};
    try {
      var res = await repository.login(body: body);
      if (statusCode == 200) {
        if (res['status'] == "200") {
          loginLoading = false;
          commonPrint(status: res['status'], msg: res['message']);
          Map storedData = {"studentId": "${res['student_id']}"};
          storeLocalDevice(body: storedData);
          FcmController.to.updateFcm();
          Get.off(() => MainScreen());
          commonSnackBar(title: "Success", msg: "Login Successfully");
          // loginFieldsEmpty();
        } else if (res['status'] == "422") {
          loginLoading = false;
          commonPrint(
              status: res['status'],
              msg: "${res['message']}\nEmail or Password Wrong");
          errorAlert(Get.context!,
              content: "${res['message']}\nEmail or Password Wrong",
              confirmButtonPressed: () {
            Get.back();
          });
        }
      } else {
        loginLoading = false;
        commonPrint(status: "500", msg: "Error from server or No Internet");
      }
    } catch (e) {
      loginLoading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from login due to data mismatch or format $e");
    }
  }
}
