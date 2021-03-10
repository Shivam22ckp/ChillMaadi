import 'package:FoodOrderingApp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderAdmin extends StatefulWidget {
  OrderAdmin({Key key}) : super(key: key);

  @override
  _OrderAdminState createState() => _OrderAdminState();
}

class _OrderAdminState extends State<OrderAdmin> {
  Stream orderStream;
  @override
  void initState() {
    doonthisLaunc();
    super.initState();
  }

  Widget orderSoon() {
    return StreamBuilder(
      stream: orderStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                              height: 350,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(16.0)),
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        ds["chickenQuantity"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "Chicken Biryani",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        ds["muttonQuantity"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "Mutton Biryani",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        ds["vegQuantity"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "Veg Biryani",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    ds["foodPrice"],
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    ds["ts"],
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    ds["userName"],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    ds["userAddress"],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    ds["userPhone"],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  RaisedButton(
                                      color: Colors.blue,
                                      onPressed: () async {
                                        await FirebaseFirestore.instance
                                            .runTransaction((Transaction
                                                myTransaction) async {
                                          await myTransaction.delete(snapshot
                                              .data.docs[index].reference);
                                        });
                                      },
                                      child: Text(
                                        "Delivered",
                                      )),
                                ],
                              )),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  getAdminOrders() async {
    orderStream = await DatabaseMethods().getOrder();
    setState(() {});
  }

  doonthisLaunc() {
    getAdminOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: orderSoon(),
    );
  }
}
