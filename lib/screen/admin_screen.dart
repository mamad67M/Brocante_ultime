import 'dart:convert';
import 'package:flutter_app_brocante/widgets/DrawerSideBar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({Key key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  Future allUsers() async {
    var url = "http://jdevalik.fr/api/brocante/api/readuser.php";
    Uri uri = Uri.parse(url);
    try {
      var response = await http.get(uri);
      return json.decode(response.body);
    } catch (e) {
      print('error Url Readuser');
      print(e.toString());
    }
  }

  Future deleteUser(int id) async {
    var url = "http://10.0.2.2/API/Employee/api/deleteuser.php";
    Uri uri = Uri.parse(url);
    try {
      var response = await http.post(uri,body: jsonEncode(<String, String>{"id": id.toString()}));
      setState(() {

      });
      //return json.decode(response.body);
    } catch (e) {
      print('error Url Readuser');
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
             backgroundColor: Colors.green,
            title:Text('Moderation',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  fontFamily: 'IndieFlower',
                  letterSpacing: 2
                )
            ),
            centerTitle: true,
            elevation: 10,

          ),
          body:
          FutureBuilder(
            future: allUsers(),
            builder: (context,snapshot){
              if (snapshot.hasError){print(snapshot.error);}
              return snapshot.hasData
                  ?ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    List list = snapshot.data;
                    return ListTile(
                      leading: GestureDetector(
                        child: Icon(Icons.edit),
                        onTap: (){
                            print('Button Edit User Clicked');
                            Navigator.pushNamed(context, '/addedituser');
                            },
                      ),
                      title: Text(list[index]['nom']==null?'...':list[index]['nom']),
                      trailing: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: (){
                          print('Button Delete User Clicked');
                          // récupère l'id de l'enregistrement courant
                          int id = list[index]['id'];
                          deleteUser(id);
                        },
                      ),
                    );
              }
              )
                  : CircularProgressIndicator();
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){   Navigator.pushNamed(context, '/addedituser');},
          ),

        )
    );
  }
}
