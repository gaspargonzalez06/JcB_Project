import 'dart:js';
import 'package:flutter/rendering.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produ1.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:slimy_card/slimy_card.dart';

class HomePage extends StatefulWidget {
  HomePage():super();
  @override
  HomePageState createState()=> HomePageState();
}

class HomePageState extends  State<HomePage> {
 
 
  int _current=0;

  double _currentSliderValue= 500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text("Seleccione Equipo a cotizar"),
        backgroundColor: Colors.black
      ),
      body:Container(color: Colors.white,
      padding: EdgeInsets.all(40),
      
      
      child:Container(
        
        
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
      child:GridView.count(
        
      
        crossAxisCount:3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        
          
          children:<Widget> [
            
                 
              ListView(
  children: <Widget>[
    SlimyCard(
      color: Colors.orange,
      width: 350,
      topCardHeight: 300,
      bottomCardHeight: 120,
      borderRadius: 15,
      topCardWidget: _crearCard1(),
      bottomCardWidget: _crearSlider(),
      slimeEnabled: true,
    ),
    
    
  ],
),
  
                  FractionallySizedBox(
              
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Container(
                    color: Colors.white,
                    child:
                      ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> Product_3CXPage(),
                            ));
                        }, 
                      child:_crearCard1() )

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
                child:_crearCard3())

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
                child:_crearCard4())

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
                child:_crearCard5())

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
                child:_crearCard6())

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
                child:_crearCard7())

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
                child:_crearCard8())

              ),
            ),
          
        ],
          
      
      ),
      )  
      )  
        );
        

      
         
     
    
        
    
  }

  Widget _crearSlider(){

    return Container(
      child: Column(
        children:<Widget>[
          Row(children:<Widget>[Expanded(child:Column(children: <Widget>[Slider(
      value: _currentSliderValue,
      max: 6500,
      divisions: 26,
      
      
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    ),
    Text("${_currentSliderValue.round()}",style: TextStyle(color: Colors.white),)
    ],) )]),
          
        ],

      ),
    );
  }
  
  Widget _crearCard1(){

    return  Image.asset("assets/3CX.png");
             
           
    
//aqui termina el card


  }
    
    
  Widget _crearCard2(){

    return Card(
      elevation: 5,

      
           child: Image.asset("assets/4CX.png"),
            
          


      
        );
        
  }
  Widget _crearCard3(){

    return Card(
      elevation: 5,

      
          child:Image.asset("assets/455ZX.png")
            

       
    );
  }
  Widget _crearCard4(){

    return Card(
      elevation: 5,

      child: Image.asset("assets/1CX.png")
       
    );
  }
  Widget _crearCard5(){

    return Card(
      elevation: 5,

      child:
            
            Image.asset("assets/533-105.png"),
           
            


        
    );
  }
  Widget _crearCard6(){

    return Card(
      elevation: 5,

      child: 
            Image.asset("assets/SSL205.png"),
       
    );
  }
  Widget _crearCard7(){

    return Card(
      elevation: 5,

      child: 
            
            Image.asset("assets/JS205.png"),
           
            


      
    );
  }
  Widget _crearCard8(){

    return Card(
      elevation: 5,

      child: 
            
            Image.asset("assets/JS220.png"),
           

    );
  }
  
}