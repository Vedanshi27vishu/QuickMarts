import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:flutter_native_splash/flutter_native_splash.dart';
//import 'package:ecommerce/utils/constants/colors.dart';
int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance(); //store the data locally in the device.
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  await Firebase.initializeApp();
  //  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBindingl-0: widgetsBinding);
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => ,);
  runApp(const MyApp());
  //initialRoute: initScreen==0||initScreen==null?'onboard':'home',  //  FlutterNativeSplash.remove();
}

