import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseCall extends StatefulWidget {
  const FirebaseCall({Key? key}) : super(key: key);

  @override
  State<FirebaseCall> createState() => _FirebaseCallState();
}

final fc = FirebaseFirestore.instance.collection('Employee');

class _FirebaseCallState extends State<FirebaseCall> {
  getData() async {
    await fc.get().then((value) {
      if (value.docs.isNotEmpty) {
        print(value.docs[0]['id']['name']['salary']['D.O.B']);
      }
    });
  }

  setData() async {
    await fc.add({});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Employee').snapshots(),
            builder: (_, AsyncSnapshot<QuerySnapshot> snap) {
              print(snap.data!.docs[0]['id']['name']);
              return DataTable(columns: [
                DataColumn(
                  label: Text('Id'),
                ),
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: Text('Date of Birth'),
                ),
                DataColumn(
                  label: Text('Salary'),
                ),
              ], rows: []);
            },
          ),
        ));
  }
}
