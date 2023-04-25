import 'package:flutter/material.dart';
import 'package:stories_editor/stories_editor.dart';


class Insta extends StatefulWidget {
  const Insta({Key? key}) : super(key: key);

  @override
  State<Insta> createState() => _InstaState();
}

class _InstaState extends State<Insta> {

  List<Color> colorlist = [Colors.amber,Colors.yellow,Colors.green,Colors.white,Colors.red,Colors.pink,Colors.indigo,Colors.black,Colors.blue,Colors.lightBlueAccent,Colors.teal,Colors.tealAccent,Colors.orange,Colors.deepOrange,Colors.purpleAccent,Colors.deepPurple];

  List<List<Color>> gradientlist = [
    [Colors.red.shade100,Colors.red.shade300,Colors.red.shade500],
    [Colors.deepPurpleAccent,Colors.lightBlueAccent],
    [Colors.yellowAccent,Colors.teal],
    [Colors.teal,Colors.blue],
    [Colors.red.shade500,Colors.white60,Colors.red.shade700],
    [Colors.blueGrey,Colors.blue.shade100,Colors.blue.shade900],
    [Colors.orange,Colors.white,Colors.green],
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //SizedBox(height: 15),
              StoriesEditor(
                giphyKey:'C4dMA7Q19nqEGdpfj82T8ssbOeZIylD4',
                onDone: (a) {},
                colorList: colorlist,
                // fontFamilyList: fonts,
                gradientColors: gradientlist,
              ),
            ],
          ),
        ),
      ),
    );
  }
}