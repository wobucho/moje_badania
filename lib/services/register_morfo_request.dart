import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterMorfo {
  int status;

  RegisterMorfo({  this.status=0});
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

class RegisterMorfoRequest {

  String dataBadania;
  String typBadania;
  String pacjent;
  String HGB;
  String HCT;
  String WBC;
  String RBC;
  String PLT;
  String CRP;
  RegisterMorfo ret = RegisterMorfo();

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

  RegisterMorfoRequest({ required this.dataBadania, required this.typBadania, required this.pacjent, required this.HGB, required this.HCT, required this.WBC, required this.RBC, required this.PLT, required this.CRP });

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
        'HGB': HGB,
        'HCT': HCT,
        'WBC': WBC,
        'RBC': RBC,
        'PLT': PLT,
        'CRP': CRP,
      };
      var bodyData2 = (jsonEncode(bodyData));
      var url = Uri.parse('http://18.195.50.195:8000/morfo/register/');
      var response = await http.post(url, body: bodyData2, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      Map data = jsonDecode(response.body);
      print(data);
      ret.status = response.statusCode;
    }
    catch (e) {
      print(e);
    }

  }

}