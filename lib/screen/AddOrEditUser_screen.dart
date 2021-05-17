import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddOrEditUser extends StatefulWidget {
  final List list;
  final int index;
  const AddOrEditUser(
      {Key key, this.list,this.index})
      : super(key: key);
  @override
  _AddOrEditUserState createState() => _AddOrEditUserState();
}

class _AddOrEditUserState extends State<AddOrEditUser> {
  TextEditingController nomController;
  TextEditingController prenomController;
  TextEditingController pseudoController;
  TextEditingController emailController;
  TextEditingController passwordController;

  bool editmode = false;

  Future addUpdateData() async{
    print('Enter API call album');
    var url = "http://jdevalik.fr/api/brocante/api/createuser.php";
    Uri uri = Uri.parse(url);
    try {

      var response = await http.post(uri,
          body: jsonEncode(<String, String>{
            "nom": nomController.text,
            "prenom" : prenomController.text,
            "password" : passwordController.text,
            "email": emailController.text,
            "pseudo" : pseudoController.text,
            "token" : 'erjhkerhekr'
          }));

      print('API call album Done');
      print(json.decode(response.body));
      // return json.decode(response.body);
    } catch (e) {
      print('error Url Create Album');
      print(e.toString());
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    nomController = TextEditingController(text:'');
    prenomController = TextEditingController(text:'');
    pseudoController = TextEditingController(text:'');
    emailController = TextEditingController(text:'');
    passwordController = TextEditingController(text:'');
    if(widget.index!=null){
      editmode = true;
      nomController.text = widget.list[widget.index]['nom'];
      prenomController.text = widget.list[widget.index]['prenom'];
      pseudoController.text = widget.list[widget.index]['pseudo'];
      emailController.text = widget.list[widget.index]['email'];
      passwordController.text = widget.list[widget.index]['password'];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text(editmode?'Modifier':'Ajout Compte')) ,
       body: ListView(
         children: [
           Padding(
             padding: EdgeInsets.all(8.0),
             child: TextField(
               controller: pseudoController,
               decoration: InputDecoration(labelText: 'Pseudo'),
           ),
         ),
           Padding(
             padding: EdgeInsets.all(8.0),
             child: TextField(
               controller: passwordController,
               decoration: InputDecoration(labelText: 'Mot de passe'),
             ),
           ),
           Padding(
             padding: EdgeInsets.all(8.0),
             child: TextField(
               controller: nomController,
               decoration: InputDecoration(labelText: 'Nom'),
             ),
           ),
           Padding(
             padding: EdgeInsets.all(8.0),
             child: TextField(
               controller: prenomController,
               decoration: InputDecoration(labelText: 'Prénom'),
             ),
           ),
           Padding(
             padding: EdgeInsets.all(8.0),
             child: TextField(
               controller: emailController,
               decoration: InputDecoration(labelText: 'Email'),
             ),
           ),
           ElevatedButton(onPressed: (){ addUpdateData();
                                         Navigator.pushNamed(context, '/home');
                                         },
                          child: Icon(Icons.verified)

           ),
        ],
       )  
    );
  }
}
