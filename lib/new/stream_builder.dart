import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MyStreamBuilder extends StatelessWidget {
  final ref; Widget child;
  MyStreamBuilder({Key? key, required this.child, required this.ref}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: ref,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.hasError){
          return Center(child: PoppinsText(text: "Something went wrong"));
        }
        else if (snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        final data = snapshot.requireData;
        // var doc = snapshot.data?.docs[index].data();
        return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index){
                return child;
            }
        );
      },
    );
  }
}
