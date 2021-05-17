import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GalleryVillagePhotos extends StatelessWidget {

  List photosList = [];
  Future<List> AllPhotos() async {
    print("Enter Gallerie photos function");
    var url = "http://jdevalik.fr/api/brocante/api/readpictures.php";
    Uri uri = Uri.parse(url);
    try {
      var response = await http.get(uri);
      photosList = json.decode(response.body);
      print(photosList);
      return json.decode(response.body);
    } catch (e) {
      print('error Url ReadPictures');
      print(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
        appBar: AppBar(
          title: Text("GALERIE",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'IndieFlower',
              letterSpacing: 2.0,
            ),),
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 10,
        ),
        body:        FutureBuilder(
          future: AllPhotos(),
          builder: (context,snapshot){
            if (snapshot.hasError){print(snapshot.error);}
            return snapshot.hasData
                ?Container(
                padding: EdgeInsets.all(8.0),

                child:GridView.builder(
                itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0
                    ),
                    itemBuilder: (BuildContext context, int index){
                      List list = snapshot.data;
                      return Image.network("http://10.0.2.2/API/Employee/api/uploads/${list[index]['filename']}");
                }
            )
            )

                : Center(child: CircularProgressIndicator());
          },
        ),

      );
  }
}