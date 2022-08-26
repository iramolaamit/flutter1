import 'dart:convert';
import 'package:http/http.dart' as http;
class  ApiManger{
  var header = {'Content-Type': 'application/json'};
  var url = Uri.parse('https://retoolapi.dev/iOa39w/data');

  // var url = Uri.parse('https://regionapi.sircltech.com/getstates' );
  // var url_2=Uri.parse('http://devapis.mymobileapps.space/Enlist/GetRWAsByPinCode?PinCode=110049');
  Future<dynamic> getApiData() async {
    var apiData = await http.get(url, headers: header);

    print(apiData);
    return jsonDecode(apiData.body);
  }

  Future<dynamic> postApiData() async {
    var apiData = await http.post(url);
    print(apiData);
  }
}
