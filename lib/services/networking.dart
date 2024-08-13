import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.Url);

  final String Url;

  Future<dynamic> getData() async {
    var url = Uri.parse(Url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("Error: ${response.statusCode}");
      return null; // Indicate error or handle it differently
    }
  }
}
//'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$API_key'
