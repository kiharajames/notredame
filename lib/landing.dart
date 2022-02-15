import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notredame/includes/colors.dart';
import 'package:notredame/main.dart';
import 'package:notredame/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'http://www.diocesedejoliette.org';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
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
    super.initState();
    // moveToNext();
  }

  // void moveToNext() {
  //   Timer(Duration(seconds: 3), handleTimeout());
  // }

  // handleTimeout() {
  //   Navigator.pushNamed(context, '/home');
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/cathedrale.jpg'),
              fit: BoxFit.fitHeight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Prier le Rosaire avec Ozias Leduc',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                checkingTheSavedData();
              },
              child: Text(
                '      Entrer    ',
              ),
              style: ElevatedButton.styleFrom(primary: colorPrimary),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _launchURL();
              },
              child: Text('      Site web    '),
              style: ElevatedButton.styleFrom(primary: colorPrimary),
            )
          ],
        ),
      ),
    );
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
