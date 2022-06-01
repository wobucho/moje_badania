import 'package:flutter/material.dart';
import 'package:moje_badania/pages/bottom_bars.dart';

class MorfoDetailsLekarz extends StatefulWidget {
  @override
  _MorfoDetailsLekarzState createState() => _MorfoDetailsLekarzState();
}

class _MorfoDetailsLekarzState extends State<MorfoDetailsLekarz> {
  Map morfo = {};

  @override
  Widget build(BuildContext context) {
    try {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      morfo = args;
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
            'Badanie morfologii krwi #${morfo['badanie']['id'] ?? '-'}',
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
                  'Data badania: ${morfo['badanie']['dataBadania'] ?? 'nieznana'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'PESEL pacjenta: ${morfo['badanie']['pacjent'] ?? 'nieznany'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'HGB: ${morfo['HGB'] ?? '-'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'HCT: ${morfo['HCT'] ?? '-'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'WBC: ${morfo['WBC'] ?? '-'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'RBC: ${morfo['RBC'] ?? '-'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'PLT: ${morfo['PLT'] ?? '-'}',
                  style: const TextStyle(
                    fontFamily: 'DTLProkyon',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'CRP: ${morfo['CRP'] ?? '-'}',
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

      bottomNavigationBar: const BottomBarLekarz(
        fabLocation: FloatingActionButtonLocation.endDocked,
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}