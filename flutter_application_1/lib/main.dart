import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bodyCotizar.dart';
import 'package:flutter_application_1/components/appbar.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_application_1/components/bodyCotizar.dart';
import 'package:flutter_application_1/components/loginPage.dart';
import 'package:flutter_application_1/components/pdf_page_return.dart';
import 'package:google_fonts/google_fonts.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', 
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: GoogleFonts.poppinsTextTheme(
         Theme.of(context).textTheme,
        ),
      ),
      //komentado por prueba 
      //theme: ThemeData(
       
        //primarySwatch: Colors.orange,
      //),
      home:MyHomePage(),
      initialRoute:"login",
      routes: {
        "login":(BuildContext context) => LoginPage(),
        "home":(BuildContext context) => MyHomePage(),
        
        
        "cotizar":(BuildContext context) => bodyCotizar(),
        
       

      } ,
    );
  }
}

class MyHomePage extends StatefulWidget {
 




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  
  @override
  Widget build(BuildContext context) {
   
    Size size = MediaQuery.of(context).size;
    return Container(decoration: BoxDecoration(
      image:DecorationImage( image:AssetImage("fondo.png"),
      fit: BoxFit.cover,
      
      ),
      ),
    
    child:Scaffold(
      backgroundColor: Colors.black45,
      
      body: SingleChildScrollView(
    
        child: Column(
          
          children:<Widget>[
            customAppBar(),
            Row(children:<Widget>[
              Flexible(flex: 1,child: Container(width: size.width,height: size.height*2,
                color: Colors.transparent,child: Text(""),),),
              Flexible(flex: 6,child: Container(child: bodyCotizar(),)),
              Flexible(flex: 1,child: Container(width: size.width,height: size.height*2,color: Colors.transparent,child: Text(""),),),

              ],),
  
            Container(color: Colors.white,height: size.height*0.25,width: size.width,
            child: Image.asset("images/main.jpg"),

            
            )
          ],
        ),
      ),
       
    
    ),
    );
  }
}




