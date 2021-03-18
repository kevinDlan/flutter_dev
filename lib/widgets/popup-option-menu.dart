import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:angeliq_distr/screens/wrapper.dart';

class PopUpOptionMenu extends StatelessWidget {

  static const Settings = "clôturer la mission";
  static const SignOut = "Se déconecter";

  static const List<String> choices = <String>[ Settings, SignOut];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String choice) async {
        switch (choice) {
          case 'Se déconecter':
            final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
            sharedPreferences.remove('userId');
            sharedPreferences.remove('userName');
            sharedPreferences.remove('businessId');
            Navigator.of(context).pushReplacementNamed('/');
            break;
          case 'clôturer la mission':
            print('Cloturer la mission');
            break;
          default:
            Navigator.of(context).pushReplacementNamed('/');
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return choices.map((ch) {
          return PopupMenuItem<String>(value: ch, child: Text(ch));
        }).toList();
      },
    );
  }

  void afterClick(String choice) async {
    switch (choice) {
      case 'Se déconecter':
        final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
        sharedPreferences.remove('userId');
        sharedPreferences.remove('userName');
        sharedPreferences.remove('businessId');
        break;
      case 'Profil':
        print('User Profil');
        break;
      case 'Paramètres':
        print('User Settings');
        break;
      default:
        print('Default action');
        break;
    }
  }
}
