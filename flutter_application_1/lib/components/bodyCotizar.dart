import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/body_pdf.dart';

import 'package:flutter_application_1/components/pdf_page_return.dart';
import 'package:flutter_application_1/main.dart';
import 'package:slimy_card/slimy_card.dart';

import 'dart:js';
import 'package:flutter/rendering.dart';
class bodyCotizar extends StatefulWidget {
  

  
 
  @override
  State<bodyCotizar> createState() => bodyCotizarState();
}

class bodyCotizarState extends State<bodyCotizar> {
  late  double  inicio=0;
  late double  id_equipo=1;
  late  double  final1=0;

  int _current=0;

  double _currentSliderValue= 500;

    RangeValues _currentRangeValues = const RangeValues(0, 2000);

  void getsomething(){}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        
        children: <Widget>[
        
        Container(padding: EdgeInsets.all(5),
          child:Row(children:<Widget>[
          
          Flexible(flex:2,child:
          SlimyCard(
      
      color: Colors.orange.withOpacity(0.7),
      
      
      topCardHeight: MediaQuery.of(context).size.height/2,
      bottomCardHeight: 120,
      borderRadius: 15,
      topCardWidget: _image(),
      bottomCardWidget:Container(child: Column(children:<Widget> [StatefulBuilder(
        builder: (BuildContext context, state) {
          return Column(children: [

                RangeSlider(
                
                  activeColor: Colors.orange,
                  inactiveColor:Colors.black,
                  values: _currentRangeValues,
                  max: 6500,
                  divisions: 26,
                  labels: RangeLabels(
                    _currentRangeValues.start.round().toString(),
                    _currentRangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {

                      inicio =values.start ;
                      final1=values.end ;
                      
                    state((){
                      _currentRangeValues = values;
                     inicio =values.start ;
                      final1=values.end ;
                      

                    });
                    setState(() {
                      _currentRangeValues = values;
                      
                      inicio =values.start  ;
                      final1=values.end  ;
                     
                    });
                  },
                ),
                 Text("${_currentRangeValues}",style: TextStyle(color: Colors.white),),



              ],) ;
        },
      ),ElevatedButton(child: Text ("Cotizar"),onPressed: (){
            
           
           showDialog(context: context, builder: (BuildContext context){
                      return AlertDialog(title: Text("Cotizacion en Proceso"),content: FlatButton(child:  Pdf_Page_Return (id_equipo,inicio,final1) ,
                      onPressed: (){
                        
                     
                        },),);
                      });
                  
         

          },

        ),],),) ,
      
      slimeEnabled: true,
            ),
          ),
          Flexible(flex:2,child:
            SlimyCard(
        
              color: Colors.orange.withOpacity(0.7),
              
              
              topCardHeight: MediaQuery.of(context).size.height/2,
              bottomCardHeight: 120,
              borderRadius: 15,
              topCardWidget: _image2() ,
              bottomCardWidget:Container(child: Column(children:<Widget> [ElevatedButton(child: Text ("actualizar precios "),onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> MyHomePage()
              ));

          },

        ),
          ],),) ,
              
              slimeEnabled: true,
            ), 
          ), 
          Flexible(flex:2,child:
            SlimyCard(
        
              color: Colors.orange.withOpacity(0.7),
              
              
              topCardHeight: MediaQuery.of(context).size.height/2,
              bottomCardHeight: 120,
              borderRadius: 15,
              topCardWidget: _image3() ,
              bottomCardWidget:Container(
                
                              child:Text("pagina 2")) ,
              
              slimeEnabled: true,
            ), 
          ), 
        ]
        ),
          
          ),
        Container(padding: EdgeInsets.all(5),
        child:Row(children:<Widget>[
          
          Flexible(flex:2,child:
          SlimyCard(
      
      color: Colors.orange.withOpacity(0.7),
      
      
      topCardHeight: MediaQuery.of(context).size.height/2,
      bottomCardHeight: 120,
      borderRadius: 15,
      topCardWidget: _image4() ,
      bottomCardWidget:Container(
                      child:Text("pagina 2")) ,
      
      slimeEnabled: true,
            ),
          ),
          Flexible(flex:2,child:
            SlimyCard(
        
              color: Colors.orange.withOpacity(0.7),
              
              
              topCardHeight: MediaQuery.of(context).size.height/2,
              bottomCardHeight: 120,
              borderRadius: 15,
              topCardWidget: _image5() ,
              bottomCardWidget:Container(
                              child:Text("pagina 2")) ,
              
              slimeEnabled: true,
            ), 
          ), 
          Flexible(flex:2,child:
            SlimyCard(
        
              color: Colors.orange.withOpacity(0.7),
              
              
              topCardHeight: MediaQuery.of(context).size.height/2,
              bottomCardHeight: 120,
              borderRadius: 15,
              topCardWidget: _image6() ,
              bottomCardWidget:Container(
                              child:Text("pagina 2")) ,
              
              slimeEnabled: true,
            ), 
          ), 
        ]
        ), ),
        
        Container(padding: EdgeInsets.all(5),
        child:Row(children:<Widget>[
          Flexible(flex:2,child:
          SlimyCard(
      
      color: Colors.orange.withOpacity(0.7),
      
      
      topCardHeight: MediaQuery.of(context).size.height/2,
      bottomCardHeight: 120,
      borderRadius: 15,
      topCardWidget: _image7() ,
      bottomCardWidget:Container(
                      child:Text("pagina 2")) ,
      
      slimeEnabled: true,
            ),
          ),
          Flexible(flex:2,child:
            SlimyCard(
        
              color: Colors.orange.withOpacity(0.7),
              
              
              topCardHeight: MediaQuery.of(context).size.height/2,
              bottomCardHeight: 120,
              borderRadius: 15,
              topCardWidget: _image8() ,
              bottomCardWidget:Container(
                              child:Text("pagina 2")) ,
              
              slimeEnabled: true,
            ), 
          ), 
          
        ]
        ),
        )
        

       
        ],

        
      ),
    );
  }

  Widget _image(){
    return Image.asset("assets/3CX.png",fit: BoxFit.fill);
  } 

  Widget _image2(){
    return Image.asset("assets/4CX.png",fit: BoxFit.fill);
  } 

  Widget _image3(){
    return Image.asset("assets/455ZX.png",fit: BoxFit.fill);
  } 

  Widget _image4(){
    return Image.asset("assets/1CX.png",fit: BoxFit.fill);
  } 

  Widget _image5(){
    return Image.asset("assets/533-105.png",fit: BoxFit.fill);
  } 

  Widget _image6(){
    return Image.asset("assets/SSL205.png",fit: BoxFit.fill);
  } 

  Widget _image7(){
    return Image.asset("assets/JS205.png",fit: BoxFit.fill);
  } 

  Widget _image8(){
    return Image.asset("assets/JS220.png",fit: BoxFit.fill);
  } 

  Widget _boton1(){
    return Text("here");
  }

  
}
