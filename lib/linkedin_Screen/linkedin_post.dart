import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:post_maker/linkedin_Screen/linkedin_model.dart';

class lin_post extends StatefulWidget {
  const lin_post({Key? key}) : super(key: key);

  @override
  State<lin_post> createState() => _lin_postState();
}

class _lin_postState extends State<lin_post> {
  GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Linkedin d = ModalRoute .of(context)!.settings.arguments as Linkedin;
    return SafeArea(
      child: Scaffold(appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.white24])),),
        title: Text(" Linkedin Post Designer ", style: GoogleFonts.alikeAngular(color: Colors.white,fontSize: 20),),backgroundColor: Colors.pink.shade500, actions: [
        IconButton(
          icon: Icon(Icons.download_for_offline_outlined),
          iconSize: 25,
          color: Colors.tealAccent,
          onPressed: () async {
            RenderRepaintBoundary boundary = _globalKey.currentContext!
                .findRenderObject()! as RenderRepaintBoundary;
            var image = await boundary.toImage();
            ByteData? byteData =
            await image.toByteData(format: ImageByteFormat.png);
            Uint8List uint8List = byteData!.buffer.asUint8List();
            print(uint8List);

            await ImageGallerySaver.saveImage(uint8List);
          },
        ),
      ],),backgroundColor: Colors.pink.shade50,
        body:   RepaintBoundary(
    key: _globalKey,child:Stack(
          alignment: Alignment.center,
          children: [
          Row(
              children:[ Container(
                height: 350,
                width: 350,
                color: Colors.black12,child:
              Stack(
                children:[ Column(
                    children: [
                      Container(height: 350,width: 360,
                          decoration: BoxDecoration(color: Colors.grey,),),

                    ],
                  ), Container(height: 210,width: 360,
                  decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(600),bottomRight: Radius.circular(600),),),),Container(height: 200,width: 360,
                 decoration: BoxDecoration(color: Colors.pink,gradient: LinearGradient(colors:[Colors.black, Colors.white24,Colors.pink.shade200,Colors.pink], ),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(600),bottomRight: Radius.circular(600),),),),
                  Padding(padding: EdgeInsets.only(top: 200),child: Container(height: 250,decoration: BoxDecoration(color: Colors.pink.shade50,borderRadius: BorderRadius.only(topLeft: Radius.circular(300),topRight: Radius.circular(300),),),))
                ],
              ),
              ),],
            ),
            Container(alignment: Alignment(-0.0,-0.0),child:  CircleAvatar(
              radius: 60,
              backgroundImage: FileImage(File("${d.image}")),
            ),),
            Padding( padding: EdgeInsets.only(top: 140,left: 8),child: Text("Name :- ${d.name}",style: GoogleFonts.cabin(color: Colors.black))),
            Padding( padding: EdgeInsets.only(top: 180,left: 8),child: Text("Address :- ${d.address}",style: GoogleFonts.cabin(color: Colors.black))),
            Padding( padding: EdgeInsets.only(top: 260,left: 8),child: Text("Connection :- ${d.connection}",style: GoogleFonts.cabin(color: Colors.black))),
            Padding( padding: EdgeInsets.only(top: 300,left: 8),child: Text("Follower :- ${d.follower}",style: GoogleFonts.cabin(color: Colors.black))),
            Padding(padding: EdgeInsets.only(left: 8,top: 220),child: Text("Education :- ${d.education}",style: GoogleFonts.cabin(color: Colors.black))),

          ],),
      ),
      ),
    );
  }
}