import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  checkingTheSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('downloaded');
    if (username != 'yes') {
      Navigator.pushNamed(context, '/loadfiles');
    } else {
      Navigator.pushNamed(context, '/categories');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {})
        .then((value) => checkingTheSavedData());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/splash.png',
              ),
              fit: BoxFit.fill)),
    );
  }
}
