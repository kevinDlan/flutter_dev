import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatefulWidget {

  final double height;
  const TransactionCard(this.height);
  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  int date = 16;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Positioned(
        bottom: 0,
        left: mediaQuery.size.width*.03,
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: mediaQuery.size.width*widget.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),

          ),
        ),
    );
  }
}

