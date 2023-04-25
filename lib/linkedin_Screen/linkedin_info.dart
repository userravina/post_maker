import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_maker/linkedin_Screen/linkedin_model.dart';

class linkedin extends StatefulWidget {
  const linkedin({Key? key}) : super(key: key);

  @override
  State<linkedin> createState() => _linkedinState();
}

class _linkedinState extends State<linkedin> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtcurrentposition = TextEditingController();
  TextEditingController txtcurrentcompany = TextEditingController();
  TextEditingController txtaddress = TextEditingController();
  TextEditingController txteducation = TextEditingController();
  TextEditingController txtconnection = TextEditingController();
  TextEditingController txtfollower = TextEditingController();
  TextEditingController txttagline = TextEditingController();
  TextEditingController txtlifemoto = TextEditingController();

  String? photo;
  String? bgphoto;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.black, Colors.white24])),
          ),
          title: Text(
            " Linkedin Post Designer ",
            style: GoogleFonts.alikeAngular(color: Colors.white, fontSize: 20),
          ),
          backgroundColor: Colors.pink.shade500,
        ),
        backgroundColor: Colors.pink.shade50,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Upload \n Profile Image",
                      style: GoogleFonts.damion(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {
                        getimage();
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                            border: Border.all(color: Colors.teal, width: 3),
                            image: DecorationImage(
                              image: FileImage(File("$photo")),
                              fit: BoxFit.fill,
                            )),
                        child: Icon(Icons.camera_alt_outlined, size: 50),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Textediting(
                    hint: "Enter Name ",
                    controller: txtname,
                    kboard: TextInputType.text),
                Textediting(
                    hint: "Enter Address in short ",
                    controller: txtaddress,
                    kboard: TextInputType.streetAddress),
                Textediting(
                    hint: "Enter Maximum Education Name ",
                    controller: txteducation,
                    kboard: TextInputType.text),
                Textediting(
                    hint: "Enter Total Connections ",
                    controller: txtconnection,
                    kboard: TextInputType.number),
                Textediting(
                    hint: "Enter Total Followers ",
                    controller: txtfollower,
                    kboard: TextInputType.number),
                ElevatedButton(
                  onPressed: () {
                    Linkedin data = Linkedin(
                      name: txtname.text,
                      image: photo,
                      address: txtaddress.text,
                      follower: txtfollower.text,
                      connection: txtconnection.text,
                      education: txteducation.text,
                    );
                    Navigator.pushNamed(context, "link_post", arguments: data);
                  },
                  child: Text("Create", style: GoogleFonts.alike(fontSize: 20)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getimage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white70,
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              "Add Photo",
              style: TextStyle(color: Colors.pink.shade500),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () async {
                ImagePicker img = ImagePicker();
                XFile? xfile = await img.pickImage(source: ImageSource.camera);
                setState(() {
                  photo = xfile!.path;
                });
              },
              child: ListTile(
                leading: Icon(Icons.camera_alt_outlined),
                title: Text(
                  "Add Photo",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                ImagePicker img = ImagePicker();
                XFile? xfile = await img.pickImage(source: ImageSource.gallery);
                setState(() {
                  photo = xfile!.path;
                });
              },
              child: ListTile(
                leading: Icon(
                  Icons.select_all,
                  size: 30,
                ),
                title: Text(
                  "From Galary",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }

  Widget Textediting(
      {TextEditingController? controller,
      TextInputType? kboard,
      String? hint}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: kboard,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(fontSize: 15),
          enabled: true,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
