import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterResponse {
  int status;

  RegisterResponse({  this.status=0});
}

class profilP {
  final String imie;
  final String nazwisko;
  final String pesel;
  final String telefon;

  profilP({required this.imie, required this.nazwisko, required this.pesel, required this.telefon});

  Map<String, dynamic> toJson() {
    return {
      'imie': imie,
      'nazwisko': nazwisko,
      'pesel': pesel,
      'telefon': telefon,
    };
  }
}

class RegisterRequest {

  String email;
  String password;
  String imie;
  String nazwisko;
  String pesel;
  String telefon;
  RegisterResponse ret = RegisterResponse();

  RegisterRequest({ required this.email, required this.password, required this.imie, required this.nazwisko, required this.pesel, required this.telefon });

  Future<void> postRegister() async {

    try{
      // make the request
      //JsonEncoder('');
      profilP profilPP = profilP(imie: imie, nazwisko: nazwisko, pesel: pesel, telefon: telefon);
      String profilString = jsonEncode(profilPP);
      Map profilMap = jsonDecode(profilString);
      var bodyData = {
        'email': email,
        'password': password,
        'profilP': profilMap,
      };
      var bodyData2 = (jsonEncode(bodyData));
      var url = Uri.parse('http://18.195.50.1958000/auth/register/pacjent/');
      var response = await http.post(url, body: bodyData2, headers: {"Content-Type": "application/json"});
      Map data = jsonDecode(response.body);
      ret.status = response.statusCode;
    }
    catch (e) {
      print(e);
    }

  }

}