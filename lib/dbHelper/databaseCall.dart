import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../mydb/databasesModel.dart';
import 'database_helper.dart';

class databaseCall extends StatefulWidget {
  const databaseCall({Key? key}) : super(key: key);

  @override
  State<databaseCall> createState() => _databaseCallState();
}

class _databaseCallState extends State<databaseCall> {
  List<dynamic>? itemList;
  Database? database;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // connectDatabase();
  }

  connectDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/demo.db';
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE Employee(E_ID INTEGER PRIMARY KEY,E_Name Text,E_AGE INTEGER,E_Basic Integer)');
        await db.execute(
            "INSERT INTO Employee(E_ID,E_Name,E_AGE,E_Basic) VALUES (?,?,?,?)",
            [1, 'Amit', 21, 10000]);

        await db.execute(
            "INSERT INTO Employee(E_ID,E_Name,E_AGE,E_Basic) VALUES (?,?,?,?)",
            [2, 'Lovish', 19, 3000]);
        await db.execute(
            "INSERT INTO Employee(E_ID,E_Name,E_AGE,E_Basic) VALUES (?,?,?,?)",
            [3, 'Deep', 18, 5000]);
        await db.execute(
            "INSERT INTO Employee(E_ID,E_Name,E_AGE,E_Basic) VALUES (?,?,?,?)",
            [4, 'Karan', 17, 8000]);

        await db.execute(
            "INSERT INTO Employee(E_ID,E_Name,E_AGE,E_Basic) VALUES (?,?,?,?)",
            [5, 'Divanshu', 18, 6000]);
        itemList = await db.query('Employee');
        print(itemList);
      },
    );

    itemList = await database!.query('Employee');
    print(itemList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              color: Colors.grey,
              child: Text(
                'Insert',
                textScaleFactor: 1.2,
              ),
              onPressed: () async {
                int? i = await DatabaseHelper.instance.insertDb({
                  DatabaseHelper.columnName: 'Amit',
                  DatabaseHelper.columnAge: 18,
                  DatabaseHelper.columnBasic: 25000,
                });
                print('The inserted id is $i');
              },
            ),
            FlatButton(
              onPressed: () async {
                List<Map<String, dynamic>> queryRow =
                    await DatabaseHelper.instance.queryAll();
                print(queryRow);
              },
              child: Text(
                'Query',
                textScaleFactor: 1.2,
              ),
              color: Colors.grey,
            ),
            FlatButton(
              onPressed: () async {
                int? updatedId = await DatabaseHelper.instance.updatedb({
                  DatabaseHelper.columnName: 'Ram',
                  DatabaseHelper.columnBasic: 250000,
                  DatabaseHelper.columnAge: 32
                });
                print(updatedId);
              },
              child: Text(
                'Update',
                textScaleFactor: 1.2,
              ),
              color: Colors.grey,
            ),
            FlatButton(
              onPressed: () async {
                int? i = await DatabaseHelper.instance.delete(12);
                print('The deleted id is $i');
              },
              child: Text(
                'Delete',
                textScaleFactor: 1.2,
              ),
              color: Colors.grey,
            ),
            FlatButton(
              onPressed: () async {
                DatabaseHelper.instance.closeDb();
                print("Closed");
              },
              child: Text(
                'Close',
                textScaleFactor: 1.2,
              ),
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
