import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soudboard',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer player;

  @override
  void initState() {
    fetchAudio();
    player = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text("Play"),
              onPressed: startPlaying,
            ),
            RaisedButton(
              onPressed: () => player.stop(),
              child: Text("Stop"),
            )
          ],
        ),
      ),
    );
  }

  void startPlaying() async {
    String localDir = (await getApplicationDocumentsDirectory()).path;
    player.play("$localDir/hobbits.mp3", isLocal: true);
  }

  void fetchAudio() async {
    String localDir = (await getApplicationDocumentsDirectory()).path;
    final file = File("$localDir/hobbits.mp3");
    final asset =
        await PlatformAssetBundle().load("assets/audio/concerning_hobbits.mp3");
    file.writeAsBytes(asset.buffer.asUint8List());
  }
}
