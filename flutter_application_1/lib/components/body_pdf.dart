import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/appbar.dart';

import 'package:flutter_application_1/components/bodyCotizar.dart';
import 'package:flutter_application_1/components/pdf_page_return%20copy.dart';


class body_pdf extends StatelessWidget {
  double id_equipo;
  double inicio;
  double final1;
  body_pdf(this.id_equipo,this.inicio, this.final1);
  
  void getsomething(){}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child:Column(children:<Widget> [
        customAppBar(),
            Row(children:<Widget>[
              Flexible(flex: 1,child: Container(width: size.width,height: size.height*2,
                color: Colors.transparent,child: Text("1"),),),
              Flexible(flex: 6,child: Container(child:Pdf_Page_Return(id_equipo,inicio,final1) ,)),
              Flexible(flex: 1,child: Container(width: size.width,height: size.height*2,color: Colors.transparent,child: Text("3"),),),

              ],),
  
            Container(color: Colors.white,height: size.height*0.25,width: size.width,
            
            
            )
      ],)

      

    );

  
  }
  Widget _crearBodyinicio(){
    return Container(padding: EdgeInsets.all(1),color: Colors.orange,child: Image.asset("assets/logo.png"));
  }  

  
}
