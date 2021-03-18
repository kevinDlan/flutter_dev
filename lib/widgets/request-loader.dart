import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Positioned requestLoader() {
  return Positioned(
      child: Expanded(
    flex: 1,
    child: Container(
      decoration: BoxDecoration(color: Color(0xFF3b5999).withOpacity(.85)),
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 40,
        ),
      ),
    ),
  ));
}
