import 'package:flutter/material.dart';
import 'package:angeliq_distr/const/text_style.dart';

class SellsList extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Liste des Ventes',
          style: style(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('List des ventes'),
        ),
      ),
    );
  }
}
