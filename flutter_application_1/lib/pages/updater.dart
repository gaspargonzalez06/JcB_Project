import 'package:flutter/material.dart';

class UpdaterPage extends StatefulWidget {
  UpdaterPage():super();
  @override
  UpdaterPageState createState()=> UpdaterPageState();
}

class UpdaterPageState extends  State<UpdaterPage> {
 
 
  int _current=0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text("Seleccione Equipo a cotizar"),
        backgroundColor: Colors.black
      ),
      body:Column(
        children: [
          Container(
            
            child: Text("hello word updater"),
            )

          
        ]
          
        )
    );
        
    
  }
}