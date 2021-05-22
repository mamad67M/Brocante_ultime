import 'dart:convert';
import 'package:flutter_app_brocante/widgets/DrawerSideBar.dart';
import 'package:flutter_app_brocante/screen/AddStandForm.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Stand extends StatefulWidget {
  const Stand({Key key}) : super(key: key);

  @override
  _StandState createState() => _StandState();
}

class _StandState extends State<Stand> {

  Future allStands() async {
    var url = "http://jdevalik.fr/api/brocante/api/readstand.php";
    Uri uri = Uri.parse(url);
    try {
      var response = await http.get(uri);
      return json.decode(response.body);
    } catch (e) {
      print('error Url Read Stands');
      print(e.toString());
    }
  }

  Future _deleteStand(String id) async {
    var url = "http://jdevalik.fr/api/brocante/api/deletestand.php";
    Uri uri = Uri.parse(url);
    try {
      var response = await http.post(uri,
                     body: jsonEncode(<String, String>{"id": id}));
      print(response.body);
    } catch (e) {
      print('error Url Delete Emplacement');
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
            future: allStands(),
            builder: (context,snapshot){
              if (snapshot.hasError){print(snapshot.error);}
              return snapshot.hasData
                  ?ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    List list = snapshot.data;
                    return ListTile(
                      // leading: GestureDetector(
                      //   child: Icon(Icons.edit),
                      //   onTap: (){
                      //     print('Button Edit User Clicked');
                      //     Navigator.pushNamed(context,'/add_stand');
                      //     MaterialPageRoute(builder: (context) => AddStandForm(list:list,index:index));
                      //   },

                     // ),
                      title: Text(list[index]['name']==null?'...':list[index]['name']),
                      trailing: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: (){
                          print('Button Delete User Clicked');
                          // récupère l'id de l'enregistrement courant
                          _deleteStand(list[index]['id']);
                        },
                      ),
                    );
                  }
              )
                  : Center(child: CircularProgressIndicator());
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(Icons.add,),
            onPressed: (){   Navigator.pushNamed(context, '/add_stand');},
          ),

        )
    );
  }
}
