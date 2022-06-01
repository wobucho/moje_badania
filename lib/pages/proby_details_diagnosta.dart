import 'package:flutter/material.dart';
import 'package:moje_badania/pages/bottom_bars.dart';

class ProbyDetailsDiagnosta extends StatefulWidget {
  @override
  _ProbyDetailsDiagnostaState createState() => _ProbyDetailsDiagnostaState();
}

class _ProbyDetailsDiagnostaState extends State<ProbyDetailsDiagnosta> {
  Map proby = {};

  @override
  Widget build(BuildContext context) {
    try {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      proby = args;
    } catch (e) {
      print(e);
      Navigator.popUntil(
          context, ModalRoute.withName('/'));
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
            'Próby wątrobowe #${proby['badanie']['id'] ?? '-'}',
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
          padding: const EdgeInsets.fromLTRB(40.0, 30.0, 30.0, 30.0),
          child: Container(
            color: Colors.teal[100],
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Data badania: ${proby['badanie']['dataBadania'] ?? 'nieznana'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'PESEL pacjenta: ${proby['badanie']['pacjent'] ?? 'nieznany'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'ALT: ${proby['ALT'] ?? '-'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'AST: ${proby['AST'] ?? '-'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'ALP: ${proby['ALP'] ?? '-'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'BIL: ${proby['BIL'] ?? '-'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'GGTP: ${proby['GGTP'] ?? '-'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ),


      ),

      bottomNavigationBar: const BottomBarDiagnosta(
        fabLocation: FloatingActionButtonLocation.endDocked,
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}