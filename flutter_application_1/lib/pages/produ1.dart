import 'package:flutter/material.dart';

class Product_3CXPage extends StatefulWidget {
  Product_3CXPage():super();
  @override
  Product_3CXPageState createState()=> Product_3CXPageState();
}

class Product_3CXPageState extends  State<Product_3CXPage> {
 
 
  int _current=0;
  double _currentSliderValue= 250;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text("Seleccione Equipo a cotizar"),
        backgroundColor: Colors.black
      ),
      body:Container(
        width: 450,
        height: 450,
        child: Container(
            color: Colors.black54,
            child:Column(
              children:<Widget>[
                Text("3CX"),
                Image.asset("assets/3CX.jpg",alignment: Alignment.center,width: 400,),
                Row(
                  
                  children: [
                    
                  Text("Seleccione horas "),
                  _crearCard1()
                  ],) 
                ,
              ],
              
            )
            ),
            

          
        
          
        )
    );
        
    
  }
  Widget _crearCard1(){

    
    return Container(
      width: 300,
      child: Column(
        children:<Widget>[
          Slider(
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
        ],

      ),
      ); 
  
  }
}