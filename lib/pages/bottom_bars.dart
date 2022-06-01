import 'package:flutter/material.dart';

class BottomBarPacjent extends StatelessWidget {
  const BottomBarPacjent({
    this.fabLocation = FloatingActionButtonLocation.centerFloat,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                tooltip: 'Profil',
                icon: const Icon(
                  Icons.person,
                  color: Colors.white54,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/loadingprofile');
                },
              ),
              if (centerLocations.contains(fabLocation)) const Spacer(),
              IconButton(
                tooltip: 'Lista badań',
                icon: const Icon(
                  Icons.insert_chart,
                  color: Colors.white54,
                ),
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName('/'));
                  Navigator.pushNamed(context, '/loadinghomepacjent');
                },
              ),
              IconButton(
                tooltip: 'Wyloguj',
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white54,
                ),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class BottomBarLekarz extends StatelessWidget {
  const BottomBarLekarz({
    this.fabLocation = FloatingActionButtonLocation.centerFloat,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                tooltip: 'Profil',
                icon: const Icon(
                  Icons.person,
                  color: Colors.white54,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/loadingprofile');
                },
              ),
              if (centerLocations.contains(fabLocation)) const Spacer(),
              IconButton(
                tooltip: 'Lista pacjentów',
                icon: const Icon(
                  Icons.insert_chart,
                  color: Colors.white54,
                ),
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName('/'));
                  Navigator.pushNamed(context, '/loadinghomelekarz');
                },
              ),
              IconButton(
                tooltip: 'Wyloguj',
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white54,
                ),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class BottomBarDiagnosta extends StatelessWidget {
  const BottomBarDiagnosta({
    this.fabLocation = FloatingActionButtonLocation.centerFloat,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                tooltip: 'Profil',
                icon: const Icon(
                  Icons.person,
                  color: Colors.white54,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/loadingprofile');
                },
              ),
              IconButton(
                tooltip: 'Lista badań prób wątrobowych',
                icon: const Icon(
                  Icons.medical_information,
                  color: Colors.white54,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/loadingprobydiagnosta');
                },
              ),
              if (centerLocations.contains(fabLocation)) const Spacer(),
              IconButton(
                tooltip: 'Lista wszystkich badań',
                icon: const Icon(
                  Icons.home,
                  color: Colors.white54,
                ),
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName('/'));
                  Navigator.pushNamed(context, '/loadinghomediagnosta');
                },
              ),
              IconButton(
                tooltip: 'Lista badań morfologii krwi',
                icon: const Icon(
                  Icons.bloodtype,
                  color: Colors.white54,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/loadingmorfodiagnosta');
                },
              ),
              IconButton(
                tooltip: 'Wyloguj',
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white54,
                ),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}