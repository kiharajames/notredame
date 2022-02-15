import 'package:flutter/material.dart';
import 'package:notredame/includes/colors.dart';

class Readtext extends StatefulWidget {
  final Text? audioText;

  const Readtext({Key? key, this.audioText}) : super(key: key);

  @override
  _ReadtextState createState() => _ReadtextState();
}

class _ReadtextState extends State<Readtext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        iconTheme: IconThemeData(color: white),
        backgroundColor: colorPrimary,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.audioText!,
          ),
        ),
      ),
    );
  }
}
