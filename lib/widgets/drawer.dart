import 'package:flutter/material.dart';
import 'package:angeliq_distr/widgets/listTile.dart';

class MainDrawer extends StatelessWidget {
  bool isMission = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: 200.0,
                padding: EdgeInsets.only(top:20.0,bottom: 20.0,right: 20.0),
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.0,),
                    ListTile(
                      leading: CircleAvatar(
                        maxRadius: 30.0,
                        child: Icon(
                            Icons.person
                        ),
                      ),
                      title: Text("Nom de l\'utilisateur",style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text('user@gmail.com'),
                    ),
                  ],
                )
            ),
            SizedBox(height: 20.0),
            Text('Menu',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700)),
            if(!isMission)...[
                listTile(context: context,icon:Icon(Icons.add),label: 'Créer une mission',link:'/mission'),
                listTile(context: context,icon:Icon(Icons.add),label: 'Mission Spéciale',link:'/special-mission'),
               ] else...[
                listTile(context: context,icon:Icon(Icons.edit),label: 'Enregistrer une Vente',link:'/add_sells'),
                listTile(context: context,icon:Icon(Icons.edit),label: 'Ajout de Dépenses',link:'/add_expense'),
                listTile(context: context,icon:Icon(Icons.assignment_ind_rounded),label: 'Fiche de Renseignement client',link:'/client_info'),
               ],
            listTile(context: context,icon:Icon(Icons.view_list_sharp),label: 'List des Ventes',link:'/sells_list'),
            listTile(context: context,icon:Icon(Icons.view_list_sharp),label: 'List des Dépense',link:'/expenses_list'),

          ],
        )
    );
  }
}
