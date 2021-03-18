import 'package:angeliq_distr/const/text_style.dart';
import 'package:flutter/material.dart';
import 'package:angeliq_distr/screens/home/forms/inputDeco_design.dart';


class AddSellsForm extends StatefulWidget {
  @override
  _AddSellsForm createState() => _AddSellsForm();
}

class _AddSellsForm extends State<AddSellsForm> {

  String numbl,numbc,nomclient,dates,blSelected,bcSelected;
  int qteB6,qteB12;
  int montant = 0;
  List<String> blList = ['BL-1','BL-2','BL-3','BL-4'];
  List<String> bcList = ['BC-1','BC-2','BC-3','BC-4'];


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Ajoute de vente',
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
                CircleAvatar(
                  radius: 70,
                  child: Image.network("https://protocoderspoint.com/wp-content/uploads/2020/10/PROTO-CODERS-POINT-LOGO-water-mark-.png"),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: DropdownButtonFormField(
                    value: blSelected,
                    items: blList.map((bl){
                      return DropdownMenuItem(
                          value: bl ,
                          child: Text(bl)
                      );
                    }).toList(),
                    onChanged: (val) => setState(()=>blSelected = val ),
                    decoration: buildInputDecoration(Icons.view_list,"Numero BL"),
                    validator: (String value){
                      if(value==null)
                      {
                        return 'Veuillez entrer le numero du BL';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      numbl = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child:DropdownButtonFormField(
                  value: bcSelected,
                  items: bcList.map((bl){
                    return DropdownMenuItem(
                        value: bl ,
                        child: Text(bl)
                    );
                  }).toList(),
                  onChanged: (val) => setState(()=>bcSelected = val ),
                  decoration: buildInputDecoration(Icons.view_list,"Numero du Bon de Commande"),
                  validator: (String value){
                    if(value==null)
                    {
                      return 'Veuillez entrer le numero du BC';
                    }
                    return null;
                  },
                  onSaved: (String value){
                    numbc = value;
                  },
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.person,"Nom du client"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Veuillez entrer le nom du client ';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      nomclient = value;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration:buildInputDecoration(Icons.category,"Quantité B6"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Veuillez entrer une valeur';
                      }
                      return null;
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration:buildInputDecoration(Icons.category,"Quantité B12"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Veuillez entrer une valeur';
                      }
                      return null;
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                    child: TextFormField(
                      readOnly: true,
                      onTap: ()=>setState(() =>selectDate(context)),
                      decoration: buildInputDecoration(Icons.date_range,f.format(date)),
                      validator: (String value){
                        value = f.format(date);
                        if(value.isEmpty)
                        {
                          return 'Veuillez selectionner une date';
                        }
                        return null;
                      },
                      onSaved: (String value)=> dates = f.format(date),
                    ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: Text(
                      'Montant Total : $montant',
                    style: style(),
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
                        //submit form to Api
                        print("successful");
                        return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Theme.of(context).primaryColor,width: 1)
                    ),
                    textColor:Colors.white,child: Text(
                      "Enregistrer",
                      style: style(),
                  ),

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
