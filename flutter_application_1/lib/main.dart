import 'dart:html';
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
        
        primarySwatch: Colors.orange,
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



  



final  List imgList=["assets/3cxb.jpg",
     "assets/4cx1.jpg",
     "assets/455zx.jpg",
     "assets/icxrev.jpg",
     "assets/533.105Rev.jpg",
     "assets/SSl205.jpg",
     "assets/JS205Lc.jpg",
     "assets/Js220lc.jpg"];









      
          
            
  
    

class pagina3 extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        
        title: Text("widget.title"),
        backgroundColor: Colors.orange
      ),
      body:Column(
        children: [
          Container(
            color: Colors.white,

            alignment: Alignment.topLeft,
            child: Text ("Equipos JCB",style: TextStyle(fontSize: 20, color: Colors.black),
        textScaleFactor: 1,),
          ),
          Container(
            child:Row(
              children:[
                Container(child: Text("aqui va la descripcion "),

                ),
                Container(child: Column(
                  children: [
                    Container(child: Text("aqui va el cuadro 1 de la fila "),)
                    ],),)
                
                ]

              ),

          

            ),
  

        
          Container(
            color: Colors.blue,
            child: Text("Aqui van los botones"),),

          

        ],
        )
        
      );
      
       // This trailing comma makes auto-formatting nicer for build methods.
    
  }
}


