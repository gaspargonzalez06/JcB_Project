import 'dart:html';
import 'package:charts_flutter/flutter.dart';
import "package:flutter_application_1/pages/produ1.dart";
import "package:flutter_swiper/flutter_swiper.dart";
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/reciber.dart';
import 'package:flutter_application_1/pages/selector.dart';
import 'package:flutter_application_1/pages/updater.dart';
import "package:carousel_slider/carousel_slider.dart";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JcB',
      theme: ThemeData(
        highlightColor: Colors.red,
        primarySwatch:Colors.orange, 
      ),
      initialRoute:"receiver",
      routes: {
        "receiver":(BuildContext context) => ReceiverPage(),
        "selector":(BuildContext context) => SelectorPage(),
        "updater":(BuildContext context) => UpdaterPage(),
        "home":(BuildContext context) => HomePage(),
        "3CX":(BuildContext context) => Product_3CXPage(),


      } ,
      
    );
  }
}



  











      
          
            
  
    

