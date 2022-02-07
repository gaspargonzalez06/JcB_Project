import 'dart:js';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produ1.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage():super();
  @override
  HomePageState createState()=> HomePageState();
}

class HomePageState extends  State<HomePage> {
 
 
  int _current=0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text("Seleccione Equipo a cotizar"),
        backgroundColor: Colors.black
      ),
      body:Container(color: Colors.white,
      padding: EdgeInsets.all(50),
      
      
      child:Container(
        
        
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.all(20.0),
      child:GridView.count(
        
      
        crossAxisCount:3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        
          
          children:<Widget> [
            FractionallySizedBox(
              
            widthFactor: 1,
            heightFactor: 1,
            child: Container(
              color: Colors.white,
              child:ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> Product_3CXPage(),
                      ));
                  }, 
                child:_crearCard1())

              ),
            ),
            FractionallySizedBox(
              
            widthFactor: 1,
            heightFactor: 1,
            child: Container(
              color: Colors.white,
              child:ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> Product_3CXPage(),
                      ));
                  }, 
                child:_crearCard2())

              ),
            ),
                          
            
            _crearCard3(),
              _crearCard4(),
              _crearCard5(),
              _crearCard6(),
              _crearCard7(),
              _crearCard8(),
          
        ],
          
      
      ),
      )  
      )  
        );
        

      
         
     
    
        
    
  }
  Widget _crearCard1(){

    return Card(
      color: Colors.white,
      
      elevation: 800,

     
        
        
        child: Image.asset("assets/3CX.jpeg",fit: BoxFit.cover)
                  
                  
            

        
    );
//aqui termina el card


  }
    
    
  Widget _crearCard2(){

    return Card(
      elevation: 5,

      
           child: Image.asset("assets/4CX.jpeg"),
            
          


      
        );
        
  }
  Widget _crearCard3(){

    return Card(
      elevation: 5,

      child: Container(
        color:Colors.black45,
        child: Column(
          children:<Widget> [
            Text("455ZX"),
            Image.asset("assets/455ZX.jpg",alignment: Alignment.center,),
            SizedBox(height:20,),


        ],
        ),
        ),
    );
  }
  Widget _crearCard4(){

    return Card(
      elevation: 5,

      child: Container(
        child: Column(
          children:<Widget> [
            Text("1CX"),
            Image.asset("assets/1CX.jpg"),
            SizedBox(height:20,),


        ],
        ),
        ),
    );
  }
  Widget _crearCard5(){

    return Card(
      elevation: 5,

      child: Container(
        color: Colors.black45,
        child: Column(
          children:<Widget> [
            
            Image.asset("assets/533-105.jpg"),
            SizedBox(height:20,),
            


        ],
        ),
        ),
    );
  }
  Widget _crearCard6(){

    return Card(
      elevation: 5,

      child: Container(
        child: Column(
          children:<Widget> [
            Text("SSL205"),
            Image.asset("assets/SSL205.png"),
            SizedBox(height:20,),


        ],
        ),
        ),
    );
  }
  Widget _crearCard7(){

    return Card(
      elevation: 5,

      child: Container(
        color: Colors.black45,
        child: Column(
          children:<Widget> [
            
            Image.asset("assets/JS205.jpg"),
            SizedBox(height:20,),
            


        ],
        ),
        ),
    );
  }
  Widget _crearCard8(){

    return Card(
      elevation: 5,

      child: Container(
        child: Column(
          children:<Widget> [
            Text("JS220"),
            Image.asset("assets/JS220.jpg"),
            SizedBox(height:20,),


        ],
        ),
        ),
    );
  }
}