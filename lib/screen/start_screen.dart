import 'package:flutter_app_brocante/widgets/DrawerSideBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[800]
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(' KIRCHHEIM',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          fontFamily:  'IndieFlower',
                          letterSpacing: 3.5
                        ),
                      ),
                      Divider(
                        height: 40.0,
                        color: Colors.lightGreenAccent,
                      ),
                      SizedBox(height: 10.0),

                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70,
                        child:
                        Image(
                            image: AssetImage('assets/woman.jpg',
                            )
                        ),
                        ),

                      SizedBox(height: 10.0),
                      Text('Bienvenue au village!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'IndieFlower',
                          letterSpacing: 2.0,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text('la fête du roi DAGOBERT, à la découverte d\' une tradition, bonnes affaires garanties!' ,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'IndieFlower',
                          letterSpacing: 2.0,
                      ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
