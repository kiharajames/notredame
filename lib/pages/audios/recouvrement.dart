import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:notredame/includes/colors.dart';
import 'package:notredame/includes/public.dart';
import 'package:video_player/video_player.dart';
import '../../player/PlayingControls.dart';
import '../../player/PositionSeekWidget.dart';
import '../../player/SongsSelector.dart';

class Recouvrement extends StatefulWidget {
  const Recouvrement({Key? key}) : super(key: key);

  @override
  _RecouvrementState createState() => _RecouvrementState();
}

class _RecouvrementState extends State<Recouvrement> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  bool _play = false;
  late VideoPlayerController _controller;
  Directory? mydir = getDir();

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Audio("${mydir?.path}/recouvrement.mp3"),
      autoStart: false,
      audioFocusStrategy:
          AudioFocusStrategy.request(resumeAfterInterruption: false),
      playInBackground: PlayInBackground.enabled,
    );
    // assetsAudioPlayer.open(
    //     Playlist(audios: [
    //       Audio("assets/audio/annonciation.mp3"),
    //     ]),
    //     loopMode: LoopMode.playlist //loop the full playlist
    //     );

    // assetsAudioPlayer.next();
    // assetsAudioPlayer.previous();
    // assetsAudioPlayer.playlistPlayAtIndex(0);
    // // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset(
        "${mydir?.path}/5-recouvrement.mp4",
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    assetsAudioPlayer.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jésus enseigne au Temple (le recouvrement)'),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: _controller.value.size.width,
            height: _controller.value.size.height,
            child: VideoPlayer(_controller),
          ),
          Container(
            color: Colors.transparent,
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
                          Navigator.pushNamed(context, '/recouvrement_text');
                        },
                        child: Row(
                          children: [
                            Icon(Icons.message_outlined),
                            Text('LIRE')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Column(children: [
                //   AudioWidget.assets(
                //     path: "",
                //     child: IconButton(
                //       icon: Icon(
                //         _play ? Icons.pause_circle : Icons.play_circle,
                //         size: 40,
                //       ),
                //       onPressed: () {
                //         setState(() {
                //           _play = !_play;
                //         });
                //         _play
                //             ? assetsAudioPlayer.play()
                //             : assetsAudioPlayer.pause();
                //       },
                //     ),
                //     onReadyToPlay: (duration) {
                //       //onReadyToPlay
                //     },
                //     onPositionChanged: (current, duration) {
                //       //onPositionChanged
                //     },
                //   ),
                //   assetsAudioPlayer.builderRealtimePlayingInfos(
                //       builder: (context, RealtimePlayingInfos? infos) {
                //     if (infos == null) {
                //       return SizedBox();
                //     }
                //     //print('infos: $infos');
                //     return Column(
                //       children: [
                //         PositionSeekWidget(
                //           currentPosition: infos.currentPosition,
                //           duration: infos.duration,
                //           seekTo: (to) {
                //             assetsAudioPlayer.seek(to);
                //           },
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             IconButton(
                //               onPressed: () {
                //                 assetsAudioPlayer.seekBy(Duration(seconds: -10));
                //               },
                //               icon: Icon(Icons.replay_10),
                //             ),
                //             SizedBox(
                //               width: 12,
                //             ),
                //             IconButton(
                //                 onPressed: () {
                //                   assetsAudioPlayer.seekBy(Duration(seconds: 10));
                //                 },
                //                 icon: Icon(Icons.forward_10))
                //           ],
                //         )
                //       ],
                //     );
                //   }),
                // ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
