import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tou_caro_app/providers/car_info_provider.dart';
import '../providers/destination_provider.dart';
import './screens/home_screen.dart';
import './screens/splash_screen.dart';
import 'package:provider/provider.dart';

bool seenOnboard;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // to show status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  // to load onboard for the first time only
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: () => MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
          value: Destinations(),
        ),
        ChangeNotifierProvider.value(
          value: InfoCarProvider(),
        ),
          ],
          child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Tou Caro',
                theme: ThemeData(
                  primarySwatch: Colors.amber,
                  //fontFamily: 'Montserrat',
                ),
                home: seenOnboard == true ? SplashScreen() : HomeScreen(),
              ),
        ));
  }
}
 