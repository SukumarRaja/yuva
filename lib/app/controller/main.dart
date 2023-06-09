import 'package:get/get.dart';

int statusCode = 0;

class MainController extends GetxController {
  static MainController get to => Get.put(MainController());

  final _pageIndex = 2.obs;

  get pageIndex => _pageIndex.value;

  set pageIndex(value) {
    _pageIndex.value = value;
  }

  final _isAnnasThalam = false.obs;

  get isAnnasThalam => _isAnnasThalam.value;

  set isAnnasThalam(value) {
    _isAnnasThalam.value = value;
  }
}
