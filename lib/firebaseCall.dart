import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseCall extends StatefulWidget {
  const FirebaseCall({Key? key}) : super(key: key);

  @override
  State<FirebaseCall> createState() => _FirebaseCallState();
}

class _FirebaseCallState extends State<FirebaseCall> {
  final fc = FirebaseFirestore.instance.collection('Employee');
  List<dynamic>? fireList;

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
  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            IconButton(onPressed: () {getData();
              print('Data is fetched');}, icon: Icon(Icons.add)),
            SizedBox(
              height: 500,
              width: double.infinity,
              child: StreamBuilder(
                stream: fc.snapshots(),
                builder: (_, AsyncSnapshot<QuerySnapshot> snap) {
                  print(snap.data!.docs[0]['name']);
                  return ListView.builder(
                    itemBuilder: (context, index) =>
                        ListTile(title: Text(snap.data!.docs[index]['name']),
                          // leading: Text(snap.data!.docs[index]['id']),
                          // subtitle: Text(snap.data!.docs[index]['D.O.B']),
                        ),
                  );
                  // ? LinearProgressIndicator()
                  // : DataTable(
                  //     columns: [
                  //         DataColumn(
                  //           label: Text('Id'),
                  //         ),
                  //         DataColumn(
                  //           label: Text('Name'),
                  //         ),
                  //         DataColumn(
                  //           label: Text('Date of Birth'),
                  //         ),
                  //         DataColumn(
                  //           label: Text('Salary'),
                  //         ),
                  //       ],
                  //     rows: fireList!
                  //         .map((map) => DataRow(cells: [
                  //               DataCell(Text(map['id'])),
                  //               DataCell(Text(map['name'])),
                  //               DataCell(Text(map['salary'])),
                  //               DataCell(Text(map['D.O.B'])),
                  //             ]))
                  //         .toList());
                },
              ),
            ),
          ],
        ),
    );
  }
}
