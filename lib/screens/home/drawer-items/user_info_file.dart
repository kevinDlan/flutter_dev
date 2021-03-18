import 'package:flutter/material.dart';
import 'package:angeliq_distr/const/text_style.dart';

class CustomerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Info Client',
          style: style(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('Affichage des info Client'),
        ),
      ),
    );
  }
}
