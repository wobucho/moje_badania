import 'package:flutter/material.dart';
import 'package:moje_badania/services/login_request.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final loginController = TextEditingController();
  final passController = TextEditingController();
  Map data = {};

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    loginController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    try {
      data = ModalRoute.of(context)?.settings.arguments as Map;
    } catch (e) {
      print(e);
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }

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
            )
        ),
        body: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 80),
            child: Text(
              "Logowanie",
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 30.0,
                fontFamily: 'DTLProkyon',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                right: 35,
                left: 35,
                top: 35,
              ),
              child: Column(children: [
                TextField(
                  controller: loginController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Hasło',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blueGrey,
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () async {
                      if(loginController.text.isNotEmpty && passController.text.isNotEmpty ) {
                        //LoginRequest loginReq = LoginRequest(email: loginController.text, password: passController.text);
                        //await loginReq.postLogin();
                        Navigator.pushNamed(context, '/loading_login', arguments:{
                          'role' : data['role'] as String,
                          'email': loginController.text,
                          'password': passController.text,
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
      ),
    );
  }
}