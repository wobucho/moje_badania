import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moje_badania/services/proby_request_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingProby extends StatefulWidget {
  @override
  _LoadingProbyState createState() => _LoadingProbyState();
}

class _LoadingProbyState extends State<LoadingProby> {

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

  void startRequest(ProbyRequestId probyReqId, int proby_id) async {
    await probyReqId.getProbyId(proby_id);
    if (probyReqId.status == 200) {
      String role = await getStringValue('MB_role');
      if(role == 'PACJENT') {
        Navigator.pushNamed(context, '/probydetailspacjent', arguments: probyReqId.ret);
      } else if(role == 'LEKARZ') {
        Navigator.pushNamed(context, '/probydetailslekarz', arguments: probyReqId.ret);
      } else if(role == 'DIAGNOSTA') {
        Navigator.pushNamed(context, '/probydetailsdiagnosta', arguments: probyReqId.ret);
      } else {
        Navigator.popUntil(context, ModalRoute.withName('/'));
      }
    } else if (probyReqId.status == 403) {
      errorLogin();
    } else {
      errorConnection();
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
              'Zostałeś wylogowany',
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
                  'Zaloguj się jeszcze raz.',
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
              'Brak sieci',
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
    Future.delayed(Duration.zero, () {
      try {
        data = ModalRoute.of(context)?.settings.arguments as Map;
      } catch (e) {
        print(e);
      }
      ProbyRequestId probyRequestId = ProbyRequestId();
      startRequest(probyRequestId, data['proby_id'] as int);
    });
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
