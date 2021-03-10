import 'package:FoodOrderingApp/admin/home_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminState extends StatefulWidget {
  AdminState({Key key}) : super(key: key);

  @override
  _AdminStateState createState() => _AdminStateState();
}

class _AdminStateState extends State<AdminState> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _adminIdTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.pink, Colors.lightGreenAccent],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          )),
          title: Text(
            "Chill Maadi",
            style: TextStyle(
                color: Colors.white, fontSize: 30.0, fontFamily: 'Pacifico'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: new LinearGradient(
              colors: [Colors.pink, Colors.lightGreenAccent],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            )),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "images/admin.png",
                    height: 240,
                    width: 240,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Admin",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextField(
                          controller: _adminIdTextEditingController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.person), hintText: "Email"),
                        ),
                        TextField(
                          controller: _passwordTextEditingController,
                          decoration: InputDecoration(
                              icon: Icon(Icons.person), hintText: "Password"),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () {
                    if (_adminIdTextEditingController.text.isNotEmpty &&
                        _passwordTextEditingController.text.isNotEmpty) {
                      LoginAdmin();
                    }
                  },
                  color: Colors.pink,
                  child: Text(
                    "LogIn",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  LoginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['id'] != _adminIdTextEditingController.text.trim()) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text("Your id is not correct")));
        } else if (result.data()['password'] !=
            _passwordTextEditingController.text.trim()) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Your password is not correct")));
        } else {
          Route route = MaterialPageRoute(builder: (context) => AdminHome());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}
