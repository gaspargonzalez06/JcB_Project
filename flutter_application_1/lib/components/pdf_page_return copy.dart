
import 'dart:developer';
import 'dart:ui';

import 'package:open_file/open_file.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:native_pdf_view/native_pdf_view.dart';
import 'dart:convert';
import 'package:flutter_application_1/components/bodyCotizar.dart';

import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:universal_html/html.dart' as html;
import "package:http/http.dart" as http;





class Pdf_Page_Return extends StatefulWidget {
  double id_equipo;
  double inicio;
  double final1;
  Pdf_Page_Return(this.id_equipo,this.inicio,this.final1);


  
  
 

  @override
  State<Pdf_Page_Return> createState() => _Pdf_Page_ReturnState(id_equipo,inicio,final1);
}

class _Pdf_Page_ReturnState extends State<Pdf_Page_Return> {
  double id_equipo;
  double inicio;
  double final1;
  _Pdf_Page_ReturnState(this.id_equipo,this.inicio,this.final1);
 

   //Listas utilizadas por categorias para trabajar valores parciales de categoria y luego integrar el fial total
  List<Products> piezasList= [];
  List<Products> piezasList2= [];

  List<Products> piezasList3= [];
  List<Products> piezasList4= [];

  List<Products> piezasList5= [];
  List<Products> piezasList6= [];
  List<Products> piezasList7= [];
  List<Products> piezasList8= [];
  List<Products> piezasList9= [];
  List<Products> piezasList10= [];
  List<Products> piezasList11= [];

  List allFiltracion=[];
  List allLubricacion=[];
  List allDesgaste=[];
  List allMotor=[];
  List allServo_Transmision=[];
  List allEje_Delantero=[];
  List allEje_Trasero=[];
  List allSistemas_Hidraulicos=[];
  List allBastidor=[];
  List allElectrico=[];
  List allTotal=[];
  
  // valores de retorno de sumatorias de kategorias
   final double suma1=0;
  final double suma2=0;
  final double suma3=0;
  final double suma4=0;
  final double suma5=0;
  final double suma6=0;
  final double suma7=0;
  final double suma8=0;
  final double suma9=0;
  final double sum10=0;
   final double suma11=0;

  
  //funciones para sumar parciales de categorias y luego final total
  getTotalFiltracion(){
      double suma1=0;
      for (var i in allFiltracion){
        suma1=suma1+double.parse(i["total"]);
      }
      return suma1; 
    }
    getTotalLubricacion(){
      double suma2=0;
      for (var i in allLubricacion){     
        suma2=suma2+double.parse(i["total"]);
      }
      return suma2; 
    }
    getTotalDesgaste(){
      double suma3=0;
      for (var i in allDesgaste){     
        suma3=suma3+double.parse(i["total"]);
      }
      return suma3; 
    }
    getTotalMotor(){
      double suma4=0;
      for (var i in allMotor){     
        suma4=suma4+double.parse(i["total"]);
      }
      return suma4; 
    }
    getTotalServo_Transmision(){
      double suma5=0;
      for (var i in allServo_Transmision){     
        suma5=suma5+double.parse(i["total"]);
      }
      return suma5; 
    }
    getTotalEje_Delantero(){
      double suma6=0;
      for (var i in allEje_Delantero){     
        suma6=suma6+double.parse(i["total"]);
      }
      return suma6; 
    }
    getTotalEje_Trasero(){
      double suma7=0;
      for (var i in allEje_Trasero){     
        suma7=suma7+double.parse(i["total"]);
      }
      return suma7; 
    }
    getTotalSistemas_Hidraulicos(){
      double suma8=0;
      for (var i in allSistemas_Hidraulicos){     
        suma8=suma8+double.parse(i["total"]);
      }
      return suma8; 
    }
    getTotalBastidor(){
      double suma9=0;
      for (var i in allBastidor){     
        suma9=suma9+double.parse(i["total"]);
      }
      return suma9; 
    }
    getTotalElectrico(){
      double suma10=0;
      for (var i in allElectrico){     
        suma10=suma10+double.parse(i["total"]);
      }
      return suma10; 
    }
    getTotalCotizacion(){
      double suma11=0;
      for (var i in allTotal){     
        suma11=suma11+double.parse(i["total"]);
      }
      return suma11;
    }

    
  //llamados a base de dato de kategorias por separado
  getALLTotal()async{
    var response = await http.post(Uri.parse("http://localhost/mydb2/getAll.php"),body: {
      "id_equipo":id_equipo.toString(),
      "inicio": inicio.toString(),
      "final": final1.toString()
    });
    if(response.statusCode == 200){
      setState(() { 
        allTotal=jsonDecode(response.body);  
      });
      return piezasList11;
    }
  }
  getALLFiltracion()async{
    var response = await http.post(Uri.parse("http://localhost/mydb2/getFiltracion2.php"),body: {
      "inicio": inicio.toString(),
      "final": final1.toString()
    });
    if(response.statusCode == 200){
      setState(() { 
        allFiltracion=jsonDecode(response.body);  
      });
      return piezasList;
    }
  }
  getALLLubricacion()async{
    var response = await http.post(Uri.parse("http://localhost/mydb2/getLubricacion.php"),body: {
      
      "inicio": inicio.toString(),
      "final": final1.toString()
    });
    if(response.statusCode == 200){   
      setState(() { 
        allLubricacion=jsonDecode(response.body);   
      });
      return piezasList2;
    }
  }
  getALLDesgaste()async{
    var response = await http.post(Uri.parse("http://localhost/mydb2/getDesgaste.php"),body: {
      "id_equipo":id_equipo.toString(),
      "inicio": inicio.toString(),
      "final": final1.toString()
    });
    if(response.statusCode == 200){
      setState(() { 
        allDesgaste=jsonDecode(response.body);  
      });
      return piezasList3;
    }
  }
  getALLMotor()async{
    var response = await http.post(Uri.parse("http://localhost/mydb2/getMotor.php"),body: {
      "id_equipo":id_equipo.toString(),
      "inicio": inicio.toString(),
      "final": final1.toString()
    });
    if(response.statusCode == 200){
      setState(() { 
        allMotor=jsonDecode(response.body);  
      });
      return piezasList4;
    }
  }
  getALLServo_Transmision()async{
    var response = await http.post(Uri.parse("http://localhost/mydb2/getServo_Transmision.php"),body: {
      "id_equipo":id_equipo.toString(),
      "inicio": inicio.toString(),
      "final": final1.toString()
    });
    if(response.statusCode == 200){
      setState(() { 
        allServo_Transmision=jsonDecode(response.body);  
      });
      return piezasList5;
    }
  }
  getALLEje_Delantero()async{
    var response = await http.post(Uri.parse("http://localhost/mydb2/getEje_Delantero.php"),body: {
      "id_equipo":id_equipo.toString(),
      "inicio": inicio.toString(),
      "final": final1.toString()
    });
    if(response.statusCode == 200){
      setState(() { 
        allEje_Delantero=jsonDecode(response.body);  
      });
      return piezasList6;
    }
  }
  getALLEje_Trasero()async{
    var response = await http.post(Uri.parse("http://localhost/mydb2/getEje_Trasero.php"),body: {
      "id_equipo":id_equipo.toString(),
      "inicio": inicio.toString(),
      "final": final1.toString()
    });
    if(response.statusCode == 200){
      setState(() { 
        allEje_Trasero=jsonDecode(response.body);  
      });
      return piezasList7;
    }
  }

  getALLSistemas_Hidraulicos()async{
    var response = await http.post(Uri.parse("http://localhost/mydb2/getSistemas_Hidraulicos.php"),body: {
      "id_equipo":id_equipo.toString(),
      "inicio": inicio.toString(),
      "final": final1.toString()
    });
    if(response.statusCode == 200){
      setState(() { 
        allSistemas_Hidraulicos=jsonDecode(response.body);  
      });
      return piezasList8;
    }
  }
  getALLBastidor()async{
    var response = await http.post(Uri.parse("http://localhost/mydb2/getBastidor.php"),body: {
      "id_equipo":id_equipo.toString(),
      "inicio": inicio.toString(),
      "final": final1.toString()
    });
    if(response.statusCode == 200){
      setState(() { 
        allBastidor=jsonDecode(response.body);  
      });
      return piezasList9;
    }
  }
  getALLElectico()async{
    var response = await http.post(Uri.parse("http://localhost/mydb2/getElectrico.php"),body: {
      "id_equipo":id_equipo.toString(),
      "inicio": inicio.toString(),
      "final": final1.toString()
    });
    if(response.statusCode == 200){
      setState(() { 
        allElectrico=jsonDecode(response.body);  
      });
      return piezasList10;
    }
  }
  
  
  @override
  void initState() {
    super.initState();
    getALLTotal();
    getALLFiltracion();
    getALLLubricacion();
    getALLDesgaste();
    getALLMotor();
    getALLServo_Transmision();
    getALLEje_Delantero();
    getALLEje_Trasero();
    getALLSistemas_Hidraulicos();
    getALLBastidor();
    getALLElectico(); 
    getTotalFiltracion();
  } 
  int number=0;
  Future<html.Blob> myGetBlobPdfContent() async {
    final List allFiltracion2=allFiltracion;
    final List allLubricacion2=allLubricacion;
    final image = (await rootBundle.load("assets/logo.png")).buffer.asUint8List();
    final image2 = (await rootBundle.load("assets/3CX.png")).buffer.asUint8List();
    final image3 = (await rootBundle.load("assets/pie_pagina.png")).buffer.asUint8List();
    var data = await rootBundle.load("fonts/arial.ttf");
    var myFont = pw.Font.ttf(data);
    var myStyle = pw.TextStyle(font: myFont, fontSize: 14.0);  
    final headers = ["Id_Pieza","Id_Categoria","Nombre_Pieza","Cantidad_Piezas","Tiempo_Promedio","Precio_unidad","Id_Equipo","total"];
    Size size =  MediaQuery.of(context).size;
    final pdf = pw.Document();
    
    pdf.addPage(pw.MultiPage(
        maxPages: 100,
        orientation: pw.PageOrientation.landscape,
        margin: pw.EdgeInsets.all(10),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => <pw.Widget>[
                  
                  pw.Table(
              
                    children: [
   
                   pw.TableRow(
                     
                       children: [
                         
                         pw.Flexible(flex: 1,child:pw.Image(pw.MemoryImage(image2),width: 90,height: 40,fit: pw.BoxFit.cover)),
                        
                         pw.Flexible(flex:2 ,child:pw.Text("Programa de Mantenimiento Preventivo ""\n" "Retroexcabadora 3cxb",style: pw.TextStyle(fontSize: 14,fontWeight: pw.FontWeight.bold),textAlign: pw.TextAlign.center), ),
                         pw.Flexible(flex: 1,child:pw.Image(pw.MemoryImage(image),width: 90,height: 40,fit: pw.BoxFit.cover))
                        
                       ]
                   )
           ]
        ),
        pw.SizedBox(height: 20),

                  pw.Table(
                    children: [
                      pw.TableRow(
                       children: [
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text("Descripcion",
                                   style: pw.TextStyle(fontSize: 11,fontWeight: pw.FontWeight.bold)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text("Precio(unidad)",
                                   style: pw.TextStyle(fontSize: 11,fontWeight: pw.FontWeight.bold)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text("Cantidad ",
                                   style: pw.TextStyle(fontSize: 11,fontWeight: pw.FontWeight.bold)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text("Sub/Total",
                                   style: pw.TextStyle(fontSize: 11,fontWeight: pw.FontWeight.bold)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text("250",
                                   style: pw.TextStyle(fontSize: 11,fontWeight: pw.FontWeight.bold)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text("500",
                                   style: pw.TextStyle(fontSize: 11,fontWeight: pw.FontWeight.bold)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text("750",
                                   style: pw.TextStyle(fontSize: 11,fontWeight: pw.FontWeight.bold)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text("1000",
                                   style: pw.TextStyle(fontSize: 11,fontWeight: pw.FontWeight.bold)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text("Total De Categoria",
                                   style: pw.TextStyle(fontSize: 11,fontWeight: pw.FontWeight.bold)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text("Total Del Mantenimiento",
                                   style: pw.TextStyle(fontSize: 11,fontWeight: pw.FontWeight.bold)),
                               pw.Divider(thickness: 1)
                             ]
                         )

                       ]
                   ),
                   
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.start,
                             children: [
                               pw.Text("Filtracion",
                                   style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold),textAlign: pw.TextAlign.left),
                               pw.Divider(thickness: 1)
                             ]
                         ),]
                   ),
                   
                        for (var i = 0; i < allFiltracion2.length; i++)
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allFiltracion[i]["Nombre_Pieza"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allFiltracion[i]["Precio_unidad"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allFiltracion[i]["Cantidad_Piezas"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allFiltracion[i]["total"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allFiltracion[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allFiltracion[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allFiltracion[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allFiltracion[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                       ]
                   ),
                   pw.TableRow(
                     
                       children: [
                         
                         
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                         pw.Flexible(flex:2 ,child:pw.Text("Total Filtracion = "+getTotalFiltracion().toStringAsFixed(2),style: pw.TextStyle(fontSize: 10,),textAlign: pw.TextAlign.right,), ),
                         
                         
                       ]
                   ),

                   
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.start,
                             children: [
                               pw.Text("Lubricacion",
                                   style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold),textAlign: pw.TextAlign.left),
                               pw.Divider(thickness: 1)
                             ]
                         ),]
                   ),
                        for (var i = 0; i < allLubricacion2.length; i++)
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allLubricacion[i]["Nombre_Pieza"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allLubricacion[i]["Precio_unidad"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allLubricacion[i]["Cantidad_Piezas"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allLubricacion[i]["total"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allLubricacion[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allLubricacion[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allLubricacion[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allLubricacion[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                       ]
                   ),
                   pw.TableRow(
                     
                       children: [
                         
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.Flexible(flex:2 ,child:pw.Text("Total Lubricacion"+getTotalLubricacion().toStringAsFixed(2),style: pw.TextStyle(fontSize: 10,),textAlign: pw.TextAlign.right,), ),
                         
                       ]
                   ),
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.start,
                             children: [
                               pw.Text("Desgaste",
                                   style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold),textAlign: pw.TextAlign.left),
                               pw.Divider(thickness: 1)
                             ]
                         ),]
                   ),
                   
                        for (var i = 0; i < allDesgaste.length; i++)
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allDesgaste[i]["Nombre_Pieza"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allDesgaste[i]["Precio_unidad"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allDesgaste[i]["Cantidad_Piezas"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allDesgaste[i]["total"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allDesgaste[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allDesgaste[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allDesgaste[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allDesgaste[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                       ]
                   ),
                   pw.TableRow(
                     
                       children: [
                         
                         
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                         pw.Flexible(flex:2 ,child:pw.Text("Total Desgaste = "+getTotalDesgaste().toStringAsFixed(2),style: pw.TextStyle(fontSize: 10,),textAlign: pw.TextAlign.right,), ),
                         
                         
                       ]
                   ),
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.start,
                             children: [
                               pw.Text("Motor",
                                   style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold),textAlign: pw.TextAlign.left),
                               pw.Divider(thickness: 1)
                             ]
                         ),]
                   ),
                   
                        for (var i = 0; i < allMotor.length; i++)
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allMotor[i]["Nombre_Pieza"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allMotor[i]["Precio_unidad"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allMotor[i]["Cantidad_Piezas"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allMotor[i]["total"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allMotor[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allMotor[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allMotor[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allMotor[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                       ]
                   ),
                   pw.TableRow(
                     
                       children: [
                         
                         
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                         pw.Flexible(flex:2 ,child:pw.Text("Total Motor = "+getTotalMotor().toStringAsFixed(2),style: pw.TextStyle(fontSize: 10,),textAlign: pw.TextAlign.right,), ),
                         
                         
                       ]
                   ),
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.start,
                             children: [
                               pw.Text("Servo Transmision Synchro ",
                                   style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold),textAlign: pw.TextAlign.left),
                               pw.Divider(thickness: 1)
                             ]
                         ),]
                   ),
                   
                        for (var i = 0; i < allServo_Transmision.length; i++)
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allServo_Transmision[i]["Nombre_Pieza"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allServo_Transmision[i]["Precio_unidad"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allServo_Transmision[i]["Cantidad_Piezas"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allServo_Transmision[i]["total"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allServo_Transmision[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allServo_Transmision[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allServo_Transmision[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allServo_Transmision[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                       ]
                   ),
                   pw.TableRow(
                     
                       children: [
                         
                         
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                         pw.Flexible(flex:2 ,child:pw.Text("Total Servo_Transmision = "+getTotalServo_Transmision().toStringAsFixed(2),style: pw.TextStyle(fontSize: 10,),textAlign: pw.TextAlign.right,), ),
                         
                         
                       ]
                   ),
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.start,
                             children: [
                               pw.Text("Eje Delantero",
                                   style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold),textAlign: pw.TextAlign.left),
                               pw.Divider(thickness: 1)
                             ]
                         ),]
                   ),
                   
                        for (var i = 0; i < allEje_Delantero.length; i++)
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Delantero[i]["Nombre_Pieza"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Delantero[i]["Precio_unidad"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Delantero[i]["Cantidad_Piezas"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Delantero[i]["total"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Delantero[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Delantero[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Delantero[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Delantero[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                       ]
                   ),
                   pw.TableRow(
                     
                       children: [
                         
                         
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                         pw.Flexible(flex:2 ,child:pw.Text("Total Eje Delantero = "+getTotalEje_Delantero().toStringAsFixed(2),style: pw.TextStyle(fontSize: 10,),textAlign: pw.TextAlign.right,), ),
                          
                         
                       ]
                   ),
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.start,
                             children: [
                               pw.Text("Eje Trasero",
                                   style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold),textAlign: pw.TextAlign.left),
                               pw.Divider(thickness: 1)
                             ]
                         ),]
                   ),
                   
                        for (var i = 0; i < allEje_Trasero.length; i++)
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Trasero[i]["Nombre_Pieza"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Trasero[i]["Precio_unidad"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Trasero[i]["Cantidad_Piezas"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Trasero[i]["total"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Trasero[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Trasero[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Trasero[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allEje_Trasero[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                       ]
                   ),
                   pw.TableRow(
                     
                       children: [
                         
                         
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                         pw.Flexible(flex:2 ,child:pw.Text("Total Eje Trasero = "+getTotalEje_Trasero().toStringAsFixed(2),style: pw.TextStyle(fontSize: 10,),textAlign: pw.TextAlign.right,), ),
                          
                         
                       ]
                   ),
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.start,
                             children: [
                               pw.Text("Sistemas Hidraulicos",
                                   style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold),textAlign: pw.TextAlign.left),
                               pw.Divider(thickness: 1)
                             ]
                         ),]
                   ),
                   
                        for (var i = 0; i < allSistemas_Hidraulicos.length; i++)
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allSistemas_Hidraulicos[i]["Nombre_Pieza"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allSistemas_Hidraulicos[i]["Precio_unidad"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allSistemas_Hidraulicos[i]["Cantidad_Piezas"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allSistemas_Hidraulicos[i]["total"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allSistemas_Hidraulicos[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allSistemas_Hidraulicos[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allSistemas_Hidraulicos[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allSistemas_Hidraulicos[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                       ]
                   ),
                   pw.TableRow(
                     
                       children: [
                         
                         
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                         pw.Flexible(flex:2 ,child:pw.Text("Total Sistemas Hidraulicos = "+getTotalSistemas_Hidraulicos().toStringAsFixed(2),style: pw.TextStyle(fontSize: 10,),textAlign: pw.TextAlign.right,), ),
                          
                         
                       ]
                   ),
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.start,
                             children: [
                               pw.Text("Bastidor",
                                   style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold),textAlign: pw.TextAlign.left),
                               pw.Divider(thickness: 1)
                             ]
                         ),]
                   ),
                   
                        for (var i = 0; i < allBastidor.length; i++)
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allBastidor[i]["Nombre_Pieza"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allBastidor[i]["Precio_unidad"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allBastidor[i]["Cantidad_Piezas"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allBastidor[i]["total"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allBastidor[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allBastidor[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allBastidor[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allBastidor[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                       ]
                   ),
                   pw.TableRow(
                     
                       children: [
                         
                         
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                         pw.Flexible(flex:2 ,child:pw.Text("Total Bastidor = "+getTotalBastidor().toStringAsFixed(2),style: pw.TextStyle(fontSize: 10,),textAlign: pw.TextAlign.right,), ),
                          
                         
                       ]
                   ),
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.start,
                             children: [
                               pw.Text("Electrico",
                                   style: pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold),textAlign: pw.TextAlign.left),
                               pw.Divider(thickness: 1)
                             ]
                         ),]
                   ),
                   
                        for (var i = 0; i < allElectrico.length; i++)
                   pw.TableRow(
                       children: [
                         
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allElectrico[i]["Nombre_Pieza"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allElectrico[i]["Precio_unidad"],
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allElectrico[i]["Cantidad_Piezas"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allElectrico[i]["total"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allElectrico[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allElectrico[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allElectrico[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                         pw.Column(
                             crossAxisAlignment: pw.CrossAxisAlignment
                                 .center,
                             mainAxisAlignment: pw.MainAxisAlignment.center,
                             children: [
                               pw.Text(allElectrico[i]["Id_Categoria"].toString(),
                                   style: pw.TextStyle(fontSize: 8)),
                               pw.Divider(thickness: 1)
                             ]
                         ),
                       ]
                   ),
                   pw.TableRow(
                     
                       children: [
                         
                         
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                         pw.Flexible(flex:2 ,child:pw.Text("Total Electrico = "+getTotalElectrico().toStringAsFixed(2),style: pw.TextStyle(fontSize: 10,),textAlign: pw.TextAlign.right,), ),
                          
                         
                       ]
                   ),
                  pw.TableRow(
                     
                       children: [
                         
                         
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                        pw.SizedBox(width:1 ),
                         pw.Flexible(flex:2 ,child:pw.Text("Total De la Cotizacion  = "+getTotalCotizacion().toStringAsFixed(2),style: pw.TextStyle(fontSize: 10,),textAlign: pw.TextAlign.right,), ),
                          
                         
                       ]
                   ),
                   
           ]
        ),
       
        pw.SizedBox(height: 50),

        pw.Table(
                    
                    
                    children: [
                      
                      
                        
                   pw.TableRow(
                     
                       children: [
                         pw.SizedBox(width: 240),
                        
                         pw.Flexible(flex: 1,child:pw.Image(pw.MemoryImage(image3),width: 360,height: 80,fit: pw.BoxFit.cover)),
                        
                         
                       ]
                   )
           ]
        ),
        pw.Text(suma1.toString())
        
             
                    
                      

                     
                  
                  
                  
                  
              

          ]
        ));
    final bytes = await pdf.save();
    html.Blob blob = html.Blob([bytes], 'application/pdf');
    return blob;
  }

  
  

  @override
  Widget build(BuildContext context) {
    
    myGetBlobPdfContent();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: const Text("Open"),
              onPressed: () async {
                final url = html.Url.createObjectUrlFromBlob(
                    await myGetBlobPdfContent());

                
                html.window.open(url, "_blank");
                html.Url.revokeObjectUrl(url);
              },
            ),
            RaisedButton(
              child: const Text("Download"),
              onPressed: () async {
                final url = html.Url.createObjectUrlFromBlob(
                    await myGetBlobPdfContent());
                final anchor =
                    html.document.createElement('a') as html.AnchorElement
                      ..href = url
                      ..style.display = 'none'
                      ..download = 'jcb_invoice.pdf';
                html.document.body!.children.add(anchor);
                anchor.click();
                html.document.body!.children.remove(anchor);
                html.Url.revokeObjectUrl(url);
              },
            ),
           
             
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
  

  
}


// To parse required this JSON data, do
//
//     final Products = ProductsFromJson(jsonString);




class Products {
    Products({
        required this.Id_Pieza,
        required this.Id_Categoria,
        required this.Nombre_Pieza,
        required this.Cantidad_Piezas,
        required this.Tiempo_Promedio,
        required this.Precio_Unidad,
        required this.Id_Equipo,
        required this.total,
    });

    String Id_Pieza;
    String Id_Categoria;
    String Nombre_Pieza;
    String Cantidad_Piezas;
    String Tiempo_Promedio;
    String Precio_Unidad;
    String Id_Equipo;
    double total;

    
}


class JCBGraph {
  final String Categoria;
  final String valor;

  JCBGraph( {required this.Categoria,required this.valor});
}