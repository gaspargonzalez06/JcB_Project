import 'package:flutter/material.dart';
class ColaboradorHome extends StatefulWidget {
  

  @override
  State<ColaboradorHome> createState() => _ColaboradorHomeState();
}

class _ColaboradorHomeState extends State<ColaboradorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo')),
      body: Center(child: Text ("colaborador home page"),),
    );
  }
}