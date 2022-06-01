import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moje_badania/pages/bottom_bars.dart';

class RegisterProby extends StatefulWidget {
  const RegisterProby({Key? key}) : super(key: key);

  @override
  _RegisterProbyState createState() => _RegisterProbyState();
}

class _RegisterProbyState extends State<RegisterProby> {
  final dataController = TextEditingController();
  final peselController = TextEditingController();
  final ALTController = TextEditingController();
  final ASTController = TextEditingController();
  final ALPController = TextEditingController();
  final BILController = TextEditingController();
  final GGTPController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dataController.dispose();
    peselController.dispose();
    ALTController.dispose();
    ASTController.dispose();
    ALPController.dispose();
    BILController.dispose();
    GGTPController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
            )),
        body: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "Rejestracja badania morfologii krwi",
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 20.0,
                fontFamily: 'DTLProkyon',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(right: 35, left: 35, top: 20),
              child: Column(children: [
                TextField(
                  controller: dataController,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'Data badania RRRR-MM-DD',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: peselController,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'PESEl pacjenta',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: ALTController,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'ALT',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: ASTController,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'ASP',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: ALPController,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'ALP',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: BILController,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'BIL',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: GGTPController,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    hintText: 'GGTP',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueGrey[700],
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () async {
                      if (dataController.text.isNotEmpty &&
                          peselController.text.isNotEmpty) {
                        //LoginRequest loginReq = LoginRequest(email: loginController.text, password: passController.text);
                        //await loginReq.postLogin();
                        Navigator.pushNamed(context, '/loadingregisterproby',
                            arguments: {
                              'dataBadania': dataController.text,
                              'typBadania': 'MK',
                              'pacjent': peselController.text,
                              'ALT': ALTController.text,
                              'AST': ASTController.text,
                              'ALP': ALPController.text,
                              'BIL': BILController.text,
                              'GGTP': GGTPController.text,
                            });
                      }
                    },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ),
              ]),
            ),
          ),
        ]),
        bottomNavigationBar: const BottomBarDiagnosta(
          fabLocation: FloatingActionButtonLocation.endDocked,
          shape: CircularNotchedRectangle(),
        ),
      ),
    );
  }
}
