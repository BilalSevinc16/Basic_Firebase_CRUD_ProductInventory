import 'package:basic_firebase_crud_product_inventory/button.dart';
import 'package:basic_firebase_crud_product_inventory/firebase.dart';
import 'package:basic_firebase_crud_product_inventory/stream.dart';
import 'package:basic_firebase_crud_product_inventory/textformfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.cyan,
        brightness: Brightness.dark,
      ),
    ),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CRUD crud = CRUD();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: const Text(
          "Product Inventory",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProductField(
              text: 'Product Name',
              onChanged: (String productName) {
                crud.getProductName(productName);
              },
            ),
            ProductField(
              text: 'Product Id',
              onChanged: (String productId) {
                crud.getProductId(productId);
              },
            ),
            ProductField(
              text: 'Product Category',
              onChanged: (String productCategory) {
                crud.getProductCategory(productCategory);
              },
            ),
            ProductField(
              text: 'Product Price',
              onChanged: (String productPrice) {
                crud.getProductPrice(productPrice);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    text: "Add",
                    onCustomButtonPressed: () {
                      crud.createData();
                    },
                    color: Colors.cyan,
                  ),
                  Button(
                    text: "Read",
                    onCustomButtonPressed: () {
                      crud.readData();
                    },
                    color: Colors.red,
                  ),
                  Button(
                    text: "Update",
                    onCustomButtonPressed: () {
                      crud.updateData();
                    },
                    color: Colors.green,
                  ),
                  Button(
                    text: "Delete",
                    onCustomButtonPressed: () {
                      crud.deleteData();
                    },
                    color: Colors.brown,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: const [
                  Expanded(
                    child: Text("Product Name"),
                  ),
                  Expanded(
                    child: Text("Product Id"),
                  ),
                  Expanded(
                    child: Text("Product Category"),
                  ),
                  Expanded(
                    child: Text("Product Price"),
                  ),
                ],
              ),
            ),
            const Stream(),
          ],
        ),
      ),
    );
  }
}
