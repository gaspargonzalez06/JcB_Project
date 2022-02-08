import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/selector.dart';
class ReceiverPage extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text("JCB"),
        backgroundColor: Colors.black
      ),
      body:Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Container(

          width: 450.0,
          height: 450.0,
          
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          color: Colors.white,
          child: ElevatedButton(
            
            child:Image.asset("assets/logo.jpg") ,
            onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> SelectorPage(),
              ));

          },
          ),
          
          
          
            
  
        ),
        Container(
          child: Text("Seleccione sobre la imagen para ver los Equipos"),
        )
          
        ]
        
      )
      ),
      );
      
       // This trailing comma makes auto-formatting nicer for build methods.
    
  }
}