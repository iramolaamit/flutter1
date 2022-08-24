import 'package:flutter/material.dart';

import 'apiManger.dart';

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  bool isTrue = false;
  var apiData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Section'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                isTrue = false;
                setState(() {});
                await ApiManger().getApiData().then((value) {
                  print(value['data']['rwaList'][1]['rwaName']);
                  apiData =value['data']['rwalist'];
                  isTrue = true;
                  setState(() {});
                });
              },
              icon: Icon(
                Icons.data_exploration_outlined,
                size: 25,
              ))
        ],
      ),
      body: isTrue == false
          ? Center(
              child: Text("Api is not called", textScaleFactor: 1.5),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return
                  ListTile(
                    title: Text(apiData[index]),
                    subtitle: Text(apiData[index]),
                    leading: Text(apiData[index]),


                  // ListTile(
                  // title: Text(apiData[index]['rwaName']),
                  // subtitle: Text(apiData[index]['pinCode'].toString()),
                  // leading: Text(apiData[index]['rwaId'].toString()),

                );
              },
            ),
    );
  }
}
