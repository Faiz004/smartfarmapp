import 'package:flutter/material.dart';

class drawerScreen extends StatefulWidget {
  drawerScreen({Key key}) : super(key: key);

  @override
  _drawerScreenState createState() => _drawerScreenState();
}

class _drawerScreenState extends State<drawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Faiz Hashmi',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            currentAccountPicture: Image.asset(
              'assets/images/SmartFarm.png',
              // height: MediaQuery.of(context).size.height * 0.2,
            ),
            accountEmail: Text('faizhashmi614@gmail.com',
             style: TextStyle(fontSize: 15.0, color: Colors.black),
             ),
            decoration: BoxDecoration(
                color: Colors.white),
          ),
          DrawerListTile(
            iconData: Icons.dashboard,
            title: 'Dashboard',
            onTilePressed: () {},
          ),
            DrawerListTile(
            iconData: Icons.person,
            title: 'Profile',
            onTilePressed: () {},
          ),
             DrawerListTile(
            iconData: Icons.insert_chart,
            title: 'Summary',
            onTilePressed: () {},
          ),
          
          DrawerListTile(
            iconData: Icons.settings,
            title: 'Settings',
            onTilePressed: () {},
          ),
          Divider(),
          DrawerListTile(
            iconData: Icons.contact_phone,
            title: 'Contact',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.announcement,
            title: 'FAQs',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.info,
            title: 'About',
            onTilePressed: () {},
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile({Key key, this.iconData, this.title, this.onTilePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
