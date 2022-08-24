import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseCall extends StatefulWidget {
  const FirebaseCall({Key? key}) : super(key: key);

  @override
  State<FirebaseCall> createState() => _FirebaseCallState();
}

class _FirebaseCallState extends State<FirebaseCall> {
  getData() async {
    await FirebaseFirestore.instance.collection('Employee');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(),
    );
  }
}
