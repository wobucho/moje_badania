import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moje_badania/services/login_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingLogin extends StatefulWidget {
  @override
  _LoadingLoginState createState() => _LoadingLoginState();
}

class _LoadingLoginState extends State<LoadingLogin> {
  Map data = {};

  void redirect() async {
    String role = await getStringValue('MB_role');
    if(role == 'PACJENT') {
      Navigator.pushNamed(context, '/loadinghomepacjent');
    } else if(role == 'LEKARZ') {
      Navigator.pushNamed(context, '/loadinghomelekarz');
    } else if(role == 'DIAGNOSTA') {
      Navigator.pushNamed(context, '/loadinghomediagnosta');
     } else {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

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

  void startLogin(LoginRequest loginReq) async {
    await loginReq.postLogin();
    if (loginReq.ret.token != 'fail' && loginReq.ret.role == data['role']) {
      saveString('MB_role', loginReq.ret.role);
      saveString('MB_token', loginReq.ret.token);
      saveInt('MB_id', loginReq.ret.id);
      redirect();
    } else if (loginReq.ret.token == '') {
      errorConnection();
    } else if (loginReq.ret.token != 'fail') {
      errorRole();
    } else {
      errorLogin();
    }
  }

  Future<void> errorLogin() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal,
          title: Center(
            child: Text(
              'Błąd logowania',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 20.0,
                fontFamily: 'DTLProkyon',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Podałeś nieprawidłowy email lub hasło.',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 15.0,
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 15.0,
                  fontFamily: 'DTLProkyon',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if(data['role'] =='LEKARZ' || data['role'] == 'DIAGNOSTA') {
                  Navigator.popUntil(context, ModalRoute.withName('/login'));
                } else if(data['role'] == 'PACJENT') {
                  Navigator.popUntil(context, ModalRoute.withName('/loginpacjent'));
                } else {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                }

              },
            ),
          ],
        );
      },
    );
  }

  Future<void> errorRole() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal,
          title: Center(
            child: Text(
              'Błąd logowania',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 20.0,
                fontFamily: 'DTLProkyon',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Wybrałeś niewłaściwy typ użytkownika.",
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 15.0,
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 15.0,
                  fontFamily: 'DTLProkyon',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.popUntil(context, ModalRoute.withName('/'));

              },
            ),
          ],
        );
      },
    );
  }

  Future<void> errorConnection() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal,
          title: Center(
            child: Text(
              'Błąd logowania',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 20.0,
                fontFamily: 'DTLProkyon',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Brak połączenia z internetem.",
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 15.0,
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 15.0,
                  fontFamily: 'DTLProkyon',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.popUntil(context, ModalRoute.withName('/'));

              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    try {
      Future.delayed(Duration.zero, () {
        data = ModalRoute
            .of(context)
            ?.settings
            .arguments as Map;
        LoginRequest loginRequest =
        LoginRequest(email: data['email'], password: data['password']);
        startLogin(loginRequest);
      });
    }
    catch (e) {
      print(e);
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text(
              'Moje Badania',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 20.0,
                fontFamily: 'DTLProkyon',
                fontWeight: FontWeight.bold,
              ),
            )
        ),
        body: Center(
            child: SpinKitPumpingHeart(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
