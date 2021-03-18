import 'package:flutter/material.dart';

Future<void> showMyDialog({BuildContext context, String msg, String route}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Message'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(msg),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              if(route==null){
                Navigator.pop(context);
              } else{
                Navigator.pushReplacementNamed(context, route);
              }
            },
          ),
        ],
      );
    },
  );
}