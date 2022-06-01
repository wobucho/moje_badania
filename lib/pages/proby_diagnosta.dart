import 'package:flutter/material.dart';
import 'package:moje_badania/pages/bottom_bars.dart';

class ProbyDiagnosta extends StatefulWidget {
  @override
  _ProbyDiagnostaState createState() => _ProbyDiagnostaState();
}

class _ProbyDiagnostaState extends State<ProbyDiagnosta> {
  List badania = [];

  @override
  Widget build(BuildContext context) {
    try {
      final args = ModalRoute.of(context)!.settings.arguments as List;
      badania = args;
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
            'Próby wątrobowe',
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
                Navigator.pushNamed(context, '/loadingproby', arguments:{
                  'proby_id' : badania[index]['badanie']['id']?? 0,
                });
              },
              leading: Text(
                '#${badania[index]['badanie']['id']?? 0}',
                style: const TextStyle(
                  fontFamily: 'DTLProkyon',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              title: Text(
                'Data: ${badania[index]['badanie']['dataBadania'] ?? 'nieznana'} \nPacjent: ${badania[index]['badanie']['pacjent'] ?? 'nieznany'}',
                style: const TextStyle(
                  fontFamily: 'DTLProkyon',
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'ALT: ${badania[index]['ALT'] ?? '0'}, AST: ${badania[index]['AST'] ?? '0'}, ALP: ${badania[index]['ALP'] ?? '0'} \nBIL: ${badania[index]['BIL'] ?? '0'}, GGTP: ${badania[index]['GGTP'] ?? '0'}',
                style: const TextStyle(
                  fontFamily: 'DTLProkyon',
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: Colors.teal[100],
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.pushNamed(context, '/registerproby');
            },
            tooltip: 'Dodaj',
            child: const Icon(
              Icons.add,
              color: Colors.blueGrey,
            ),
          ),
          SizedBox(height:10.0),
          FloatingActionButton(
            heroTag: "btn2",
            backgroundColor: Colors.teal[100],
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.pushNamed(context, '/loadingprobydiagnosta');
            },
            tooltip: 'Dodaj',
            child: const Icon(
              Icons.refresh,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBarDiagnosta(
        fabLocation: FloatingActionButtonLocation.endDocked,
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

