import 'package:flutter/material.dart';

class DemoRadiobuttons extends StatefulWidget {
  @override
  _DemoRadiobuttonsState createState() => _DemoRadiobuttonsState();
}

class _DemoRadiobuttonsState extends State<DemoRadiobuttons> {

  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Nicesnippets'),
        ),
        body: Padding(

            padding: EdgeInsets.all(10),

            child: ListView(
              children: [
                
                   Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 50),
                      child: Text(
                        'Radio Button',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),


                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        'Marlenheim',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        'Dahlenheim',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Radio(
                        value: 2,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        'Odratzheim',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      Radio(
                        value: 3,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                       'Westhoffen',
                        style: new TextStyle(fontSize: 16.0),
                    ),
                    ],

                  ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text('Button'),
                      onPressed: () {
                        print(nameController.text);
                      },
                    )),
              ],
            )));
  }


}