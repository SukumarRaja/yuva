import 'package:shared_preferences/shared_preferences.dart';

const appName = 'Chandran Yuva';

const String appbartitle = 'Chandran Yuva';
const String andoidPackageName = 'chandrans.yuva';
String? id = "";

getId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  id = pref.getString('studentId');
  print("id is $id");
}

//change this url to set your URL in app
// String webinitialUrl = 'https://www.codecanyon.net';
String webinitialUrl = 'https://app.workstation360.org/admin/';
String annasthalamUrl = 'https://www.chandransyuva.com/';
const String firstTabUrl = 'https://app.workstation360.org/admin/clients';
const String annasFirstTabUrl = 'https://www.chandransyuva.com/contact-us/';

//keep local content of pages of setting screen
const String callLogsUrl =
    '';
const String webSiteUrl = '';
const String termsPageURL = '';

//Change App id of android and IOS app
const String androidAppId = andoidPackageName;

const String iOSAppId = '';

const String shareAppTitle = appName;
const String shareiOSAppMessage = '';
const String shareAndroidAppMessge =
    'Download $appName App from this link : http://play.google.com/store/apps/details?id=$androidAppId';

//To turn on/off ads
const bool showInterstitialAds = true;
const bool showBannerAds = false;

//To turn on/off display of bottom navigation bar
const bool showBottomNavigationBar = true;

//To show/remove splash screen
const bool showSplashScreen = true;

//to enable/disable prtrait mode
const bool enablePortraitMode = false;

//To remove/display header/footer of website
const bool hideHeader = false;
const bool hideFooter = false;

//Ids for interstitial Ad
const androidInterstitialAdId = 'ca-app-pub-3940256099942544/1033173712';
const iosInterstitialAdId = 'ca-app-pub-3940256099942544/4411468910';

//Ids for banner Ad
const androidBannerAdId = 'ca-app-pub-3940256099942544/6300978111';
const iosBannerAdId = 'ca-app-pub-3940256099942544/2934735716';

//icon to set when get firebase messages
const String messageIcon = '@mipmap/ic_launcher_round';

//copy your  one-signal android app id
const oneSignalAndroidAppId = '3bd63fe4-c0b6-4103-9a82-f9fa9ef48979';

//copy your  one-signal ios app id
const oneSignalIOSAppId = '';

const String iconPath = 'assets/icons/';
