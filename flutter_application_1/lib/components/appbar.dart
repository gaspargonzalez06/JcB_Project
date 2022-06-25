import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bodyCotizar.dart';

import 'package:flutter_application_1/main.dart';
import 'package:universal_html/prefer_universal/js_util.dart';

class customAppBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding:EdgeInsets.all(5),

      decoration: BoxDecoration (
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,-2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),

          ),
        ],
      ),
      child: Row(children: <Widget>[
        ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                 child:Image.asset("assets/logo.png",width:200,),
        ),
        SizedBox(width: 1),
        Spacer(),
        
        //Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
        //child: Text("Home".toUpperCase(),
         // style: TextStyle(color: Colors.black.withOpacity(0.7),fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
        //),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text("Gestionar Recursos".toUpperCase(),
          style: TextStyle(color: Colors.black.withOpacity(0.7),fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
        ),
        
        ClipRRect(
          
                  borderRadius: BorderRadius.circular(25),
                  child:  
                      FlatButton(child:Text("Cotizar Mantenimientos".toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),padding:EdgeInsets.symmetric(horizontal: 25,vertical: 25),color: Colors.orange.withOpacity(0.6),onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> MyHomePage()
              ));

          },

        ),         
        ),
        SizedBox(height: 20),
        Spacer(),
        ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child:
                  Icon(Icons.logout,color: Colors.red,size: 30,),
        ),
        
         
         
        
        
        
        
        
      ],),
    );
  }
}