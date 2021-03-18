import 'package:angeliq_distr/screens/home/drawer-items/expense_list.dart';
import 'package:angeliq_distr/screens/home/drawer-items/sells_list.dart';
import 'package:angeliq_distr/screens/home/drawer-items/special_mission.dart';
import 'package:angeliq_distr/screens/home/drawer-items/user_info_file.dart';
import 'package:angeliq_distr/screens/home/forms/add_sells.dart';
import 'package:angeliq_distr/screens/home/forms/add_expense.dart';
import 'package:flutter/material.dart';
import  'package:angeliq_distr/screens/auth/login.dart';
import 'package:angeliq_distr/screens/wrapper.dart';
import 'package:angeliq_distr/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'provider/userProvider.dart';
import 'package:angeliq_distr/screens/home/drawer-items/mission.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const Map<int,Color> colorMap = {
    50: Color.fromRGBO(42, 54, 59, 0.1),
    100: Color.fromRGBO(42, 54, 59, 0.2),
    200: Color.fromRGBO(42, 54, 59, 0.3),
    300: Color.fromRGBO(42, 54, 59, 0.4),
    400: Color.fromRGBO(42, 54, 59, 0.5),
    500: Color.fromRGBO(42, 54, 59, 0.6),
    600: Color.fromRGBO(42, 54, 59, 0.7),
    700: Color.fromRGBO(42, 54, 59, 0.8),
    800: Color.fromRGBO(42, 54, 59, 0.9),
    900: Color.fromRGBO(42, 54, 59, 1.0),
  };
  static const MaterialColor _2A363B = MaterialColor(0xFF2A363B, colorMap);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          initialRoute:'/',
          routes: {
             '/':(context) => Wrapper(),
            '/login':(context) => LoginSignupScreen(),
            '/home':(context) => Home(),
            '/add_sells':(context) => AddSellsForm(),
            '/add_expense':(context) => AddExpenseForm(),
            '/client_info':(context) => CustomerInfo(),
            '/sells_list' :(context) => SellsList(),
            '/expenses_list' :(context) => ExpenseList(),
            '/mission' : (context) => Mission(),
            '/special-mission' : (context) => SpecialMission(),
          },
        theme: ThemeData(
          primarySwatch: _2A363B,
          fontFamily: 'Quicksand',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

      ),
    );
  }
}
