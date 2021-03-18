import 'package:angeliq_distr/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:angeliq_distr/screens/auth/login.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int userId;
  String userName;

     @override
     void initState(){
       getPrefs().whenComplete(() => print('cool !'));
       super.initState();
     }

    Future getPrefs() async {
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var userid = sharedPreferences.getInt('userId');
      var username = sharedPreferences.getString('userName');
      setState(() {
        userId = userid;
        userName = username;
      });
    }

    Widget build(BuildContext context) {
    if( userId != null ||  userName != null)
    {
       return Home();
    }else
      {
      return LoginSignupScreen();
    }
  }
}
