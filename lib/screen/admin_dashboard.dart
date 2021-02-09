import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trial_three/authenticate/auth.dart';
import 'package:flutter_trial_three/screen/admin_userlist.dart';
import 'package:flutter_trial_three/admin_contact/admin_user_contact.dart';
import 'package:flutter_trial_three/admin_user_info/admin_info.dart';
import 'login.dart';

class AdminDashboardPage extends StatefulWidget {
  static const routeName = '/adminDashboard';
  @override
  _AdminDashboardPageState createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {

  final AuthService _auth = AuthService();

  createConfirmation(BuildContext context){
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop(false);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed:  () async {
        try {
          await _auth.signOut();
          setState() {
          };
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new LoginPage()));
        }catch(e){
          return Container();
        }
      },

    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Are you sure you want to log out?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
    final padding = const EdgeInsets.all(4.0);

    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFA8072),
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Monitor User"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new DrawerHeader(

            ),
            new ListTile(
              leading: new Icon(Icons.exit_to_app),
              title: new Text('Log out'),
              onTap: () async {
                createConfirmation(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 130,
              child: Padding(
                padding: padding,
                child: Card(
                  shape: border,
                  elevation: 3.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    child: Row(
                      children: [
                        Icon(Icons.face_rounded, size: 50, color: Color(0xFFFF5555)),
                        Text(
                          'Hi, Administrator',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //USER LIST
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AdminUserListPage();
                    },
                  ),
                );
              },
              child: Expanded(
                child: Padding(
                  padding: padding,
                  child: Card(
                    shape: border,
                    elevation: 3.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          child: Row(
                            children: [
                              Icon(Icons.wb_sunny, size: 50, color: Color(0xFFffc75f),),
                              Text(
                                'User Diagnosis Result',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AdminUserContact();
                    },
                  ),
                );
              },
              child: Expanded(
                child: Padding(
                  padding: padding,
                  child: Card(
                    shape: border,
                    elevation: 3.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          child: Row(
                            children: [
                              Icon(Icons.contact_page, size: 50, color: Color(0xFF1687a7)),
                              Text(
                                'User Contact',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return adminInfo();
                    },
                  ),
                );
              },
              child: Expanded(
                child: Padding(
                  padding: padding,
                  child: Card(
                    shape: border,
                    elevation: 3.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),

                          child: Text(
                            'User Travel Information',
                            style: TextStyle(
                              fontSize: 27,
                            ),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
