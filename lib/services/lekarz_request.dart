import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LekarzRequest {
  List ret = [];
  int status = 0;

  void saveString(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  void saveInt(key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  Future<String> getStringValue(key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = await prefs.getString(key) ?? '';
    // Don't use 0, since it isnt an int what you want to return
    return value;
  }

  Future<int> getIntValue(key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = await prefs.getInt(key) ?? 0;
    // Don't use 0, since it isnt an int what you want to return
    return value;
  }

  Future<void> getLekarz() async {

    try{
      // make the request
      String token = await getStringValue('MB_token');
      int id = await getIntValue('MB_id');
      var url = Uri.parse('http://18.195.50.195:8000/lekarz/$id/');
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      status = response.statusCode;
      if(status == 200) {
        ret = jsonDecode(response.body);
        print(ret);
        //ret.token = data['token'];
        //ret.role = data['type'];
        //ret.id = data["id"];
      }
      else {
        ret = [];
        //ret.token = 'fail';
        //ret.role = '';
      }
    }
    catch (e) {
      print(e);
    }

  }

}