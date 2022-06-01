import 'package:flutter/material.dart';
import 'package:moje_badania/pages/bottom_bars.dart';

class ProfileDiagnosta extends StatefulWidget {
  @override
  _ProfileDiagnostaState createState() => _ProfileDiagnostaState();
}

class _ProfileDiagnostaState extends State<ProfileDiagnosta> {
  Map profile = {};

  @override
  Widget build(BuildContext context) {
    try {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      profile = args;
    } catch (e) {
      print(e);
    }

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Column(children: [
          Text(
            'Moje Badania',
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 20.0,
              fontFamily: 'DTLProkyon',
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 10.0,
          ),
          Text(
            'Informacje profilowe',
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 10.0,
              fontFamily: 'DTLProkyon',
            ),
          ),
        ]),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(60.0, 30.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.teal[100],
                  radius: 40.0,
                  child: const Icon(
                    Icons.medical_services,
                    color: Colors.blueGrey,
                    size: 60.0,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'IMIĘ I NAZWISKO',
                style: TextStyle(
                  fontFamily: 'DTLProkyon',
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '${profile['imie'] ?? '-'} ${profile['nazwisko'] ?? '-'}',
                style: const TextStyle(
                  fontFamily: 'DTLProkyon',
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'NR TELEFONU',
                style: TextStyle(
                  fontFamily: 'DTLProkyon',
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '${profile['telefon'] ?? '-'}',
                style: const TextStyle(
                  fontFamily: 'DTLProkyon',
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),


      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[100],
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
          Navigator.popUntil(
              context, ModalRoute.withName('/'));
          Navigator.pushNamed(context, '/loadingprofile');
        },
        tooltip: 'Odśwież',
        child: const Icon(
          Icons.refresh,
          color: Colors.blueGrey,
        ),
      ),
      bottomNavigationBar: const BottomBarDiagnosta(
        fabLocation: FloatingActionButtonLocation.endDocked,
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
