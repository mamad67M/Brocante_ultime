import 'package:flutter/material.dart';

class GalleryPhotos extends StatelessWidget {

  List<String> images = ["http://jdevalik.fr/api/brocante/api/uploads/d309b883-61a1-4f0e-8f7c-a743773c62f74611565953038551556.jpg"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
       Scaffold(
        appBar: AppBar(
        title: Text("GALERIE",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'IndieFlower',
            letterSpacing: 2.0,
          ),),
        centerTitle: true,
        backgroundColor: Colors.green,
          elevation: 10,
        ),
        body: Container(
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (BuildContext context, int index){
        return Image.network(images[index]);
        },
    )
    ),
    );
  }
}