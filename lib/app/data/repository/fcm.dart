import 'dart:convert';

import '../../services/api.dart';
import '../../services/http_service.dart';
import '../model/fcm.dart';

class FcmRepository {
  static final HttpHelper helper = HttpHelper();

  Future<FcmUpdateRes> fcmUpdate({required body}) async {
    var response = await helper.post(url: ApiService.updateFcm, body: body);
    FcmUpdateRes res = FcmUpdateRes.fromMap(jsonDecode(response));
    return res;
  }
}
