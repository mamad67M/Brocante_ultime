import 'package:flutter_app_brocante/screen/AddAlbum.dart';
import 'package:flutter_app_brocante/screen/AddOrEditUser_screen.dart';
import 'package:flutter_app_brocante/screen/GalleryPhotoDynamic_screen.dart';
import 'package:flutter_app_brocante/screen/GalleryPhotoStatic_screen.dart';
import 'package:flutter_app_brocante/screen/admin_screen.dart';
import 'package:flutter_app_brocante/screen/album_screen.dart';
import 'package:flutter_app_brocante/screen/camera_screen.dart';
import 'package:flutter_app_brocante/screen/combobox_screen.dart';
import 'package:flutter_app_brocante/screen/evenement_screen.dart';
import 'package:flutter_app_brocante/screen/gallery_stands_screen.dart';
import 'package:flutter_app_brocante/screen/home_screen.dart';
import 'package:flutter_app_brocante/screen/liste_stands_screen.dart';
import 'package:flutter_app_brocante/screen/login_screen.dart';
import 'package:flutter_app_brocante/screen/pictures_screen.dart';
import 'package:flutter_app_brocante/screen/radiobuttons.dart';
import 'package:flutter_app_brocante/screen/service_screen.dart';
import 'package:flutter_app_brocante/screen/stand_screen.dart';
import 'package:flutter_app_brocante/screen/start_screen.dart';
import 'package:flutter_app_brocante/widgets/DrawerSideBar.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


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
          '/radiobutton':(context) => DemoRadiobuttons(),
          '/dropdown':(context) => DropDown(),
          '/admin':      (context) => Admin(),
          '/album':      (context) => Album(),
          '/'
          '/addalbum' :  (context) => AddAlbum(),
          '/addedituser': (context) => AddOrEditUser(),
          '/galerie':    (context) => GalleryVillagePhotos(),
          '/dashbord':   (context) => DrawerSideBar(),
          '/service' :   (context) => ServiceScreen(),
          '/evenement' : (context) => EvenementScreen(),




        }
        );
  }
}

