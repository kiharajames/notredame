import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:notredame/includes/colors.dart';
import 'package:path_provider/path_provider.dart';
import '../player/PlayingControls.dart';
import '../player/PositionSeekWidget.dart';
import '../player/SongsSelector.dart';

class Visitation extends StatefulWidget {
  const Visitation({Key? key}) : super(key: key);

  @override
  _VisitationState createState() => _VisitationState();
}

class _VisitationState extends State<Visitation> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  bool _play = true;
  Directory? mydir;

  getDir() async {
    final dir = await getApplicationDocumentsDirectory();
    setState(() {
      mydir = dir;
    });
  }

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Audio("${mydir?.path}/visitation.mp3"),
      autoStart: false,
    );
    getDir();
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visitation'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/cathedrale.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    color: colorPrimary,
                    onPressed: () {
                      setState(() {
                        _play = !_play;
                      });
                      _play
                          ? assetsAudioPlayer.play()
                          : assetsAudioPlayer.pause();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.play_circle_outline_sharp),
                        Text('ENTENDRE')
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  MaterialButton(
                    color: colorPrimary,
                    onPressed: () {
                      Navigator.pushNamed(context, '/mystere_text');
                    },
                    child: Row(
                      children: [Icon(Icons.message_outlined), Text('LIRE')],
                    ),
                  ),
                ],
              ),
            ),
            Column(children: [
              AudioWidget.assets(
                path: "",
                child: IconButton(
                  icon: Icon(
                    _play ? Icons.pause_circle : Icons.play_circle,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      _play = !_play;
                    });
                    _play
                        ? assetsAudioPlayer.play()
                        : assetsAudioPlayer.pause();
                  },
                ),
                onReadyToPlay: (duration) {
                  //onReadyToPlay
                },
                onPositionChanged: (current, duration) {
                  //onPositionChanged
                },
              ),
              assetsAudioPlayer.builderRealtimePlayingInfos(
                  builder: (context, RealtimePlayingInfos? infos) {
                if (infos == null) {
                  return SizedBox();
                }
                //print('infos: $infos');
                return Column(
                  children: [
                    PositionSeekWidget(
                      currentPosition: infos.currentPosition,
                      duration: infos.duration,
                      seekTo: (to) {
                        assetsAudioPlayer.seek(to);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            assetsAudioPlayer.seekBy(Duration(seconds: -10));
                          },
                          icon: Icon(Icons.replay_10),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        IconButton(
                            onPressed: () {
                              assetsAudioPlayer.seekBy(Duration(seconds: 10));
                            },
                            icon: Icon(Icons.forward_10))
                      ],
                    )
                  ],
                );
              }),
            ])
          ],
        ),
      ),
    );
  }
}
