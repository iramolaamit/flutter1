import 'package:flutter/cupertino.dart';
import 'package:flutter_lean/dbHelper/databasesModel.dart';
import 'package:sqflite/sqflite.dart';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpa;
import 'package:flutter_lean/apiManger.dart';

class LongLists extends StatefulWidget {
  const LongLists({Key? key}) : super(key: key);

  @override
  State<LongLists> createState() => _LongListsState();
}

class _LongListsState extends State<LongLists> {
  final List<String> products = [
    "Hello",
    "Hi",
    "bye",
    'Sometimes',
    ' we',
    ' want',
    "to",
    'display',
    'the',
    'items',
    'in',
    'grid'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${products[index]}'),
          );
        },
      ),
    );
  }
}

class GridLists extends StatefulWidget {
  const GridLists({Key? key}) : super(key: key);

  @override
  State<GridLists> createState() => _GridListsState();
}

class _GridListsState extends State<GridLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GridView.builder(
          itemCount: 50,
          padding: EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return Image(
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png'),
            );
          },
        ));
  }
}

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          primary: true,
          scrollDirection: Axis.vertical,
          children: [
            ListTile(
              leading: Icon(
                Icons.home_filled,
              ),
              title: Text('Long List '),
              style: ListTileStyle.list,
            ),
            ListTile(
              leading: Icon(
                Icons.home_filled,
              ),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text(
                'Album',
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Horizontal Scroll List'),
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contact'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
            ),
          ],
        ),
      ),
    );
  }
}

class TableTable extends StatefulWidget {
  TableTable({Key? key}) : super(key: key);

  @override
  State<TableTable> createState() => _TableTableState();
}

class _TableTableState extends State<TableTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          // padding: EdgeInsets.all(12),
          children: [
            Table(
              textBaseline: TextBaseline.alphabetic,
              defaultColumnWidth: FlexColumnWidth(120),
              border: TableBorder(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                horizontalInside: BorderSide(
                  color: Colors.black,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                left: BorderSide(
                  color: Colors.black,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                right: BorderSide(
                  color: Colors.black,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                top: BorderSide(
                  color: Colors.black,
                  width: 1,
                  style: BorderStyle.solid,
                ),
                verticalInside: BorderSide(
                  color: Colors.black,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              children: [
                TableRow(children: [
                  Text(
                    "First",
                    textScaleFactor: 1.5,
                  ),
                  Text(
                    "Second",
                    textScaleFactor: 1.5,
                  ),
                  Text(
                    "Third",
                    textScaleFactor: 1.5,
                  ),
                  Text(
                    "Fourth",
                    textScaleFactor: 1.5,
                  ),
                  Text(
                    "Fifth",
                    textScaleFactor: 1.5,
                  ),
                ]),
                TableRow(children: [
                  Text(
                    "First",
                  ),
                  Text(
                    "Second",
                  ),
                  Text(
                    "Third",
                  ),
                  Text(
                    "Fourth",
                  ),
                  Text(
                    "Fifth",
                  ),
                ]),
                TableRow(children: [
                  Text(
                    "First",
                  ),
                  Text(
                    "Second",
                  ),
                  Text(
                    "Third",
                  ),
                  Text(
                    "Fourth",
                  ),
                  Text(
                    "Fifth",
                  ),
                ]),
                TableRow(children: [
                  Text(
                    "First",
                  ),
                  Text(
                    "Second",
                  ),
                  Text(
                    "Third",
                  ),
                  Text(
                    "Fourth",
                  ),
                  Text(
                    "Fifth",
                  ),
                ]),
                TableRow(children: [
                  Text(
                    "First",
                  ),
                  Text(
                    "Second",
                  ),
                  Text(
                    "Third",
                  ),
                  Text(
                    "Fourth",
                  ),
                  Text(
                    "Fifth",
                  ),
                ]),
                TableRow(children: [
                  Text(
                    "First",
                  ),
                  Text(
                    "Second",
                  ),
                  Text(
                    "Third",
                  ),
                  Text(
                    "Fourth",
                  ),
                  Text(
                    "Fifth",
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: 12,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class databaseCall2 extends StatefulWidget {
  const databaseCall2({Key? key}) : super(key: key);

  @override
  State<databaseCall2> createState() => _databaseCall2State();
}

class _databaseCall2State extends State<databaseCall2> {
  List<dynamic>? itemList;
  Database? database;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectDatabase();
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
        itemList =await db.query('Employee');
        print(itemList);
      },
    );
  }

  insertDatabase(Employee employee) async {
    database == null
        ? connectDatabase()
        : await database!
            .rawInsert('insert into Employee( ) values(?,?,?,?)', [employee]);
    database!.query('Employee');
    setState(() {});
  }

  deleteDatabase(int id) async {
    database == null
        ? connectDatabase()
        : await database!.delete('Employee', where: 'id=?', whereArgs: [id]);
    await database!.delete('Employee', where: 'id =?', whereArgs: [id]);

    setState(() {});
  }

  updateDatabase(int id) async {
    database == null
        ? connectDatabase()
        : await database!
            .rawUpdate('Update Employee set value = ? where id=?', [id, id]);
    await database!.update('Employee', {'name': 'Amit', 'value': 20, 'num': 20},
        where: 'id=?', whereArgs: [id]);
    setState(() {});
    // database!.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          Row(
            children: [
              InkWell(
                child: Text("Button", textScaleFactor: 2,),
                onTap: (){
                  Employee a = Employee(Id: 1, Name: 'Name', Age: 10, Basic: 5);
                  print(a.Id);
                  print(a.Name);
                  print(a.Age);
                  print(a.Basic);
                  insertDatabase(a);
                },
              )
            ],
          ),
          SizedBox(
              height: 12,
              child: itemList != null
                  ? CircularProgressIndicator()
                  : DataTable(
                      sortColumnIndex: 0,
                      sortAscending: true,
                      showCheckboxColumn: true,
                      columns: [
                        DataColumn(label: Text("Id"), numeric: true),
                        DataColumn(label: Text("Name")),
                        DataColumn(label: Text("Age"), numeric: true),
                        DataColumn(label: Text("Basic"), numeric: true),
                        DataColumn(label: Text("Action")),
                      ],
                      rows: itemList!
                          .map(
                            (map) => DataRow(cells: [
                              DataCell(Text(map['Id'])),
                              DataCell(Text(map['Name']), showEditIcon: true),
                              DataCell(Text(map['Age']), showEditIcon: true),
                              DataCell(Text(map['Basic']), showEditIcon: true),
                              DataCell(
                                Row(children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(CupertinoIcons.plus))
                                ]),
                              ),
                            ]),
                          )
                          .toList(),
                    )),
        ],
      ),
    );
  }
}

