import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/fcm.dart';

class FcmController extends GetxController {
  static FcmController get to => Get.put(FcmController());

  final repository = FcmRepository();

  final _loading = false.obs;

  get loading => _loading.value;

  set loading(value) {
    _loading.value = value;
  }

  updateFcm() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString('studentId');
    var fcm = pref.getString('fcm');
    var body = {"student_id": "$id", "token": "$fcm"};

    try {
      var res = await repository.fcmUpdate(body: body);
      if (res.status == "200") {
        debugPrint("fcm token update successfully");
        debugPrint("${res.message}");
      } else {
        debugPrint("fcm token not updated due to error");
      }
    } catch (e) {
      debugPrint("Error from server on fcm token update $e");
    }
  }
}
