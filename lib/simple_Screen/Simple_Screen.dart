import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_maker/simple_Screen/simple_modal.dart';

class DigitalMart extends StatefulWidget {
  const DigitalMart({Key? key}) : super(key: key);

  @override
  State<DigitalMart> createState() => _DigitalMartState();
}

class _DigitalMartState extends State<DigitalMart> {
  String? propath;
  String? path;

  TextEditingController txtname = TextEditingController();
  TextEditingController txtno = TextEditingController();
  TextEditingController txtweb = TextEditingController();

  var txtkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Take photo"),
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          ImagePicker img = ImagePicker();
                                          XFile? xfile = await img.pickImage(
                                              source: ImageSource.camera);
                                          setState(() {
                                            propath = xfile!.path;
                                            Navigator.pop(context);
                                          });
                                         },
                                        child: Icon(Icons.camera_alt_outlined)),
                                    ElevatedButton(
                                        onPressed: () async {
                                          ImagePicker img = ImagePicker();
                                          XFile? xfile = await img.pickImage(
                                              source: ImageSource.gallery);
                                          setState(() {
                                            propath = xfile!.path;
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Icon(Icons.photo)),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          "Select the\n Profile Photo\n👆",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontFamily: 'Font1'),
                        )),
                    Container(
                        height: 250,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: propath == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: Image.asset('assets/images/profile.jpg',
                                    fit: BoxFit.fill))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: Image.file(
                                  File('$propath'),
                                  fit: BoxFit.fill,
                                ))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        height: 250,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: path == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: Image.asset(
                                  'assets/images/logo.jpg',
                                  fit: BoxFit.cover,
                                ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: Image.file(
                                  File('$path'),
                                  fit: BoxFit.fill,
                                ))),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Take hoto"),
                              content: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                      onPressed: () async {
                                         ImagePicker img = ImagePicker();
                                        XFile? xfile = await img.pickImage(
                                            source: ImageSource.camera);
                                        setState(() {
                                          path = xfile!.path;
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Icon(Icons.camera_alt_outlined)),
                                  ElevatedButton(
                                      onPressed: () async {
                                        ImagePicker img = ImagePicker();
                                        XFile? xfile = await img.pickImage(
                                                source: ImageSource.gallery)
                                            as XFile;
                                        setState(() {
                                          path = xfile!.path;
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Icon(Icons.photo)),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        "Select the\n Company Logo\n👆",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                            fontFamily: 'Font1'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter the Name";
                      }
                    },
                    controller: txtname,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Enter the Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter the no";
                      }
                    },
                    controller: txtno,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Enter the Contact No'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter the website";
                      }
                    },
                    controller: txtweb,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Enter the Website'),
                  ),
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    if (txtkey.currentState!.validate()) {
                      DMart d = DMart(
                          img: path,
                          name: txtname.text,
                          no: txtno.text,
                          web: txtweb.text);
                      Navigator.pushNamed(context, 's', arguments: d);
                    }
                  },
                  label: Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
