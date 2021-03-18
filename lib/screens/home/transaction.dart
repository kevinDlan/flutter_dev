import 'package:flutter/material.dart';

class Transaction{
  final int id;
  final String title;
  final double value;
  final String category;
  final IconData iconData;
  final Color color;

  const Transaction({
   @required this.id,
   @required this.title,
   @required this.value,
   @required this.category,
   @required this.iconData,
   @required this.color
});
}

class Transactions with ChangeNotifier {
  List<Transaction> _transactions=[
    Transaction(
        id: 1,
        title: "diner",
        value: 125.32,
        category: 'Meals',
        iconData: Icons.fastfood,
        color: Color(0xffe8505b)
    ),
    Transaction(
        id: 1,
        title: "diner",
        value: 125.32,
        category: 'Meals',
        iconData: Icons.fastfood,
        color: Color(0xffe8505b)
    ),
    Transaction(
        id: 1,
        title: "diner",
        value: 125.32,
        category: 'Meals',
        iconData: Icons.fastfood,
        color: Color(0xffe8505b)
    ),
    Transaction(
        id: 1,
        title: "diner",
        value: 125.32,
        category: 'Meals',
        iconData: Icons.fastfood,
        color: Color(0xffe8505b)
    )
  ];
}