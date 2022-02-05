import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/updater.dart';
class SelectorPage extends StatefulWidget {
  SelectorPage():super();
  @override
  SelectorState createState()=> SelectorState();
}

class SelectorState extends  State<SelectorPage> {
 
 
  int _current=0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text("Seleccione Equipo a cotizar"),
        backgroundColor: Colors.black
      ),
      body:Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
        
        
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30.0),
          child: ElevatedButton(child: Text ("cotizar con precios actuales"),onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> HomePage(),
              ));

          },

        ),
        ),
        Container(
          
          alignment: Alignment.center,
          child: ElevatedButton(child: Text ("actualizar precios "),onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> UpdaterPage(),
              ));

          },

        ),
        )

        ]
          
          
        )
      ),
    );  
    
  }
}