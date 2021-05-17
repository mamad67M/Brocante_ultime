import 'package:flutter_app_brocante/models/service.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  List<Service> services = [
    Service(comments: 'Animation', text: 'Be yourself; everyone else is already taken'),
    Service(comments: 'Restauration', text: 'I have nothing to declare except my genius'),
    Service(comments: 'Buvette', text: 'The truth is rarely pure and never simple'),
    Service(comments: 'Sanitaire', text: 'The truth is rarely pure and never simple')
  ];

  // le widget card
  Widget serviceTemplate(s) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                s.comments,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                s.text,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),

            ],
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(

        title: Text('Our Servicies',
        style: TextStyle(
          letterSpacing: 3,
          fontSize: 30,
          fontFamily: 'IndieFlower',
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,

      ),

      body: Column(
        children: services.map((s) => serviceTemplate(s)).toList(),
      ),
    );
  }
}
