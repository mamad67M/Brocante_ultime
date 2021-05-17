import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class Company{
  int id;
  String name;
  Company(this.id,this.name);
  static List<Company> GetCompanies(){
    return <Company>[
      Company(1, 'Dahlenheim'),
      Company(2, 'Marlenheim'),
      Company(3, 'Odratzheim'),
      Company(4, 'Westhoffen'),
    ];
  }
}

class _DropDownState extends State<DropDown> {

  List<Company> _companies = Company.GetCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedcompany;

  @override
  void initState() {
    // TODO: implement initState
    _dropdownMenuItems = buidlDropDownMenuItems(_companies);
    super.initState();
  }

  List<DropdownMenuItem<Company>> buidlDropDownMenuItems(List companies){
    List<DropdownMenuItem<Company>> items = [];
    for(Company company in companies){
      items.add(DropdownMenuItem(
                    value:company,
                    child: Text(company.name)
                )
      );
      return items;
    }
  }

  onChangedDropDownItem(Company selectedcompany){
    setState(() {
      selectedcompany = _selectedcompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drop down example")),
      body: Center(
        child: Container(
          child: Column(
            children: [Text("Select company"),
                      SizedBox(height: 20.0),
                      DropdownButton(
                        value: _selectedcompany,
                        items: _dropdownMenuItems,
                        onChanged: onChangedDropDownItem ,
                        ),
                      SizedBox(height: 20.0),
                      Text("Selected:$_selectedcompany.name")
            ],
          ),
        ),
      ),
    );
  }
}
