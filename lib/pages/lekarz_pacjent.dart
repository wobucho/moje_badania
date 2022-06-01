import 'package:flutter/material.dart';
import 'package:moje_badania/pages/bottom_bars.dart';

class LekarzPacjent extends StatefulWidget {
  @override
  _LekarzPacjentState createState() => _LekarzPacjentState();
}

class _LekarzPacjentState extends State<LekarzPacjent> {
  List badania = [];
  String imie = '';
  String nazwisko = '';

  @override
  Widget build(BuildContext context) {
    try {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      badania = args['badania'] as List;
      imie = args['imie'] as String;
      nazwisko = args['nazwisko'] as String;
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
            '${imie} ${nazwisko}  - lista badań',
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 10.0,
              fontFamily: 'DTLProkyon',
            ),
          ),
        ]),
      ),
      body: ListView.builder(
        itemCount: badania.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.teal[100],
            child: ListTile(
              onTap: () {
                String typBadania = badania[index]['typBadania'];
                if(typBadania == 'MK') {
                  Navigator.pushNamed(context, '/loadingmorfo', arguments:{
                    'morfo_id' : badania[index]['id']?? 0,
                  });
                } else if(typBadania == 'PW') {
                  Navigator.pushNamed(context, '/loadingproby', arguments:{
                    'proby_id' : badania[index]['id']?? 0,
                  });
                }
              },
              leading: const Icon(
                Icons.insert_chart,
                color: Colors.black,
              ),
              title: Text(
                '${(badania[index]['typBadania'] ?? 0) == 'MK' ? 'Morfologia Krwi' : 'Próby wątrobowe'}',
                style: const TextStyle(
                  fontFamily: 'DTLProkyon',
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Data Badania: ${badania[index]['dataBadania'] ?? 'nieznana'}',
                style: const TextStyle(
                  fontFamily: 'DTLProkyon',
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[100],
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
          Navigator.pushNamed(context, '/loadinghomepacjent');
        },
        tooltip: 'Dodaj',
        child: const Icon(
          Icons.refresh,
          color: Colors.blueGrey,
        ),
      ),
      bottomNavigationBar: const BottomBarLekarz(
        fabLocation: FloatingActionButtonLocation.endDocked,
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

