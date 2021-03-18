import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:angeliq_distr/screens/home/expense_chart.dart';
import 'package:angeliq_distr/models/expense.dart';

class Header extends StatelessWidget {
  static List<charts.Series<Expense, String>> _series = [
    charts.Series<Expense,String>(
      id:'Expense',
      domainFn: (Expense expense, _) => expense.category,
      measureFn: (Expense expense, _)=> expense.value,
      labelAccessorFn:(Expense expense, _) => '\$${expense.value}',
      colorFn: (Expense expense, _) => charts.ColorUtil.fromDartColor(expense.color),
      data: [
        Expense(category: 'Business', value: 149.99, color: Color(0xff40bad5)),
        Expense(category: 'Meal', value: 143.67, color: Color(0xffe8505b)),
        Expense(category: 'Gift', value: 49.99, color: Color(0xfffe91ca)),
        Expense(category: 'Gaming', value: 27.35, color: Color(0xfff6d743)),
        Expense(category: 'Entertainment', value: 34.99, color: Color(0xfff57b51)),
      ]
    )
  ];
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      height: mediaQuery.size.height*.4,
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container (
              child: ExpenseChart(seriesList: _series,animate: true),
              height: 150,
            ),
            const SizedBox(height:14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(onPressed: (){},
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    width: 124,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.playlist_add,color: Colors.white),
                        const SizedBox(width: 4,),
                        const Text(
                            "Add Transaction",
                            style: TextStyle(
                                fontSize: 12, color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                        )
                      ],
                    ),
                  ),
                ),
                FlatButton(
                    onPressed: null,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Container(
                    width: 72,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Reports",
                          style: TextStyle(
                              fontSize: 12, color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color:primaryColor
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16,),
            Padding(
                padding: const EdgeInsets.only(left: 12),
                child: const Text(
                    'Transaction',
                     style: TextStyle(
                       fontSize: 16,
                       fontFamily: "Montserrat",
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                     ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
