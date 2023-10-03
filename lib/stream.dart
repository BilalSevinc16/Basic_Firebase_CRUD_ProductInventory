import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Stream extends StatelessWidget {
  const Stream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Products").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      documentSnapshot["productName"],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      documentSnapshot["productId"],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      documentSnapshot["productCategory"],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      documentSnapshot["productPrice"].toString(),
                    ),
                  ),
                ],
              );
            },
          );
        }
        return Column();
      },
    );
  }
}
