import 'package:flutter_app_brocante/widgets/DrawerSideBar.dart';
import 'package:flutter/material.dart';

class ListeStands extends StatefulWidget {
  const ListeStands({Key key}) : super(key: key);

  @override
  _ListeStandsState createState() => _ListeStandsState();
}

class _ListeStandsState extends State<ListeStands> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title:Text('Stands',
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
                  child:Text('Liste des Stands')
              )
          ),

        )
    );
  }
}
