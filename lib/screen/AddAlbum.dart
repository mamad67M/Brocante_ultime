import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddAlbum extends StatefulWidget {
  final List list;
  final int index;
  const AddAlbum(
      {Key key, this.list,this.index})
      : super(key: key);
  @override
  _AddAlbumState createState() => _AddAlbumState();
}

class _AddAlbumState extends State<AddAlbum> {
  TextEditingController titleController;

  bool editmode = false;

  Future addUpdateData() async{
      print('Enter API call album');
      var url = "http://jdevalik.fr/api/brocante/api/createalbum.php";
      Uri uri = Uri.parse(url);
      try {

        var response = await http.post(uri,
            body: jsonEncode(<String, String>{
              "title": titleController.text,
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
    titleController = TextEditingController(text:'');
    if(widget.index!=null){
      editmode = true;
      titleController.text = widget.list[widget.index]['title'];
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(editmode?'Modifier':'Ajout Album')) ,
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
            ),
            ElevatedButton(onPressed: (){ addUpdateData();
            Navigator.pop(context);
            },
                child: Icon(Icons.verified)

            ),
          ],
        )
    );
  }
}
