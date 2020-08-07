import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartfarmapp/pages/loginPage.dart';

class drawerScreen extends StatefulWidget {
  final SharedPreferences prefs;

  drawerScreen(this.prefs, {Key key}) : super(key: key);

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
              '${widget.prefs.getString('name')}',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            currentAccountPicture: Image.asset(
              'assets/images/SmartFarm.png',
              // height: MediaQuery.of(context).size.height * 0.2,
            ),
            accountEmail: Text(
              '${widget.prefs.getString('email')}',
              style: TextStyle(fontSize: 15.0, color: Colors.black),
            ),
            decoration: BoxDecoration(color: Colors.white),
          ),
          DrawerListTile(
            iconData: Icons.dashboard,
            title: 'Dashboard',
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.insert_chart,
            title: 'Summary',
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
          ),
          DrawerListTile(
            iconData: Icons.transit_enterexit,
            title: 'Logout',
            onTilePressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('usertoken');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => loginPage(widget.prefs),
                  ));
            },
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
