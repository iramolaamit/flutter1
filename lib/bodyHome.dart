import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool valueCheck = false;
  bool switchValue = false;
  TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int groupValue = 0;
  var itemListTile = [
    'First Item',
    'Second Item',
    'Third Item',
    'Fourth Item',
    'Fifth Item',
  ];
  var itemPopupMenu = [
    'First Item',
    'Second Item',
    'Third Item',
    'Fourth Item',
    'Fifth Item',
  ];
  var itemDropDownButton = [
    'First Item',
    'Second Item',
    'Third Item',
    'Fourth Item',
    'Fifth Item',
  ];
  var themeData = ThemeData(primarySwatch: Colors.red);
  String valueDrop = 'Select Item';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: Container(
        child: Stack(
            alignment: Alignment.bottomLeft,
            textDirection: TextDirection.ltr,
            fit: StackFit.passthrough,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white10,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Inkwell Button',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          onTap: () {
                            print('Inkwell tapped');
                          },
                          radius: 25,
                          splashColor: Colors.deepOrange,
                          customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(20))),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Text('Material Button')),
                          elevation: 4,
                          color: Colors.blue,
                          height: 50,
                          minWidth: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(20)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        OutlinedButton(
                          child: Text(
                            'OutlinedButton',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              maximumSize: Size(200, 30),
                              minimumSize: Size(170, 30),
                              backgroundColor: Colors.green),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        RaisedButton(
                          elevation: 10,
                          child: Text('Raised Button'),
                          onPressed: () {},
                          color: Colors.red,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FlatButton(
                          child: Text('Flat Button'),
                          onPressed: () {},
                          color: Colors.red,
                          // height: 20,
                          // minWidth: 200,
                          textColor: Colors.blue,
                          autofocus: true,
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Container(
                          color: Colors.white12,
                          width: 100,
                          // height: 200,
                          child: DropdownButtonFormField(
                            items: itemDropDownButton.map((String e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                                onTap: () {
                                  itemDropDownButton;
                                },
                              );
                            }).toList(),
                            onTap: () {},
                            dropdownColor: Colors.deepPurple,
                            validator: (value) {},
                            icon: Icon(Icons.arrow_circle_down),
                            isDense: true,
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.black26,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Hint Form",
                                  label: Text('Text'),
                                  prefixIcon: Icon(Icons.celebration_outlined),
                                  suffixIcon: Icon(Icons.ac_unit_outlined),
                                ),
                                onTap: () {
                                  print(_controller.text);
                                },
                                enabled: true,
                                onFieldSubmitted: (val) {
                                  if (_formKey.currentState!.validate()) {
                                    print(val);
                                  }
                                },
                                onChanged: (val) {
                                  print(val);
                                },
                                controller: _controller,
                                validator: (val) =>
                                    val!.length == 2 ? null : 'length exceed',
                                obscureText: false,
                                textDirection: TextDirection.ltr,
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ),
                          Card(
                            shadowColor: Colors.green,
                            color: Colors.white70,
                            surfaceTintColor: Colors.deepOrangeAccent,
                            elevation: 12,
                            borderOnForeground: true,
                            margin: EdgeInsets.all(12),
                            semanticContainer: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Row(
                              children: [
                                Radio(
                                  visualDensity: VisualDensity(
                                      // horizontal: 12,
                                      // vertical: 12
                                      ),
                                  value: 0,
                                  toggleable: true,
                                  autofocus: true,
                                  activeColor: Colors.pink,
                                  splashRadius: 22,
                                  groupValue: groupValue,
                                  onChanged: (val) {
                                    setState(() {
                                      groupValue = int.parse(val.toString());
                                    });
                                  },
                                ),
                                Tooltip(
                                  preferBelow: true,
                                  verticalOffset: 12,
                                  message: "Second Radio Button",
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    backgroundBlendMode: BlendMode.colorBurn,
                                    borderRadius: BorderRadius.circular(40),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  enableFeedback: true,
                                  textStyle: TextStyle(
                                      color: Colors.lightGreenAccent,
                                      backgroundColor: Colors.white70,
                                      fontWeight: FontWeight.w800),
                                ),
                                Radio(
                                  value: 1,
                                  activeColor: Colors.redAccent,
                                  toggleable: true,
                                  splashRadius: 22,
                                  onChanged: (val) {
                                    setState(() {
                                      groupValue = int.parse(val.toString());
                                    });
                                  },
                                  groupValue: groupValue,
                                ),
                                Switch(
                                  value: switchValue,
                                  activeColor: Colors.lightGreenAccent,
                                  activeTrackColor: Colors.green,
                                  splashRadius: 22,
                                  inactiveThumbColor: Colors.black,
                                  inactiveTrackColor: Colors.deepOrange,
                                  onChanged: (val) {
                                    setState(() {
                                      print(val);
                                      switchValue = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Checkbox(
                            value: valueCheck,
                            activeColor: Colors.white,
                            checkColor: Colors.cyan,
                            focusColor: Colors.red,
                            autofocus: true,
                            tristate: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            onChanged: (val) {
                              setState(() {
                                valueCheck = val!;
                              });
                              val = false;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
