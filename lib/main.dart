import 'dart:io';

import 'package:Muhasebe/screen/urunlist.dart';
import 'package:Muhasebe/screen/loginui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'controller/allcontrollerbindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  var islog = sp.getBool("islogin" ?? false);
  HttpOverrides.global = new MyHttpOverrides();
  //SharedPreferences sp = await SharedPreferences.getInstance();
  // var islog = sp.getBool("islogin");

  runApp(GetMaterialApp(
      initialBinding: AllControllerBinding(),
      //locale: DevicePreview.locale(context), // Add the locale here
      //  builder: DevicePreview.appBuilder,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('tr'), // English, no country code
      ],
      //  locale: const Locale('tr'),
      title: 'Klon Muhasebe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: islog == true ? Urunli() : Loginui()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // initializeDateFormatting('tr');
    return GetMaterialApp(
        initialBinding: AllControllerBinding(),
        //locale: DevicePreview.locale(context), // Add the locale here
        //  builder: DevicePreview.appBuilder,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('tr'), // English, no country code
        ],
        //  locale: const Locale('tr'),
        title: 'Klon Muhasebe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Urunli());
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
