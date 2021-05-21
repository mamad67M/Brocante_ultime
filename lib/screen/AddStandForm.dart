import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_brocante/widgets/InputDeco_design.dart';
import 'package:http/http.dart' as http;

class AddStandForm extends StatefulWidget {
  final List list;
  final int index;

  const AddStandForm(
      {Key key, this.list,this.index})
      : super(key: key);
  @override
  _AddStandFormState createState() => _AddStandFormState();
}

class _AddStandFormState extends State<AddStandForm> {

  String numemp;
  String comment;
  String name;
  String longueur;
  String zero;




  bool editmode = false;

  final _formKey = GlobalKey<FormState>();

  Future addUpdateData() async{
    print('Enter API call Stand');
    var url = "http://jdevalik.fr/api/brocante/api/createstand.php";
    Uri uri = Uri.parse(url);
    try {
      String body;
      body = jsonEncode(<String, String>{
        'numemp' : numemp,
        'name' : name,
        'comment' : comment,
        'longueur' : longueur,
        'zoneid' : zero,
        'brocanteid' : zero
      });
      var response = await http.post(uri,
          body: body);
      print('API call stand Done');
      print(body);

      // return json.decode(response.body);
    } catch (e) {
      print('error Url Create Stand');
      //print("Error" + e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    if(widget.index!=null){
      editmode = true;
         }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
//1    numempController.dispose();
    super.dispose();
  }

  Widget buildInNumemp(){
   return Padding(
      padding: const EdgeInsets.only(
          bottom: 15, left: 10, right: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: buildInputDecoration(Icons.location_city, "Emplacement"),
        validator: (String value) {
          if (value.isEmpty) {
            return 'le numéro d\'emplacement est requis';
          }
          return null;
        },
        onSaved: (String value) {
          numemp = value;
        },
      ),
    );
  }

  Widget builtInName(){
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 15, left: 10, right: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: buildInputDecoration(Icons.local_activity, "Name"),
        validator: (String value) {
          if (value.isEmpty) {
            return 'le nom du stand est requis';
          }
          return null;
        },
        onSaved: (String value) {
          name = value;
        },
      ),
    );
  }

  Widget builtInComment(){
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 15, left: 10, right: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: buildInputDecoration(Icons.comment, "Commentaire"),
        validator: (String value) {
          if (value.isEmpty) {
            return 'le commentaire du stand est requis';
          }
          return null;
        },
        onSaved: (String value) {
          comment = value;
        },
      ),
    );
  }

  Widget builtInLongueur(){
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 15, left: 10, right: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: buildInputDecoration(Icons.format_size, "Longueur"),
        validator: (String value) {
          if (value.isEmpty) {
            return 'la longueur du stand est requis';
          }
          return null;
        },
        onSaved: (String value) {
          longueur = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
            title: Text(editmode?'Modifier':'Ajout Album',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily:  'IndieFlower',
              letterSpacing: 3.5
          ),
        )) ,

        body: SingleChildScrollView(

        child: Form(

        key: _formKey,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              height: 10,
            ),

            buildInNumemp(),
            SizedBox(
              height: 10,
            ),
            builtInName(),
            SizedBox(
              height: 10,
            ),
            builtInComment(),
            SizedBox(
              height: 10,
            ),
            builtInLongueur(),
            ElevatedButton(onPressed: (){
                if(_formKey.currentState.validate())
                 {
                   _formKey.currentState.save();
                   addUpdateData();
                   Navigator.pop(context);
                 }

            },
                child: Icon(Icons.verified)

            ),
          ],
        )
       )
     )
    );
  }
}
