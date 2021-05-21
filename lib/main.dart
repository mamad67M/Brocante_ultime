
import 'package:flutter_app_brocante/screen/AddOrEditUser_screen.dart';
import 'package:flutter_app_brocante/screen/AddStandForm.dart';
import 'package:flutter_app_brocante/screen/admin_screen.dart';
import 'package:flutter_app_brocante/screen/camera_screen.dart';
import 'package:flutter_app_brocante/screen/evenement_screen.dart';
import 'package:flutter_app_brocante/screen/gallery_stands_screen.dart';
import 'package:flutter_app_brocante/screen/home_screen.dart';
import 'package:flutter_app_brocante/screen/login_screen.dart';
import 'package:flutter_app_brocante/screen/service_screen.dart';
import 'package:flutter_app_brocante/screen/stand_screen.dart';
import 'package:flutter_app_brocante/screen/start_screen.dart';
import 'package:flutter_app_brocante/widgets/DrawerSideBar.dart';
import 'package:flutter/material.dart';


void main() => runApp(Brocante());

class Brocante extends StatefulWidget {
  const Brocante({Key key}) : super(key: key);

  @override
  _BrocanteState createState() => _BrocanteState();
}

class _BrocanteState extends State<Brocante> {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'la brocante',
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/start':      (context) => StartScreen(),
          '/home':      (context) => MyHomePage(),
          '/login':      (context) => Login(),
          '/camera':     (context) => CameraScreen(),
          '/stands':     (context) => Stand(),
          '/admin':      (context) => Admin(),
          '/addedituser': (context) => AddOrEditUser(),
          '/galerie':    (context) => GalleryVillagePhotos(),
          '/dashbord':   (context) => DrawerSideBar(),
          '/service' :   (context) => ServiceScreen(),
          '/evenement' : (context) => EvenementScreen(),
          '/add_stand' : (context) => AddStandForm(),

        }
        );
  }
}

