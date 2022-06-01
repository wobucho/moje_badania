import 'package:flutter/material.dart';
import 'package:moje_badania/pages/bottom_bars.dart';

class HomeLekarz extends StatefulWidget {
  @override
  _HomeLekarzState createState() => _HomeLekarzState();
}

class _HomeLekarzState extends State<HomeLekarz> {
  List pacjenci = [];

  @override
  Widget build(BuildContext context) {
    try {
      final args = ModalRoute.of(context)!.settings.arguments as List;
      pacjenci = args;
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
            'Moi pacjenci',
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 10.0,
              fontFamily: 'DTLProkyon',
            ),
          ),
        ]),
      ),
      body: ListView.builder(
        itemCount: pacjenci.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.teal[100],
            child: ListTile(
              onTap: () {
                  Navigator.pushNamed(context, '/loadinglekarzpacjent', arguments:{
                    'pacjent_id' : pacjenci[index]['user']?? 0,
                    'imie' : pacjenci[index]['imie']?? '',
                    'nazwisko' : pacjenci[index]['nazwisko']?? '',
                  });
              },
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(
                '${(pacjenci[index]['imie'] ?? 'Imię')} ${(pacjenci[index]['nazwisko'] ?? 'Nazwisko') }',
                style: const TextStyle(
                  fontFamily: 'DTLProkyon',
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'PESEL: ${pacjenci[index]['pesel'] ?? 'nieznany'}',
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
          Navigator.pushNamed(context, '/loadinghomelekarz');
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
