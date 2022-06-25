// To parse required this JSON data, do
//
//     final piezas = piezasFromJson(jsonString);

import 'dart:convert';

List<Piezas> PiezasFromJson(String str) => List<Piezas>.from(json.decode(str).map((x) => Piezas.fromJson(x)));

String PiezasToJson(List<Piezas> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Piezas {

  final  String idPieza;
  final  String idCategoria;
  final  String nombrePieza;
  final  String cantidadPiezas;
  final  String tiempoPromedio;
  final  String precioUnidad;
  final  String idEquipo;
    Piezas({
        required this.idPieza,
        required this.idCategoria,
        required this.nombrePieza,
        required this.cantidadPiezas,
        required this.tiempoPromedio,
        required this.precioUnidad,
        required this.idEquipo,
    });

    

    factory Piezas.fromJson(Map<String, dynamic> json) => Piezas(
        idPieza: json["Id_Pieza"],
        idCategoria: json["Id_Categoria"],
        nombrePieza: json["Nombre_Pieza"],
        cantidadPiezas: json["Cantidad_Piezas"],
        tiempoPromedio: json["Tiempo_Promedio"],
        precioUnidad: json["Precio_unidad"],
        idEquipo: json["Id_Equipo"],
    );

    Map<String, dynamic> toJson() => {
        "Id_Pieza": idPieza,
        "Id_Categoria": idCategoria,
        "Nombre_Pieza": nombrePieza,
        "Cantidad_Piezas": cantidadPiezas,
        "Tiempo_Promedio": tiempoPromedio,
        "Precio_unidad": precioUnidad,
        "Id_Equipo": idEquipo,
    };
}
