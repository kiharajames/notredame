import 'dart:io';

import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:notredame/includes/colors.dart';

// import '../player/PlayingControls.dart';
// import '../player/PositionSeekWidget.dart';
// import '../player/SongsSelector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notredame/firebase/firebaseAPI.dart';
import 'package:notredame/firebase/firebase_file.dart';
import 'package:notredame/includes/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

import 'includes/public.dart';

class LoadFiles extends StatefulWidget {
  const LoadFiles({Key? key}) : super(key: key);

  @override
  _LoadFilesState createState() => _LoadFilesState();
}

class _LoadFilesState extends State<LoadFiles> {
  late Future<List<FirebaseFile>> futureVideos;
  late Future<List<FirebaseFile>> futureAudio;
  int fileNo = 0;
  late int itemsLength;
  int downloadOk = 1;
  int downloading = 0;

  Future ensureFlutterInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  downloadFiles() {
    futureAudio.then((value) {
      setState(() {
        itemsLength = value.length;
      });
      getdir().then((path) {
        value.forEach((fil) {
          final file = File('$path/${fil.ref.name}');
          fil.ref.writeToFile(file).whenComplete(() {
            setState(() {
              fileNo += 1;
            });
            if (fileNo == itemsLength) {
              recordDownloadStatus();
              Navigator.pushReplacementNamed(context, '/categories');
            } else {
              // setState(() {
              //   downloadOk = 0;
              // });
            }
          });

          //print(file.ref.toString());
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    futureAudio = FirebaseApi.listAll('assets');
  }

  Future getdir() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  recordDownloadStatus() async {
    SharedPreferences downloaded = await SharedPreferences.getInstance();
    downloaded.setString('downloaded', 'yes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: colorPrimary),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  child: Text(
                    'Telecharger des fichiers',
                  ),
                  color: colorPrimaryAlt,
                  onPressed: () {
                    //getdir().then((value) => print(value.path));
                    //CheckConn.checkConn();
                    setState(() {
                      downloading = 1;
                    });
                    downloadFiles();
                  }),
              downloading == 1 ? CircularProgressIndicator() : Container(),
              fileNo > 0
                  ? Text(
                      'Télécharger...',
                      style: TextStyle(
                          color: titleColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  : Container(),
              fileNo > 0
                  ? Text(
                      '$fileNo/$itemsLength' + ' fichiers',
                      style: TextStyle(
                          color: titleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  : Container(),
              downloadOk == 0
                  ? Text('There could be a problem downloading the files...')
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
