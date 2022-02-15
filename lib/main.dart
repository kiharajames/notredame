import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notredame/includes/colors.dart';
import 'package:notredame/route_generator.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: maincolor, statusBarIconBrightness: Brightness.light));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: colorPrimary,
        accentColor: colorPrimaryAlt,
        fontFamily: 'Montserrat'),
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
