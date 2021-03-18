import 'package:flutter/material.dart';
import 'package:angeliq_distr/screens/home/forms/inputDeco_design.dart';
import 'package:angeliq_distr/const/text_style.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AddExpenseForm extends StatefulWidget {
  @override
  _AddExpenseForm createState() => _AddExpenseForm();
}

class _AddExpenseForm extends State<AddExpenseForm> {

  String teamName,montant,expenseCat,dates,selectedTeam,selectedCategory;
  List<String> teams = ['Equipe 1','Equipe 2','Equipe 3','Equipe 4'];
  List<String> categories = ['Categorie 1','Categorie 2','Categorie 3','Categorie 4'];


   
  DateTime date = DateTime.now();
  Future<Null> selectDate(BuildContext context)  async{
    DateTime datePicker = await showDatePicker(
        context:context,
        initialDate:date,
        firstDate: DateTime(1940),
        lastDate: DateTime(2030)
    );
    if(datePicker != null && datePicker != date){
      setState(() {
        date = datePicker;
      });
    }
  }



  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ajoute de Dépense',
          style: style(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child:DropdownButtonFormField(
                  value: selectedTeam,
                  items: teams.map((bl){
                    return DropdownMenuItem(
                        value: bl ,
                        child: Text(bl)
                    );
                  }).toList(),
                  onChanged: (val) => setState(()=>selectedTeam = val ),
                  decoration: buildInputDecoration(MaterialCommunityIcons.view_list,"Equipe"),
                  validator: (String value){
                    if(value==null)
                    {
                      return 'Veuillez Selectionner votre equipe';
                    }
                    return null;
                  },
                  onSaved: (String value){
                    teamName = value;
                  },
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: DropdownButtonFormField(
                    value: selectedCategory,
                    items: categories.map((bc){
                      return DropdownMenuItem(
                          value: bc ,
                          child: Text(bc)
                      );
                    }).toList(),
                    onChanged: (val) => setState(()=>selectedCategory = val ),
                    decoration: buildInputDecoration(MaterialCommunityIcons.view_list,"Catégorie de la dépense"),
                    validator: (String value){
                      if(value==null)
                      {
                        return 'Veuillez la catégorie de la depense';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      expenseCat = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child:  TextFormField(
                    readOnly: true,
                    onTap: ()=>setState(() =>selectDate(context)),
                    decoration: buildInputDecoration(Icons.date_range,f.format(date)),
                    validator: (String value){
                      value = f.format(date);
                      if(value.isEmpty)
                      {
                        value = f.format(date);
                        return 'Veuillez selectionner une date';
                      }
                      return null;
                    },
                    onSaved: (String value)=> dates = f.format(date),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration(Icons.money,"Montant"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Veuillez entrer le montant de la dépense';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      montant = value;
                    },
                  ),
                ),

                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                      if(_formkey.currentState.validate())
                      {
                        print("successful");
                        return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Theme.of(context).primaryColor,width:1)
                    ),
                    textColor:Colors.white,child: Text("Enregistrer"),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
