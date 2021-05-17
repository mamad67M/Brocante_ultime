import 'package:flutter_app_brocante/screen/start_screen.dart';
import 'package:flutter_app_brocante/widgets/DrawerSideBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _storage = new FlutterSecureStorage();
  String _token;
  bool _isAdministrator = false;

  void _loadToken() async {

    String token;
    Map<String, String> allValues = await _storage.readAll();
    if (allValues.isNotEmpty) {
      token = await _storage.read(key: "token");
    }
    setState(() {
      _token = token;
      _isAdministrator = (token!=null);
    });
    print("token : $token");
  }

  _close(){
    _storage.deleteAll();
    SystemNavigator.pop();
  }

  _logout(){
    _storage.deleteAll();
    setState(() {
      _token = null;
      _isAdministrator = false; });
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
                   backgroundColor: Colors.green,
                   title: Text((_token==null)?"BROCANTE":"B $_token",
                   style: TextStyle(fontFamily: 'IndieFlower',
                   fontSize: 20,
                   letterSpacing: 3,
                   fontWeight: FontWeight.bold),
                   ),
            actions: [

              IconButton(
                  icon: Icon(Icons .logout),
                  onPressed: (){ _logout();}
              ),

              IconButton(
                icon: Icon(Icons .close),
                onPressed: (){  _close(); }
                ),
            ],
            centerTitle: true,
            elevation: 10,
          )
          ,
          drawer: DrawerSideBar(isVisible: _isAdministrator),
          body: StartScreen(),
        ));

  }
}
