import 'package:angeliq_distr/widgets/loading_progress.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:angeliq_distr/screens/home/forms/inputDeco_design.dart';
import 'package:angeliq_distr/const/text_style.dart';
import 'package:angeliq_distr/widgets/dialogBox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mission extends StatefulWidget {
  @override
  _MissionState createState() => _MissionState();
}

class _MissionState extends State<Mission> {
  String mUrl = 'http://angeliquedistribution.asnumeric.com/api/mission';
  String dates, cmdStatus, bonLivraison, numeroChargement;
  DateTime dateChargement;
  int commandId, chauffeurId, vehiculeId, convoyeurId;
  bool unSubmit = true;

  List<String> status = ['Reçu', 'Commandé'];
  // @override
  // initState() {
  //   getElements().whenComplete(() => print(vehicules));
  //   super.initState();
  // }

  Future<dynamic> getElements() async {
    var url = 'http://angeliquedistribution.asnumeric.com/api/orders';
    var result;
    Dio dio = new Dio();
    await dio.get(url).then((response) {
      if (response.statusCode == 200) {
        result = response.data;
      }
    }).catchError(
        (error) => showMyDialog(msg: 'Veuillez verifier votre connexion !'));
    return result;
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
  Future<Null> selectDate(BuildContext context) async {
    DateTime datePicker = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1940),
        lastDate: DateTime(2030));
    if (datePicker != null && datePicker != date) {
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
          'Création de Mission',
          style: style(),
        ),
        centerTitle: true,
      ),
      body: unSubmit
          ? FutureBuilder(
              future: getElements(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingProgress();
                } else {
                  List<dynamic> commandes = snapshot.data['commandes'];
                  List<dynamic> chauffeurs = snapshot.data['chauffeurs'];
                  List<dynamic> vehicules = snapshot.data['vehicules'];
                  List<dynamic> convoyeurs = snapshot.data['convoyeurs'];
                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Text('Création de Mission',
                                style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Form(
                            key: _formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 15, left: 10, right: 10),
                                  child: TextFormField(
                                    readOnly: true,
                                    //onTap: () => setState(() => selectDate(context)),
                                    decoration: buildInputDecoration(
                                        Icons.date_range, f.format(date)),
                                    validator: (String value) {
                                      value = f.format(date);
                                      if (value.isEmpty) {
                                        return 'Veuillez selectionner une date';
                                      } else {
                                        dateChargement = date;
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, left: 10, right: 10),
                                  child: TextFormField(
                                    decoration: buildInputDecoration(
                                        Icons.format_list_numbered,
                                        'Bon de Livraison du fournisseur'),
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Veuillez entrer le BL';
                                      } else {
                                        bonLivraison = value;
                                        return null;
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, left: 10, right: 10),
                                  child: DropdownButtonFormField(
                                    value: cmdStatus,
                                    items: status.map((stat) {
                                      return DropdownMenuItem(
                                          value: stat, child: Text(stat));
                                    }).toList(),
                                    onChanged: (val) => cmdStatus = val,
                                    decoration: buildInputDecoration(
                                        Icons.assignment_turned_in_outlined,
                                        "Statut de la commande"),
                                    validator: (String value) {
                                      if (value == null) {
                                        return 'Veuillez le status de la commande';
                                      } else {
                                        cmdStatus = value;
                                        return null;
                                      }
                                    },
                                    // onSaved: (String value) => dates = f.format(date),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, left: 10, right: 10),
                                  child: DropdownButtonFormField(
                                    value: commandId,
                                    items: commandes.map((cmd) {
                                      return DropdownMenuItem(
                                          value: cmd['id'],
                                          child: Text(cmd['commande']));
                                    }).toList(),
                                    onChanged: (val) => commandId = val,
                                    decoration: buildInputDecoration(
                                        Icons.assignment_sharp,
                                        "Liste des commandes disponible"),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Veuillez choisir une commande';
                                      } else {
                                        commandId = value;
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, left: 10, right: 10),
                                  child: TextFormField(
                                    decoration: buildInputDecoration(
                                        Icons.format_list_numbered,
                                        'Numero de chargement'),
                                    validator: (String value) {
                                      if (value.isEmpty) {
                                        return 'Veuillez entrer le numero de chargement';
                                      } else {
                                        numeroChargement = value;
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, left: 10, right: 10),
                                  child: DropdownButtonFormField(
                                    value: chauffeurId,
                                    items: chauffeurs.map((drivers) {
                                      return DropdownMenuItem(
                                          value: drivers['id'],
                                          child: Text(
                                              "${drivers['nom']} ${drivers['prenom']}"));
                                    }).toList(),
                                    onChanged: (val) => chauffeurId = val,
                                    decoration: buildInputDecoration(
                                        Icons.person,
                                        "Choisissez un chauffeur"),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Veuillez choisir un chauffeur';
                                      }
                                      {
                                        chauffeurId = value;
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, left: 10, right: 10),
                                  child: DropdownButtonFormField(
                                    value: vehiculeId,
                                    items: vehicules.map((cars) {
                                      return DropdownMenuItem(
                                          value: cars['id'],
                                          child: Text(cars['matricule']));
                                    }).toList(),
                                    onChanged: (val) => vehiculeId = val,
                                    decoration: buildInputDecoration(
                                        Icons.drive_eta,
                                        'Choisissez un Véhicule'),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Veuillez choisir un véhicule';
                                      } else {
                                        vehiculeId = value;
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 15, left: 10, right: 10),
                                  child: DropdownButtonFormField(
                                    value: convoyeurId,
                                    items: convoyeurs.map((convs) {
                                      return DropdownMenuItem(
                                          value: convs['id'],
                                          child: Text(
                                              "${convs['nom']} ${convs['prenom']}"));
                                    }).toList(),
                                    onChanged: (val) => convoyeurId = val,
                                    decoration: buildInputDecoration(
                                        Icons.person, "Ajouter un Convoyeur"),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Veuillez choisir un Convoyeur';
                                      } else {
                                        convoyeurId = value;
                                        return null;
                                      }
                                    },
                                    // onSaved: (String value) {
                                    //   numbc = value;
                                    // },
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: RaisedButton(
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () async {
                                      if (_formkey.currentState.validate()) {
                                        setState(() {
                                          unSubmit = false;
                                        });
                                        SharedPreferences sharedPreferences =
                                            await SharedPreferences
                                                .getInstance();
                                        final int userId =
                                            sharedPreferences.getInt('userId');
                                        final int locationId = sharedPreferences
                                            .getInt('businessId');
                                        FormData data = FormData.fromMap({
                                          'nom': null,
                                          'def_ord': null,
                                          'chefequipe_id': userId,
                                          'location_id': locationId,
                                          'datechargement': dateChargement,
                                          'reference_bl': bonLivraison,
                                          'status': cmdStatus,
                                          'commande_id': commandId,
                                          'numerochargement': numeroChargement,
                                          'chauffeur_id': chauffeurId,
                                          'vehicule_id': vehiculeId,
                                          'convoyeur': convoyeurId,
                                        });
                                        Dio dio = new Dio();
                                        await dio
                                            .post(mUrl, data: data)
                                            .then((response) async {
                                          if (response.statusCode == 200) {
                                            if (response.data['success'] !=
                                                null) {
                                              String message =
                                                  response.data['success'];
                                              final SharedPreferences
                                                  sharedPreferences =
                                                  await SharedPreferences
                                                      .getInstance();
                                              sharedPreferences.setBool(
                                                  'isMission', true);
                                              setState(() {
                                                unSubmit = true;
                                              });
                                              showMyDialog(
                                                  context: context,
                                                  msg: message,
                                                  route: '/home');
                                            }
                                          } else {
                                              unSubmit = true;
                                              print(response.data['error']);
                                          }
                                        }).catchError((error) => print(error));
                                      } else {
                                        print("UnSuccessfull");
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        side: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1)),
                                    textColor: Colors.white,
                                    child: Text(
                                      "Créer",
                                      style: style(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              })
          : LoadingProgress(),
    );
  }
}
