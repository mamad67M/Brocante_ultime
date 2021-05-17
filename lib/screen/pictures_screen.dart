import 'package:flutter_app_brocante/widgets/DrawerSideBar.dart';
import 'package:flutter/material.dart';

class Photos extends StatefulWidget {
  const Photos({Key key}) : super(key: key);

  @override
  _PhotosState createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title:Text('Galeries',
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
         // drawer: DrawerSideBar(),
          body:
          Container(
              child:Center(
                  child:Text('Liste des photos')
              )
          ),

        )
    );
  }
}
