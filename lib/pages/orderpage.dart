import 'package:FoodOrderingApp/home.dart';
import 'package:FoodOrderingApp/pages/successful_order.dart';
import 'package:FoodOrderingApp/services/database.dart';
import 'package:FoodOrderingApp/services/shared_pref.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int chickenttl = 2000,
      chickenqty = 1,
      muttonqty = 1,
      muttonttl = 2500,
      vegqty = 1,
      vegttl = 1500;

  int subtotal = 0;

  String userName, userPhone, userAddress;
  getMyInfoFromSharedPreference() async {
    userName = await SharedPreferenceHelper().getDisplayName();
    userPhone = await SharedPreferenceHelper().getUserPhone();
    userAddress = await SharedPreferenceHelper().getUserAddress();
  }

  doThisOnLaunch() async {
    await getMyInfoFromSharedPreference();
  }

  addOrder() {
    DateTime _now = DateTime.now();

    Map<String, dynamic> OrderInfoMap = {
      "chickenQuantity": "$chickenqty",
      "muttonQuantity": "$muttonqty",
      "vegQuantity": "$vegqty",
      "ts": "${_now.hour}:${_now.minute}:${_now.second}",
      "userAddress": userAddress,
      "userPhone": userPhone,
      "userName": userName,
      "foodPrice": "\$${chickenttl + muttonttl + vegttl}",
    };

    DatabaseMethods().addOrder(OrderInfoMap).then((value) => {
          Navigator.pushReplacement(context,
              (MaterialPageRoute(builder: (context) => SuccessfulOrder())))
        });
  }

  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }

  Widget ChickenBiryani() {
    return Card(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFD3D3D3), width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 45.0,
            height: 73.0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        chickenqty = chickenqty + 1;

                        chickenttl = 2000 * chickenqty;

                        setState(() {});
                      },
                      child: Icon(Icons.keyboard_arrow_up,
                          color: Color(0xFFD3D3D3))),
                  Text(
                    "$chickenqty",
                    style: TextStyle(fontSize: 18.0, color: Colors.grey),
                  ),
                  InkWell(
                      onTap: () {
                        if (chickenqty >= 0) {
                          chickenqty = chickenqty - 1;
                          chickenttl = 2000 * chickenqty;

                          setState(() {});
                        }
                      },
                      child: Icon(Icons.keyboard_arrow_down,
                          color: Color(0xFFD3D3D3))),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Container(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/chicken.jpg",
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 2.0))
                ]),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Chicken Biryani",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "\$2000",
                style: TextStyle(fontSize: 16.0, color: Colors.orangeAccent),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Widget MuttonBiryani() {
    return Card(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFD3D3D3), width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 45.0,
            height: 73.0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        muttonqty = muttonqty + 1;

                        muttonttl = 2500 * muttonqty;
                        setState(() {});
                      },
                      child: Icon(Icons.keyboard_arrow_up,
                          color: Color(0xFFD3D3D3))),
                  Text(
                    "$muttonqty",
                    style: TextStyle(fontSize: 18.0, color: Colors.grey),
                  ),
                  InkWell(
                      onTap: () {
                        if (muttonqty >= 0) {
                          muttonqty = muttonqty - 1;
                          muttonttl = 2500 * muttonqty;
                          setState(() {});
                        }
                      },
                      child: Icon(Icons.keyboard_arrow_down,
                          color: Color(0xFFD3D3D3))),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Container(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/mutton.jpg",
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 2.0))
                ]),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Mutton Biryani",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "\$2500",
                style: TextStyle(fontSize: 16.0, color: Colors.orangeAccent),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  VegBiryani() {
    return Card(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFD3D3D3), width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: 45.0,
            height: 73.0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        vegqty = vegqty + 1;

                        vegttl = 1500 * vegqty;
                        setState(() {});
                      },
                      child: Icon(Icons.keyboard_arrow_up,
                          color: Color(0xFFD3D3D3))),
                  Text(
                    "$vegqty",
                    style: TextStyle(fontSize: 18.0, color: Colors.grey),
                  ),
                  InkWell(
                      onTap: () {
                        if (vegqty >= 0) {
                          vegqty = vegqty - 1;
                          vegttl = 1500 * vegqty;
                          setState(() {});
                        }
                      },
                      child: Icon(Icons.keyboard_arrow_down,
                          color: Color(0xFFD3D3D3))),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Container(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/vegbiryani.jpg",
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 2.0))
                ]),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Veg Biryani",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "\$1500",
                style: TextStyle(fontSize: 16.0, color: Colors.orangeAccent),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Food Cart",
          style: TextStyle(color: Colors.black, fontFamily: 'Pacifico'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              chickenqty == 0 ? Container() : ChickenBiryani(),
              muttonqty == 0 ? Container() : MuttonBiryani(),
              vegqty == 0 ? Container() : VegBiryani(),
              SizedBox(
                height: 40,
              ),
              chickenqty != 0
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "ChickenBiryani",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$$chickenttl",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    )
                  : Container(),
              SizedBox(
                height: 10.0,
              ),
              muttonqty != 0
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "MuttonBiryani",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$$muttonttl",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    )
                  : Container(),
              SizedBox(
                height: 10.0,
              ),
              vegqty != 0
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "VegBiryani",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$$vegttl",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    )
                  : Container(),
              Divider(
                height: 40.0,
                color: Color(0xFFD3D3D3),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Sub Total",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${chickenttl + muttonttl + vegttl}',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  addOrder();
                },
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Center(
                    child: Text(
                      "Place the order",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
