import 'package:flutter/material.dart';
class Expense{
  final String category;
  final double value;
  final Color color;
  const Expense({
          @required this.category,
          @required this.value,
          @required this.color
  });
}