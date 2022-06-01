import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterProby {
  int status;

  RegisterProby({  this.status=0});
}

class badanie {
  final String dataBadania;
  final String typBadania;
  final String pacjent;

  badanie({required this.dataBadania, required this.typBadania, required this.pacjent});

  Map<String, dynamic> toJson() {
    return {
      'dataBadania': dataBadania,
      'typBadania': typBadania,
      'pacjent': pacjent,
    };
  }
}

class RegisterProbyRequest {

  String dataBadania;
  String typBadania;
  String pacjent;
  String ALT;
  String AST;
  String ALP;
  String BIL;
  String GGTP;
  RegisterProby ret = RegisterProby();

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

  RegisterProbyRequest({ required this.dataBadania, required this.typBadania, required this.pacjent, required this.ALT, required this.AST, required this.ALP, required this.BIL, required this.GGTP });

  Future<void> postMorfo() async {

    try{
      // make the request
      //JsonEncoder('');
      String token = await getStringValue('MB_token');
      int id = await getIntValue('MB_id');
      badanie badaniePP = badanie(dataBadania: dataBadania, typBadania: typBadania, pacjent: pacjent);
      String badanieString = jsonEncode(badaniePP);
      Map badanieMap = jsonDecode(badanieString);
      var bodyData = {
        'badanie': badanieMap,
        'ALT': ALT,
        'AST': AST,
        'ALP': ALP,
        'BIL': BIL,
        'GGTP': GGTP,
      };
      var bodyData2 = (jsonEncode(bodyData));
      var url = Uri.parse('http://18.195.50.1958000/proby/register/');
      var response = await http.post(url, body: bodyData2, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      Map data = jsonDecode(response.body);
      ret.status = response.statusCode;
    }
    catch (e) {
      print(e);
    }

  }

}