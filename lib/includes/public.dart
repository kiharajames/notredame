//import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

//check for a connection in all the fields
// class CheckConn {
//   static bool? result;
//   static Future<bool> checkConn() async {
//     result = await DataConnectionChecker().hasConnection;
//     if (result != true) {
//       Fluttertoast.showToast(
//           msg: "No internet connection...",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 2,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//       result = result;
//       return false;
//     } else {
//       result = result;
//       return true;
//     }
//   }
// }

getDir() {
  final dir = getApplicationDocumentsDirectory();
  return dir;
}

class MysteryFields {
  String? audioFile;
  String? videoFile;
  Text? audioText;
  String? title;
  int? textNo;
  int? maxAudio;
  int? minAudio;
  MysteryFields(
      {this.audioFile,
      this.audioText,
      this.textNo,
      this.title,
      this.videoFile,
      this.minAudio,
      this.maxAudio});
}
