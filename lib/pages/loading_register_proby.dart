import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moje_badania/services/register_proby_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingRegisterProby extends StatefulWidget {
  @override
  _LoadingRegisterProbyState createState() => _LoadingRegisterProbyState();
}

class _LoadingRegisterProbyState extends State<LoadingRegisterProby> {
  Map data = {};

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

  void startRegister(RegisterProbyRequest registerReq) async {
    await registerReq.postMorfo();
    if (registerReq.ret.status == 201) {
      registerOK();
    } else if (registerReq.ret.status >= 500) {
      errorConnection();
    } else {
      errorRegister();
    }
  }

  Future<void> registerOK() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal,
          title: Center(
            child: Text(
              'Rejestracja udana',
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
                  'Udało się zarejestrować badanie.',
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
                Navigator.pushNamed(context, '/loadingprobydiagnosta');

              },
            ),
          ],
        );
      },
    );
  }

  Future<void> errorRegister() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal,
          title: Center(
            child: Text(
              'Błąd rejestracji',
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
                  'Podałeś nieprawidłowe/niepełne dane.',
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
                Navigator.popUntil(context, ModalRoute.withName('/registerproby'));
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
              'Błąd rejestracji',
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
        RegisterProbyRequest registerRequest =
        RegisterProbyRequest(dataBadania: data['dataBadania'], typBadania: data['typBadania'], pacjent: data['pacjent'], ALT: data['ALT'], AST: data['AST'], ALP: data['ALP'], BIL: data['BIL'], GGTP: data['GGTP']);
        startRegister(registerRequest);
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
