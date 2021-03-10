import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserInfoToDB(
      String userId, Map<String, dynamic> userInfoMap) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Future addMessage(Map<String, dynamic> addressInfoMap) async {
    await FirebaseFirestore.instance
        .collection("Addresses")
        .add(addressInfoMap);
  }

  Future addOrder(Map<String, dynamic> OrderInfoMap) async {
    await FirebaseFirestore.instance.collection("Orders").add(OrderInfoMap);
  }

  Future<Stream<QuerySnapshot>> getOrder() async {
    return FirebaseFirestore.instance
        .collection("Orders")
        .orderBy("ts", descending: true)
        .snapshots();
  }

  Future deleteOrder(String orderid) async {
    await FirebaseFirestore.instance.collection("Orders").doc(orderid).delete();
  }

  Future deleteAddress(String id) async {
    await FirebaseFirestore.instance.collection("Addresses").doc(id).delete();
  }

  Future<QuerySnapshot> getUserInfo(String username) async {
    return await FirebaseFirestore.instance
        .collection("Addresses")
        .where("name", isEqualTo: username)
        .get();
  }

  Future<Stream<QuerySnapshot>> getUser() async {
    return FirebaseFirestore.instance.collection("users").snapshots();
  }
}
