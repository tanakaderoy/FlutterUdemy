import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

// ignore: must_be_immutable
class XylophoneApp extends StatelessWidget {
  final notes = [1, 2, 3, 4, 5, 6, 7];
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple
  ];

  void playSound(int n) async{
    print(n);
    final player = AudioCache();
    await player.play('note$n.wav');
  }

  Widget renderKeyButtons(List<int> nums) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: notes
          .map(
            (n) => Expanded(
              child: new FlatButton(
                child: null,
                  onPressed: ()  {
                   playSound(n);
                  },
                  color: colors[n - 1]),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: renderKeyButtons(notes),
        ),
      ),
    );
  }
}
