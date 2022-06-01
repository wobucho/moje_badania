import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    // set background image

    return Scaffold(
      backgroundColor: Colors.teal,
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
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width:250.0,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        Navigator.pushNamed(context, '/loginpacjent', arguments:{
                          'role' : 'PACJENT',
                        });
                      },
                      icon: Icon(
                        Icons.person,
                        color: Colors.grey[300],
                        size: 60.0
                      ),
                      label: Text(
                        'Pacjent',
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 30.0,
                          fontFamily: 'DTLProkyon',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width:250.0,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        Navigator.pushNamed(context, '/login', arguments:{
                          'role' : 'LEKARZ',
                        });
                      },
                      icon: Icon(
                          Icons.medication,
                          color: Colors.grey[300],
                          size: 60.0
                      ),
                      label: Text(
                        'Lekarz',
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 30.0,
                          fontFamily: 'DTLProkyon',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width:250.0,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        Navigator.pushNamed(context, '/login', arguments:{
                          'role' : 'DIAGNOSTA',
                        });
                      },
                      icon: Icon(
                          Icons.science,
                          color: Colors.grey[300],
                          size: 60.0
                      ),
                      label: Text(
                        'Diagnosta',
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 30.0,
                          fontFamily: 'DTLProkyon',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}