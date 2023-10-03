import 'package:cloud_firestore/cloud_firestore.dart';

class CRUD {
  late String name, id, category;
  late double price;

  getProductName(productName) {
    name = productName;
  }

  getProductId(productId) {
    id = productId;
  }

  getProductCategory(productCategory) {
    category = productCategory;
  }

  getProductPrice(productPrice) {
    price = double.parse(productPrice);
  }

  createData() {
    print("added");
    //Database Path
    DocumentReference dataPath =
        FirebaseFirestore.instance.collection("Products").doc(name);
    // Sending multiple data Map
    Map<String, dynamic> products = {
      "productName": name,
      "productId": id,
      "productCategory": category,
      "productPrice": price,
    };
    dataPath.set(products).whenComplete(() {
      print("$name added");
    });
  }

  readData() {
    //Reading data from firebase
    DocumentReference dataPath =
        FirebaseFirestore.instance.collection("Products").doc(name);
    dataPath.get().then((receivedData) {
      print(
        receivedData.get("productName"),
      );
      print(
        receivedData.get("productId"),
      );
      print(
        receivedData.get("productCategory"),
      );
      print(
        receivedData.get("productPrice"),
      );
    });
  }

  updateData() {
    //Data Path
    DocumentReference dataPath =
        FirebaseFirestore.instance.collection("Products").doc(name);
    // Send multiple data with map
    Map<String, dynamic> productCurrentData = {
      "productName": name,
      "productId": id,
      "productCategory": category,
      "productPrice": price,
    };
    dataPath.update(productCurrentData).whenComplete(() {
      print("$name updated");
    });
  }

  deleteData() {
    //Data Path
    DocumentReference dataPath =
        FirebaseFirestore.instance.collection("Products").doc(name);
    //Deletion Process
    dataPath.delete().whenComplete(() {
      print("$name has been deleted");
    });
  }
}
