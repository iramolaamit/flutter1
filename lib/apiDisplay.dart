import 'package:flutter/material.dart';

import 'apiManger.dart';

class ApiCall extends StatefulWidget {
  const ApiCall({Key? key}) : super(key: key);

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  bool isTrue = false;
  List<dynamic>? list;
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
                list = await ApiManger().getApiData().then((value) {
                  print(value);
                  apiData = value;
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
          :
      // DataTable(
      //         columns: [
      //             DataColumn(label: Text('ID')),
      //             DataColumn(label: Text('Name')),
      //             DataColumn(label: Text('Date and time')),
      //           ],
      //         rows: list!
      //             .map(
      //               (map) => DataRow(cells: [
      //                 DataCell(Text(map['id'].toString())),
      //                 DataCell(Text(map['EmployeeId'].toString())),
      //                 DataCell(Text(map['Phone Number'].toString())),
      //               ] ),
      //             )
      //             .toList()),
      ListView.builder(
              itemCount: apiData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(apiData[index]['EmployeeId'].toString()),
                  subtitle: Text(apiData[index]['Phone Number'].toString()),
                  leading: Text(apiData[index]['id'].toString()),


                );
              },
            ),
    );
  }
}
