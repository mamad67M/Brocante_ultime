
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app_brocante/widgets/DrawerSideBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_brocante/widgets/InputDeco_design.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email;
  String password;
  bool val = false;
  String _errorPasswordOrEmailWrong = "";

  _signIn(String email, String password) async {
    print('login');

    Map data = {
      'email' : email,
      'password' : password
    };
    print(data);
    Uri uri = Uri.parse('http://jdevalik.fr/api/brocante/api/login.php');
    var response = await http.post(uri, body : json.encode(data));
    print(uri.toString());
    print(response.body);
    if (response.statusCode == 200) {
      //print('succeed');
      var jsonData = json.decode(response.body);
      print(jsonData['token']);
      final storage = new FlutterSecureStorage();
      storage.write(key: "token", value: jsonData['token']);
      storage.write(key: "login", value: email);
      storage.write(key: "password", value: password);
     // setState(() {
     //   _errorPasswordOrEmailWrong = "";
     // });

      Navigator.pushNamed(context, '/home');

    }
    if (response.statusCode == 401){
      setState(() {
        _errorPasswordOrEmailWrong = 'Email et/ou mot de passe incorrect(s)';
      });

      print('bad email OR bad password');
    }
  }

  void onchange(s) {
    setState(() {
      this.val = s;
    });
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildLoginBtn() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: (){
            
            if(_formkey.currentState.validate())
            {
              _formkey.currentState.save();
              _signIn(email, password);
              //Navigator.pushNamed(context, '/home');
            }


          },
          child: Text(
            'CONNEXION',
            style: TextStyle(
              color: Colors.white,//Color(0xFF62C3A3),
              letterSpacing: 2.0,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'IndieFlower',
            ),

          ),
          style: ElevatedButton.styleFrom(
            primary:Colors.green,// Color(0xFFf5f5f5),
            elevation: 5.0,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('BROCANTE',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'IndieFlower',
              letterSpacing: 3.0
            ),
          ),
          centerTitle: true,
          elevation: 10,
        ),
       // drawer: DrawerSideBar(),
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
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(Icons.email, "email"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'l\'email est requis';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'le format email n\'est pas valide';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        email = value;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 10, right: 10),
                    child: TextFormField(

                      keyboardType: TextInputType.text,
                      decoration: buildInputDecoration(
                          Icons.lock, "Mot de Passe"),
                      obscureText: true,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Veuillez entrer le Mot de Passe';
                        }
                        if (value.length < 5) {
                          return ' le mot de passe doit contenir au moins 6 caracteres ';
                        }
                        return null;
                      },
                        onSaved: (String value) {
                        password = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(

                      children: [
                        Checkbox(
                            activeColor: Colors.green,
                            value: val, onChanged: onchange),
                        Text(
                          'se souvenir de moi',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            fontFamily: 'IndieFlower'
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(_errorPasswordOrEmailWrong),
                  SizedBox(height: 10),

                   Padding(
                     padding: const EdgeInsets.all(14),
                     child: _buildLoginBtn(),
                   ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}