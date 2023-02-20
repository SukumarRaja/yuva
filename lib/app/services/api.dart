import '../config/config.dart';

class ApiService {
  // auth
  static const login = "${AppConfig.baseUrl}action=login";
  static const register = "${AppConfig.baseUrl}action=register";

  //fcm
  static const updateFcm = "${AppConfig.baseUrl}action=updateToken";

}
