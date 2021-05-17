import 'dart:convert';
import 'package:flutter_app_brocante/widgets/DrawerSideBar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Album extends StatefulWidget {
  const Album({Key key}) : super(key: key);

  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {

  Future allAlbums() async {
    var url = "http://jdevalik.fr/api/brocante/api/readalbum.php";
    Uri uri = Uri.parse(url);
    try {
      var response = await http.get(uri);
      return json.decode(response.body);
    } catch (e) {
      print('error Url ReadAlbums');
      print(e.toString());
    }
  }

  Future _deleteAlbum(int id) async {

    var url = "http://10.0.2.2/API/Employee/api/deletealbumshort.php";
    Uri uri = Uri.parse(url);
    try {
      var response = await http.post(uri,body: {"id": id.toString()});
      var res = response.body;
      if (res == "true"){
        print("success album deleted");
      }else{
        print("failure album not deleted");
      }
        //return json.decode(response.body);
    } catch (e) {
      print('error Url Delete Albums');
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
            future: allAlbums(),
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
                      title: Text(list[index]['title']==null?'...':list[index]['title']),
                      trailing: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: (){
                          print('Button Delete User Clicked');
                          // récupère l'id de l'enregistrement courant
                          int id = int.parse(list[index]['id']);
                          _deleteAlbum(id);
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
            onPressed: (){   Navigator.pushNamed(context, '/addalbum');},
          ),

        )
    );
  }
}
