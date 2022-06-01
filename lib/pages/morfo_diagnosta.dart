import 'package:flutter/material.dart';
import 'package:moje_badania/pages/bottom_bars.dart';

class MorfoDiagnosta extends StatefulWidget {
  @override
  _MorfoDiagnostaState createState() => _MorfoDiagnostaState();
}

class _MorfoDiagnostaState extends State<MorfoDiagnosta> {
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
            'Badania morfologii krwi',
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
                Navigator.pushNamed(context, '/loadingmorfo', arguments:{
                  'morfo_id' : badania[index]['badanie']['id']?? 0,
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
                'HGB: ${badania[index]['HGB'] ?? '0'}, HCT: ${badania[index]['HCT'] ?? '0'}, WBC: ${badania[index]['WBC'] ?? '0'} \nRBC: ${badania[index]['RBC'] ?? '0'}, PLT: ${badania[index]['PLT'] ?? '0'}, CRP: ${badania[index]['CRP'] ?? '0'}',
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
              Navigator.pushNamed(context, '/registermorfo');
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
              Navigator.pushNamed(context, '/loadingmorfodiagnosta');
            },
            tooltip: 'Odśwież',
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

