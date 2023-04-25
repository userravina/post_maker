import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}
class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.white24])),),
          title: Text(" post Maker ", style: GoogleFonts.alikeAngular(color: Colors.white,fontSize: 20),),backgroundColor: Colors.pink.shade500,),
        backgroundColor: Colors.pink.shade50,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "insta");
                  },
                  child: Button("Instagram")),
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, "linkedin");
              },
                  child: Button("Linkedin")),
              GestureDetector(onTap: () {
                Navigator.pushNamed(context, 'simple');
              },child: Button("Simple"),),
            ],
          ),
        ),
      ),
    );
  }

  Container Button(String item) {
    return Container(
      height: 60,
      width: 200,
      alignment: Alignment.center,
      child: Text(
          "$item", style: GoogleFonts.pacifico(fontSize: 20,color: Colors.white)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(blurRadius: 3,offset: Offset(-1.4,10))],
        gradient: LinearGradient(colors: [Colors.black26, Colors.pink.shade300,],),),
    );
  }

}