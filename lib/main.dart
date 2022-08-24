import 'package:flutter/material.dart';
import 'package:flutter_lean/MyDrawer.dart';
import 'package:flutter_lean/tabScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var themeData = ThemeData(primarySwatch: Colors.red);
  String valueDrop = 'Select Item';
  bool switchValue = false;
  var itemPopupMenu = [
    'First Item',
    'Second Item',
    'Third Item',
    'Fourth Item',
    'Fifth Item',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        drawerEnableOpenDragGesture: true,
        endDrawerEnableOpenDragGesture: true,
        // drawer: MyDrawer(),
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(
            "My App bar",
            style: TextStyle(
              letterSpacing: 1,
              fontSize: 25,
              backgroundColor: Colors.white12,
              wordSpacing: 2,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            color: Colors.cyan,
            opacity: 12,
            size: 12,
          ),
          actions: [
            PopupMenuButton(
              onSelected: (val) {
                valueDrop = val.toString();
              },
              itemBuilder: (BuildContext context) {
                return itemPopupMenu.map((e) {
                  return PopupMenuItem(
                    child: Text(e),
                    value: e,
                  );
                }).toList();
              },
              color: Colors.greenAccent,
              enabled: true,
              iconSize: 35,
              tooltip: "PopUp Button",
              constraints: BoxConstraints(
                maxHeight: double.infinity,
                minWidth: 35,
                maxWidth: double.infinity,
                minHeight: 35,
              ),
              initialValue: "hello",
              position: PopupMenuPosition.under,
            ),
          ],
          elevation: 12,
          bottom: TabBar(padding: EdgeInsets.all(12), tabs: [
            Tab(
              icon: Icon(
                Icons.camera_alt_outlined,
              ),
              text: 'Camera',
              iconMargin: EdgeInsets.all(12),
              // height: 3,
            ),
            Tab(
              icon: Icon(Icons.chat_bubble),
              text: 'Chat',
              iconMargin: EdgeInsets.all(12),
              // height: 3,
            ),
            Tab(
              icon: Icon(Icons.perm_contact_cal_outlined),
              text: 'Contacts',
              iconMargin: EdgeInsets.all(12),
              // height: 3,
            ),
            Tab(
              icon: Icon(Icons.call),
              text: 'Call Log',
              iconMargin: EdgeInsets.all(12),
              // height: 3,
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (themeData == ThemeData.dark()) {
                themeData = ThemeData.light();
              } else {
                themeData = ThemeData.dark();
              }
            });
          },
          elevation: 12,
          backgroundColor: Colors.greenAccent,
          child: Icon(
            Icons.add,
            size: 35,
            color: Colors.amberAccent,
            semanticLabel: "Hello",
            textDirection: TextDirection.ltr,
          ),
          tooltip: "ADD",
        ),
        // body: TabBarView(children: [
        //   FirstScreen(),
        //   SecondScreenToast(),
        //   ThirdScreen(),
        //   FourthScreen(),
        // ]),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
