import 'package:flutter/material.dart';
import 'package:moje_badania/pages/bottom_bars.dart';

class RegisterMorfo extends StatefulWidget {
  const RegisterMorfo({Key? key}) : super(key: key);

  @override
  _RegisterMorfoState createState() => _RegisterMorfoState();
}

class _RegisterMorfoState extends State<RegisterMorfo> {

  final dataController = TextEditingController();
  final peselController = TextEditingController();
  final HGBController = TextEditingController();
  final HCTController = TextEditingController();
  final WBCController = TextEditingController();
  final RBCController = TextEditingController();
  final PLTController = TextEditingController();
  final CRPController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dataController.dispose();
    peselController.dispose();
    HGBController.dispose();
    HCTController.dispose();
    WBCController.dispose();
    RBCController.dispose();
    PLTController.dispose();
    CRPController.dispose();
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
                    hintText: 'PESEL pacjenta',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: HGBController,
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
                    hintText: 'HGB',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: HCTController,
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
                    hintText: 'HCT',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: WBCController,
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
                    hintText: 'WBC',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: RBCController,
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
                    hintText: 'RBC',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),                const SizedBox(
              height: 15,
            ),
                TextField(
                  controller: PLTController,
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
                    hintText: 'PLT',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),                const SizedBox(
              height: 15,
            ),
                TextField(
                  controller: CRPController,
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
                    hintText: 'CRP',
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
                      if(dataController.text.isNotEmpty && peselController.text.isNotEmpty) {
                        //LoginRequest loginReq = LoginRequest(email: loginController.text, password: passController.text);
                        //await loginReq.postLogin();
                        Navigator.pushNamed(context, '/loadingregistermorfo', arguments:{
                          'dataBadania': dataController.text,
                          'typBadania': 'MK',
                          'pacjent': peselController.text,
                          'HGB': HGBController.text,
                          'HCT': HCTController.text,
                          'WBC': WBCController.text,
                          'RBC': RBCController.text,
                          'PLT': PLTController.text,
                          'CRP': CRPController.text,
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
