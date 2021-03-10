import 'package:FoodOrderingApp/admin/admin_login.dart';
import 'package:FoodOrderingApp/admin/home_admin.dart';
import 'package:FoodOrderingApp/home.dart';
import 'package:FoodOrderingApp/pages/address_page.dart';

import 'package:FoodOrderingApp/services/auth.dart';
import 'package:FoodOrderingApp/services/bottom_navigation.dart';
import 'package:FoodOrderingApp/services/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return BottomNavigation();
          } else {
            return SignIn();
          }
        },
      ),
    );
  }
}
