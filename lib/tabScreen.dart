import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lean/firebaseCall.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'apiDisplay.dart';
import 'bodyHome.dart';
import 'dbHelper/databaseCall.dart';
import 'navigation.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<dynamic>? itemList;
  bool isRoute = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        primary: true,
        scrollDirection: Axis.vertical,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LongLists(),
              ));
            },
            child: ListTile(
              leading: Icon(Icons.home_filled, size: 35),
              title: Text(
                'Long List ',
                textScaleFactor: 1.5,
              ),
              style: ListTileStyle.list,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GridLists(),
              ));
            },
            child: ListTile(
              leading: Icon(
                Icons.map,
                size: 35,
              ),
              title: Text(
                'Grid View List',
                textScaleFactor: 1.5,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HorizontalListView(),
              ));
            },
            child: ListTile(
              leading: Icon(
                Icons.photo_album,
                size: 35,
              ),
              title: Text(
                'Horizontal Scroll List',
                textScaleFactor: 1.5,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TableTable(),
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.table_bar,
                size: 35,
              ),
              title: Text(
                'Table',
                textScaleFactor: 1.5,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ApiCall(),
              ));
            },
            child: ListTile(
              leading: Icon(
                Icons.app_blocking_rounded,
                size: 35,
              ),
              title: Text(
                'Api',
                textScaleFactor: 1.5,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              setState(() {
                isRoute = true;
              });
              await isRoute == false
                  ? CircularProgressIndicator()
                  : Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => databaseCall2(),
                      // builder: (context) => databaseCall(),
                    ));
            },
            child: ListTile(
              leading: Icon(
                Icons.settings,
                size: 35,
              ),
              title: Text(
                'Database',
                textScaleFactor: 1.5,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FirebaseCall(),
              ));
            },
            child: ListTile(
              leading: Icon(
                Icons.app_blocking_rounded,
                size: 35,
              ),
              title: Text(
                'Firebase',
                textScaleFactor: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreenToast extends StatefulWidget {
  const SecondScreenToast({Key? key}) : super(key: key);

  @override
  State<SecondScreenToast> createState() => _SecondScreenToastState();
}

class _SecondScreenToastState extends State<SecondScreenToast> {
  void showToast() {
    Fluttertoast.showToast(
      msg: "Click to show",
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.teal,
      fontSize: 25,
      textColor: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              showToast();
            },
            child: Icon(
              Icons.delete_forever,
              size: 35,
            )),
      ),
    );
  }
}

class ThirdScreen extends StatefulWidget {
  ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool isLinear = false;
  bool isCircular = false;

  @override
  void initState() {
    // super.initState();
    isLinear = false;
    isCircular = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 5,
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: Container(
                child: isLinear
                    ? LinearProgressIndicator(
                        color: CupertinoColors.systemBlue,
                        backgroundColor: Colors.white10,
                        minHeight: 15,
                      )
                    : Text(
                        ' Linear Progress is Completed',
                        textScaleFactor: 1.5,
                      ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isLinear = !isLinear;
                    });
                  },
                  icon: Icon(
                    Icons.change_circle_rounded,
                    size: 55,
                  )),
            ),
            SizedBox(
              height: 35,
            ),
            Center(
              child: Container(
                child: isCircular
                    ? CircularProgressIndicator(
                        color: CupertinoColors.systemBlue,
                        backgroundColor: Colors.white10,
                        strokeWidth: 12,
                      )
                    : Text(
                        'Circular Progress is Completed',
                        textScaleFactor: 1.5,
                      ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Center(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isCircular = !isCircular;
                    });
                  },
                  icon: Icon(
                    Icons.change_circle_rounded,
                    size: 55,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: MaterialButton(
          height: 75,
          elevation: 125,
          child: Icon(
            CupertinoIcons.bubble_middle_top_fill,
            color: Colors.teal,
            size: 150,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeBody(),
            ));
          },
        ),
      ),
    );
  }
}
