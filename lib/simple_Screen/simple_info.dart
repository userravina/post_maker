import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:post_maker/simple_Screen/simple_modal.dart';

class DMPost extends StatefulWidget {


  const DMPost({Key? key}) : super(key: key);

  @override
  State<DMPost> createState() => _DMPostState();
}

class _DMPostState extends State<DMPost> {
  String? nfonts;
  double nsize = 15;
  Color? c1;
  List<Color> color = [
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.amber,
    Colors.orange,
    Colors.indigo,
    Colors.yellow,
    Colors.pink,
    Colors.purple,
    Colors.cyan,
    Colors.teal,
    Colors.brown,
    Colors.red,
  ];
  List FontList = [
    'Font1',
    'Font2',
    'Font3',
    'Font4',
    'Font5',
    'Font6',
    'Font7',
    'Font8',
    'Font9',
    'Font10',
    'Font11',
  ];
  GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    DMart d = ModalRoute.of(context)!.settings.arguments as DMart;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text(
            "Post",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(onPressed: () async {
              RenderRepaintBoundary boundary =  _globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
              var image = await boundary.toImage();
              ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
              Uint8List uint8List = byteData!.buffer.asUint8List();
              print(uint8List);

              await ImageGallerySaver.saveImage(uint8List);


            }, icon: Icon(Icons.download))
          ],
        ),
        body: RepaintBoundary(
          key:_globalKey,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 400,
                  width: double.infinity,
                  child: Image.asset("assets/images/fes.jpg", fit: BoxFit.fill),
                ),
              ),
              Align(
                alignment: Alignment(-0.78, 0),
                child: Container(
                    height: 270,
                    width: 145,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(40)),
                    child: d.img1 == null
                        ? ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Image.asset('assets/images/profile.jpg',
                            fit: BoxFit.fill))
                        : ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Image.file(
                          File('${d.img1}'),
                          fit: BoxFit.fill,
                        ))),
              ),
              Align(
                  alignment: Alignment(0.9, -0.29),
                  child: Text(
                    "Digital",
                    style: TextStyle(
                        fontSize: 35, fontFamily: 'Font1', color: Colors.white),
                  )),
              Align(
                  alignment: Alignment(0.9, -0.18),
                  child: Text(
                    "MARKETINK",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  )),
              Align(
                  alignment: Alignment(0.9, -0.1),
                  child: Text(
                    "AGENCY",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Align(
                  alignment: Alignment(0.9, 0.05),
                  child: Text(
                    "Larem ipsum dolor sit ament\nadippiscing elit,sed do eiusmod incididunt\nut labore et dolore",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  )),
              Align(
                  alignment: Alignment(0.4, 0.2),
                  child: Text(
                    "MARKETING & SALES",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Align(
                  alignment: Alignment(0.94, 0.2),
                  child: Text(
                    "SOLUTIONS",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  )),
              Align(
                  alignment: Alignment(0.4, 0.25),
                  child: Text(
                    "TO GROW",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  )),
              Align(
                  alignment: Alignment(0.94, 0.25),
                  child: Text(
                    "YOUR BUSINESS",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Align(
                alignment: Alignment(0.9, -0.55),
                child: Container(
                    height: 50,
                    width: 50,
                    decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                    child: d.img1 == null
                        ? CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.jpg'),
                    )
                        : CircleAvatar(
                      backgroundImage: FileImage(File('${d.img}')),
                    )),
              ),
              Align(
                alignment: Alignment(-0.95, 0.5),
                child: Container(
                  height: 32,
                  width: 150,
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 30,
                        child: Icon(
                          Icons.call,
                          color: Colors.amber,
                          size: 25,
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "For more information",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              "${d.no}",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: nfonts,
                                  color: c1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.9, 0.5),
                child: Container(
                  height: 32,
                  width: 150,
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${d.web}",
                              style: TextStyle(
                                  fontSize: 10, fontFamily: nfonts, color: c1),
                            ),
                            Text(
                              "VISIT OUR WEBSITE",
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 32,
                        width: 30,
                        child: Icon(
                          Icons.language,
                          color: Colors.amber,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment(-0.7, -0.55),
                  child: Text(
                    '${d.name}',
                    style: TextStyle(fontSize: nsize, fontFamily: nfonts, color: c1),
                  )),
              Align(
                  alignment: Alignment(-0.9, 0.7),
                  child: Text(
                    "Font style",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Align(
                alignment: Alignment(-0.9, 0.85),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              nfonts = FontList[index];
                            });
                          },
                          child: Container(
                              height: 50,
                              margin: EdgeInsets.all(10),
                              child: Text("${FontList[index]}",style: TextStyle(fontFamily: FontList[index]),)));
                    },
                    itemCount: FontList.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment(-0.9, -1),
                  child: Text(
                    "Font Color",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Align(
                alignment: Alignment(-0.9, -0.9),
                child: SizedBox(
                  height: 70,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              c1 = color[index];
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: color[index],
                            ),
                          ));
                    },
                    itemCount: color.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment(-0.9, 0.87),
                  child: Text(
                    "Font size",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              Align(
                alignment: Alignment(0,1),
                child: SizedBox(
                  height: 50,
                  child: Slider(
                    value: nsize,
                    label: "$nsize",
                    min: 15,
                    max: 30,
                    divisions: 10,
                    onChanged: (value) {
                      setState(() {
                        nsize = value;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}