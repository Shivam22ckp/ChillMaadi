import 'package:FoodOrderingApp/admin/Order_admin.dart';
import 'package:FoodOrderingApp/admin/admin_users.dart';

import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  AdminHome({Key key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chill Maadi",
          style: TextStyle(fontFamily: 'Pacifico', fontSize: 30.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 76.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Admin Page",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderAdmin()));
                  },
                  child: Container(
                    height: 100,
                    width: 150,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Center(
                      child: Text(
                        "Orders",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserAdmin()));
                  },
                  child: Container(
                    height: 100,
                    width: 150,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Center(
                      child: Text(
                        "Users",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
