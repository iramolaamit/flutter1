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
  static int count = 2;

  getData() async {
    await fc.get().then((value) {
      if (value.docs.isNotEmpty) {
        print(value.docs.first['id']);
        print(value.docs.first['name']);
        print(value.docs.first['department']);
        print(value.docs.first['dob']);
      }
    });
  }

  setData() async {
    count++;
    await fc.add({'id': count, 'department': 'Devloper', 'name': 'Karan'});
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
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setData();
              },
              icon: Icon(Icons.update_rounded))
        ],
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                getData();
                print('Data is fetched');
              },
              icon: Icon(Icons.add)),
          SizedBox(
            height: 500,
            width: double.infinity,
            child: StreamBuilder(
              stream: fc.snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snap) {
                // print(snap.data!.docs[0]['name']);
                // print(snap.data!.docs[0]['dob'].toString());
                // print(snap.data!.docs[0]['id'].toString());
                // print(snap.data!.docs[0]['department']);
                return ListView.builder(
                  itemCount: snap.data!.size,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(snap.data!.docs[index]['name']),
                    trailing: Text(snap.data!.docs[index]['department']),
                    leading: Text(snap.data!.docs[index]['id'].toString()),
                    // subtitle: Text(snap.data!.docs[index]['dob'].toString()),
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
                //               DataCell(Text(map['department'])),
                //               DataCell(Text(map['dob'])),
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
