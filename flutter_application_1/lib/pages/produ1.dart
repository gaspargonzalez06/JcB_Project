import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pie_chart/pie_chart.dart';
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
      body:Center(
        child: Column(
          children:<Widget> [
            Row(
              children:<Widget> [
                Expanded(
                  child:Container(
        width: 350,
        height: 350,
        child: Container(
            color: Colors.black54,
            child:Column(
              children:<Widget>[
                Text("3CX"),
                Image.asset("assets/3CX.jpeg",alignment: Alignment.center,width: 400,),
                Row(
                  
                  children: [
                    
                  Text("Seleccione horas "),
                  _crearCard1()
                  ],) 
                ,
              ],
              
            )
            ),
            

          
        
          
        ),
        

         ),
         Expanded(child:Container(
        width: 450,
        height: 450,
        child: Container(
            color: Colors.black54,
            child:Column(
              children:<Widget>[
                Expanded(child:Container(color: Colors.red,)),
                Expanded(child: Row(children: [
                  Expanded(child: Container(color: Colors.blue,child: _createTotalPiezas(),)),
                  Expanded(child: Container(color: Colors.black12,child: _createPiechart(),)), 
                ],)),
                Expanded(child: Row(children: [
                  Expanded(child: Container(color: Colors.red,child: _createPrecioTotal(),)),
                  Expanded(child: Container(color: Colors.yellow,child: _createPrecioPorHora(),)), 
                ],))
              ],
              
            )
            ),
            

          
        
          
        ))
         ],)

          ],
          ),
      ),
      
    );
        
    
  }
  Widget _crearCard1(){

    
    return Container(
      color: Colors.black,
      
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
    Text("${_currentSliderValue.round()}",style: TextStyle(color: Colors.white),)
    
        ],

      ),
      ); 
  
  }
  Widget _createPiechart (){
    Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };


    return Container(child: PieChart(dataMap: dataMap,));
  }
  Widget _createTotalPiezas(){
    return Center(
    child:Container(child: Text("641 Piezas Facturadas"),));

  }
  Widget _createPrecioTotal(){
    return Center(
    child:Container(child: Text("Precio Total = 19305"),));
  }
  Widget _createPrecioPorHora(){
    return Center(
    child:Container(child: Text("Precio Por Hora =2.97"),));

  }

}

List<GDPData> getChartData(){
    final List<GDPData> chartData=[
      GDPData("dia1", 22),
      GDPData("dia2", 21),
      GDPData("dia3", 25),
      GDPData("dia4", 33),
      ];
      return chartData;
  }


class GDPData{
  GDPData(this.continent,this.gdp);
  final String continent;
  final double gdp;
}
