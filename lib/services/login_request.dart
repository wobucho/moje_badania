import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginResponse {
  String token;
  int status;
  String role;
  int id;

  LoginResponse({  this.token='', this.status=0, this.role='', this.id=0});
}

class LoginRequest {

  String email;
  String password;
  LoginResponse ret = LoginResponse();

  LoginRequest({ required this.email, required this.password });

  Future<void> postLogin() async {

    try{
      // make the request
      var url = Uri.parse('http://18.195.50.195:8000/auth/login/');
      var response = await http.post(url, body: {'email': email, 'password': password});
      Map data = jsonDecode(response.body);
      ret.status = response.statusCode;
      if(ret.status == 200) {
        ret.token = data['token'];
        ret.role = data['type'];
        ret.id = data["id"];
      }
      else {
        ret.token = 'fail';
        ret.role = '';
      }
    }
    catch (e) {
      print(e);
    }

  }

}