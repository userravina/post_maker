import 'package:flutter/material.dart';
import 'package:post_maker/Home_Screen/Home_Screen.dart';
import 'package:post_maker/insta_Screen/insta_info.dart';
import 'package:post_maker/linkedin_Screen/linkedin_info.dart';
import 'package:post_maker/linkedin_Screen/linkedin_post.dart';
import 'package:post_maker/simple_Screen/Simple_Screen.dart';
import 'package:post_maker/simple_Screen/simple_info.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Home_Screen(),
      "insta": (context) => Insta(),
      "linkedin": (context) => linkedin(),
      "link_post": (context) => lin_post(),
      "simple": (context) => DigitalMart(),
      "s": (context) => DMPost(),
    },
  ));
}
