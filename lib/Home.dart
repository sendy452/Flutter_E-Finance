import 'pages/DashboardFragments.dart';
import 'pages/PemasukanFragments.dart';
import 'pages/PengeluaranFragments.dart';
import 'pages/LaporanFragments.dart';
import 'pages/SettingsFragments.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Define a DrawerItem data object
class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

//Homepage
class HomePage extends StatefulWidget {
  //Define drawer items, strings and icons
  final drawerItems = [
    new DrawerItem("Dashboard", Icons.home),
    new DrawerItem("Pemasukan", Icons.arrow_forward),
    new DrawerItem("Pengeluaran", Icons.arrow_back),
    new DrawerItem("Laporan", Icons.article),
    new DrawerItem("Pengaturan", Icons.settings)
  ];

  //Create and Return state for this 'StatefulWidget'
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

//Define state for our homepage.
class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  //Use a switch statement to return the Pages for a selected item
  _getDrawerFragment(int pos) {
    switch (pos) {
      case 0:
        return new DashboardFragments();
      case 1:
        return new PemasukanFragments();
      case 2:
        return new PengeluaranFragments();
      case 3:
        return new LaporanFragments();
      case 4:
        return new SettingsFragments();

      default:
        return new Text("Error");
    }
  }

  //Update the selectedDrawerItemIndex the close the drawer
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    //Close the drawer
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    //Create drawer list items. Each list will have an icon and title
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    //Scaffold homepage drawer
    return new Scaffold(
      appBar: new AppBar(
        //Dynamically display title of selected page
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      //Make Drawer to the Scaffold
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            //Create a material design drawer header with account name, email,avatar
            new UserAccountsDrawerHeader(
              accountName: new Container(
                child: new Text ("Oclemy"),
                decoration: new BoxDecoration (
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(4.0)
                ),
                padding: new EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
              ),
              accountEmail: new Container(
                child: new Text ("oclemmi@gmail.com"),
                decoration: new BoxDecoration (
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(4.0)
                ),
                padding: new EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage("assets/user.png"),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage("assets/finance.png"),
                      fit: BoxFit.cover)),
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerFragment(_selectedDrawerIndex),
    );
  }
}
