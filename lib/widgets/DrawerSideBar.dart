import 'package:flutter/material.dart';

class DrawerSideBar extends StatefulWidget {
  final bool isVisible;
  const DrawerSideBar({Key key, this.isVisible})
      : super(key: key);
  @override
  _DrawerSideBarState createState() => _DrawerSideBarState();
}

class _DrawerSideBarState extends State<DrawerSideBar> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Center(child: DrawerHeader(child: Text('BROCANTE',
            style: TextStyle(
                fontFamily: 'IndieFlower',
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.green[400],
                letterSpacing: 2.0
            ),
          ))),

       Visibility(
          visible: widget.isVisible,
          child:CustomListTile(Icons.place, 'Stands',
               () => {Navigator.pushNamed(context, '/stands')})),
          CustomListTile(Icons.place, 'Stands',
                  () => {Navigator.pushNamed(context, '/stands')}),
          CustomListTile(Icons.picture_in_picture, 'Galerie',
                 () => {Navigator.pushNamed(context, '/galerie')}),
          CustomListTile(Icons.event, 'Evenements',
                  () => {Navigator.pushNamed(context, '/evenement')}),
          CustomListTile(Icons.add, 'Ajout Stand',
                  () => {Navigator.pushNamed(context, '/add_stand')}),
          CustomListTile(Icons.home_repair_service, 'Service',
                  () => {Navigator.pushNamed(context, '/service')}),
          CustomListTile(Icons.person, 'Login',
                  () => {Navigator.pushNamed(context, '/login')}),
          CustomListTile(Icons.camera_alt, 'Camera',
                  () => {Navigator.pushNamed(context, '/camera')}),
          Visibility(
            visible: widget.isVisible,
            child: CustomListTile(Icons.lock, 'admin',
                    () => {Navigator.pushNamed(context, '/admin')}),
          ),
        ],
      ),
    );
  }

}


class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  Widget Title() => Padding(
    padding: const EdgeInsets.all(8),
    child: Text(text, style: TextStyle(fontSize: 14)),
  );

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        splashColor: Colors.orangeAccent,
        onTap: onTap,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  Title(),
                ],
              ),
              Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
