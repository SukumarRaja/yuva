// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:limitless.eelon/screens/home_screen.dart';
import 'package:limitless.eelon/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/navigationBarProvider.dart';
import '../helpers/Constant.dart';
import '../screens/main_screen.dart';
import '../widgets/admob_service.dart';
import '../provider/theme_provider.dart';
import 'app/services/notifications.dart';
import 'app/ui/screens/on_board.dart';
import 'screens/main_screen_bottom_bar.dart';

final navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  initMessaging();
  var token = await FirebaseMessaging.instance.getToken();
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("fcm", "$token");
  print("fcm token is $token");
  if (showInterstitialAds) {
    AdMobService.initialize();
  }

  int counter = 0;
  SharedPreferences.getInstance().then((prefs) {
    prefs.setInt('counter', counter);
    var isDarkTheme =
        prefs.getBool("isDarkTheme") ?? ThemeMode.system == ThemeMode.dark
            ? true
            : false;
    return runApp(
      ChangeNotifierProvider<ThemeProvider>(
        child: MyApp(),
        create: (BuildContext context) {
          return ThemeProvider(isDarkTheme);
        },
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    if (showSplashScreen) {
      // startTimer();
    }
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return Timer(
        duration,
        () => navigatorKey.currentState!.pushReplacement(MaterialPageRoute(
            builder: (_) =>
                showBottomNavigationBar ? MainScreen() : MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      /* start--commnet  below 2 lines to enable landscape mode */
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
      /*end */
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationBarProvider>(
            create: (_) => NavigationBarProvider())
      ],
      child: Consumer<ThemeProvider>(builder: (context, value, child) {
        return GetMaterialApp(
          title: appName,
          debugShowCheckedModeBanner: false,
          themeMode: value.getTheme(),
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          navigatorKey: navigatorKey,
          // home: showBottomNavigationBar ? MainScreen() : MyHomePage(),
          home: OnBoarding(),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case 'home':
                return MaterialPageRoute(builder: (_) => HomeScreen());
              case 'settings':
                return MaterialPageRoute(builder: (_) => SettingsScreen());
            }
            return null;
          },
        );
      }),
    );
  }
}
