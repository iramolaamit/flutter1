import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'fruit.dart';
import 'fruitItem.dart';
import 'fruitList.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final Future<List<Fruit>> products;

  MyHomePage({Key? key, required this.title, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4CAF50),
        title: Text("GeeksForGeeks"),
      ),
      // body: Center(
      //   child: FutureBuilder<List<Fruit>>(
      //     future: products,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasError) print(snapshot.error);
      //       if (snapshot.hasData) {
      //         return FruitList(items: snapshot.data);
      //       } else {
      //         return Center(child: CircularProgressIndicator());
      //       }
      //     },
      //   ),
    );
  }
}
