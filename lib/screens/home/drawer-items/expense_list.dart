import 'package:flutter/material.dart';
import 'package:angeliq_distr/const/text_style.dart';

class ExpenseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List des dépense',
          style: style(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text('List des dépenses'),
        ),
      ),
    );
  }
}
