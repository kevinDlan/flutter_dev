import 'package:flutter/material.dart';
import 'package:angeliq_distr/screens/home/header.dart';
import 'package:angeliq_distr/screens/home/transaction_card.dart';
import 'package:angeliq_distr/widgets/drawer.dart';
import 'package:angeliq_distr/const/text_style.dart';
import 'package:angeliq_distr/widgets/popup-option-menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String userName;
  Future getUserName()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var name = sharedPreferences.getString('userName');
    setState(() {
      userName = name;
    });
  }

  double _height = .55;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white.withOpacity(.9),
      drawer:MainDrawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.short_text),
        //   onPressed: (){
        //     scaffoldKey.currentState.openDrawer();
        //   },
        // ),
        title:  Text(
              //userName,
              'Tableau de bord',
            style: style(),
        ),
        actions: [
          PopUpOptionMenu()
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Header(),
            ],
          ),
          TransactionCard(_height),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/add_sells');
        },
        backgroundColor: Colors.blueGrey,
        child: Icon(
            Icons.add
        ),
      ),
    );
  }
}
