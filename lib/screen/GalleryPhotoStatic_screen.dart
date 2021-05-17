import 'package:flutter/material.dart';

class MyGallerySamples1 extends StatelessWidget {

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
              letterSpacing: 3.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 10,
        ),
        body: Container(
            padding: EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: <Widget>[
                Image.network("http://10.0.2.2/API/Employee/api/uploads/woman.jpg"),
                Image.network("http://10.0.2.2/API/Employee/api/uploads/woman.jpg"),
                Image.network("http://10.0.2.2/API/Employee/api/uploads/woman.jpg"),
                Image.network("http://10.0.2.2/API/Employee/api/uploads/woman.jpg"),
                Image.network("http://10.0.2.2/API/Employee/api/uploads/woman.jpg"),
                Image.network("http://10.0.2.2/API/Employee/api/uploads/woman.jpg"),
                Image.network("http://10.0.2.2/API/Employee/api/uploads/woman.jpg"),
                Image.network("http://10.0.2.2/API/Employee/api/uploads/woman.jpg"),
              ],
            )
        ),
      );
  }
}