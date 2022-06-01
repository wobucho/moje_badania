import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final imieController = TextEditingController();
  final nazwiskoController = TextEditingController();
  final peselController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passController.dispose();
    imieController.dispose();
    nazwiskoController.dispose();
    peselController.dispose();
    phoneController.dispose();
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
              "Rejestracja konta pacjenta",
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
                  controller: emailController,
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
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: passController,
                  obscureText: true,
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
                    hintText: 'Hasło',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: imieController,
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
                    hintText: 'Imię',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: nazwiskoController,
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
                    hintText: 'Nazwisko',
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
                    hintText: 'PESEL',
                    hintStyle: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: phoneController,
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
                    hintText: 'Telefon',
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
                      if(emailController.text.isNotEmpty && passController.text.isNotEmpty && imieController.text.isNotEmpty && nazwiskoController.text.isNotEmpty && peselController.text.isNotEmpty && phoneController.text.isNotEmpty ) {
                        //LoginRequest loginReq = LoginRequest(email: loginController.text, password: passController.text);
                        //await loginReq.postLogin();
                        Navigator.pushNamed(context, '/loading_register', arguments:{
                          'email': emailController.text,
                          'password': passController.text,
                          'imie': imieController.text,
                          'nazwisko': nazwiskoController.text,
                          'pesel': peselController.text,
                          'telefon': phoneController.text,
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
