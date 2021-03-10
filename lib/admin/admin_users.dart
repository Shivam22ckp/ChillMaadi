import 'package:FoodOrderingApp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserAdmin extends StatefulWidget {
  UserAdmin({Key key}) : super(key: key);

  @override
  _UserAdminState createState() => _UserAdminState();
}

class _UserAdminState extends State<UserAdmin> {
  Stream userStream;

  Widget seeUser() {
    return StreamBuilder(
      stream: userStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    padding: EdgeInsets.only(left: 10, top: 10),
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ds['name'],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          ds['username'],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          ds['email'],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        RaisedButton(
                            color: Colors.blue,
                            onPressed: () async {
                              await FirebaseFirestore.instance.runTransaction(
                                  (Transaction myTransaction) async {
                                await myTransaction.delete(
                                    snapshot.data.docs[index].reference);
                              });
                            },
                            child: Text(
                              "Remove User",
                            )),
                      ],
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void initState() {
    super.initState();
    doonthisLaunc();
  }

  getAdminUsers() async {
    userStream = await DatabaseMethods().getUser();
    setState(() {});
  }

  doonthisLaunc() {
    getAdminUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: seeUser(),
    );
  }
}
