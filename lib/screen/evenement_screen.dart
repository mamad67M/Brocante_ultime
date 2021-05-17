import 'package:flutter_app_brocante/models/evenement.dart';
import 'package:flutter/material.dart';

class EvenementScreen extends StatefulWidget {
  const EvenementScreen({Key key}) : super(key: key);

  @override
  _EvenementScreenState createState() => _EvenementScreenState();
}

class _EvenementScreenState extends State<EvenementScreen> {

  List<Evenement> evenements = [
    Evenement(comments: 'Bonnes Affaires', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', date: '25-05-2021'),
    Evenement(comments: 'Festivité', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', date: '25-05-2021'),
    Evenement(comments: 'Tradition', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', date: '25-05-2021'),
    Evenement(comments: 'Histoire', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', date: '25-05-2021'),
    Evenement(comments: 'Convivialité', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', date: '25-05-2021')

  ];
  Widget serviceTemplate(e) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                e.comments,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                e.text,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),

              SizedBox(height: 6.0),
              Text(
                e.date,
                style: TextStyle(
                  fontSize: 12.0,
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

        title: Text('Our Events',
          style: TextStyle(
            letterSpacing: 3,
            fontSize: 30,
            fontFamily: 'IndieFlower',
            fontWeight: FontWeight.bold

          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,

      ),

      body: SingleChildScrollView(
        child: Column(
          children: evenements.map((e) => serviceTemplate(e)).toList(),
        ),
      ),
    );
  }
}
