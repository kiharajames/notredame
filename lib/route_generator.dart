import 'package:flutter/material.dart';
import 'package:notredame/includes/public.dart';
import 'package:notredame/landing.dart';
import 'package:notredame/main.dart';
import 'package:notredame/pages/audios/audio_page.dart';
import 'package:notredame/pages/audios/read_text.dart';
import 'package:notredame/pages/categories.dart';
import 'package:notredame/pages/categories1.dart';
import 'package:notredame/pages/contacts.dart';
import 'package:notredame/pages/douloureux.dart';
import 'package:notredame/pages/entendretout.dart';
import 'package:notredame/pages/glorieux.dart';
import 'package:notredame/pages/home.dart';
import 'package:notredame/pages/joyeux.dart';
import 'package:notredame/pages/audios/nativite.dart';
import 'package:notredame/pages/audios/presentation_temple.dart';
import 'package:notredame/pages/audios/recouvrement.dart';
import 'package:notredame/pages/audios/visitation.dart';
import 'package:notredame/pages/texts/annonciation_text.dart';
import 'package:notredame/loadfiles.dart';
import 'package:notredame/splash_delay.dart';
import 'includes/colors.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splash());
      case ('/entendre_tout'):
        return MaterialPageRoute(builder: (_) => EntendreTout());
      case ('/loadfiles'):
        return MaterialPageRoute(builder: (_) => LoadFiles());
      case ('/joyeux'):
        return MaterialPageRoute(builder: (_) => Joyeux());
      case ('/douloureux'):
        return MaterialPageRoute(builder: (_) => Douloureux());
      case ('/glorieux'):
        return MaterialPageRoute(builder: (_) => Glorieux());
      case ('/landing'):
        return MaterialPageRoute(builder: (_) => LandingPage());
      case ('/categories1'):
        return MaterialPageRoute(builder: (_) => Prier());
      case '/annonciation_text':
        return MaterialPageRoute(builder: (_) => MysteresText());
      // return MaterialPageRoute(builder: (_) => Home());
      case ('/categories'):
        return MaterialPageRoute(builder: (_) => Categories());
      case ('/contacts'):
        return MaterialPageRoute(builder: (_) => Contacts());
      case ('/read_text'):
        var args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => Readtext(
                  audioText: args as Text,
                ));
      case '/audiopage':
        MysteryFields args = (settings.arguments) as MysteryFields;
        return MaterialPageRoute(
            builder: (_) => AudioPage(
                  audioFile: args.audioFile,
                  videoFile: args.videoFile,
                  textNo: args.textNo,
                  title: args.title,
                  audioText: args.audioText,
                  minAudio: args.minAudio,
                  maxAudio: args.maxAudio,
                ));
      case '/nativite':
        return MaterialPageRoute(builder: (_) => Nativite());
      case '/presentation_temple':
        return MaterialPageRoute(builder: (_) => Presentation());
      case '/recouvrement':
        return MaterialPageRoute(builder: (_) => Recouvrement());
      case '/visitation':
        return MaterialPageRoute(builder: (_) => Visitation());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: maincolor,
          iconTheme: IconThemeData(color: lightcolor),
          title: Text(
            'Error',
          ),
        ),
        body: Center(
          child: Text(
            'There has been an error',
          ),
        ),
      );
    });
  }
}
