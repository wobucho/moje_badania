import 'package:flutter/material.dart';
import 'package:moje_badania/pages/home.dart';
import 'package:moje_badania/pages/loading_morfo_diagnosta.dart';
import 'package:moje_badania/pages/login.dart';
import 'package:moje_badania/pages/loading_login.dart';
import 'package:moje_badania/pages/loading_register.dart';
import 'package:moje_badania/pages/login_pacjent.dart';
import 'package:moje_badania/pages/register_pacjent.dart';
import 'package:moje_badania/pages/home_pacjent.dart';
import 'package:moje_badania/pages/loading_home_pacjent.dart';
import 'package:moje_badania/pages/loading_profile.dart';
import 'package:moje_badania/pages/profile_pacjent.dart';
import 'package:moje_badania/pages/loading_home_lekarz.dart';
import 'package:moje_badania/pages/home_lekarz.dart';
import 'package:moje_badania/pages/profile_lekarz.dart';
import 'package:moje_badania/pages/loading_home_diagnosta.dart';
import 'package:moje_badania/pages/home_diagnosta.dart';
import 'package:moje_badania/pages/profile_diagnosta.dart';
import 'package:moje_badania/pages/morfo_diagnosta.dart';
import 'package:moje_badania/pages/loading_proby_diagnosta.dart';
import 'package:moje_badania/pages/proby_diagnosta.dart';
import 'package:moje_badania/pages/loading_morfo.dart';
import 'package:moje_badania/pages/loading_proby.dart';
import 'package:moje_badania/pages/morfo_details_diagnosta.dart';
import 'package:moje_badania/pages/proby_details_diagnosta.dart';
import 'package:moje_badania/pages/morfo_details_lekarz.dart';
import 'package:moje_badania/pages/proby_details_lekarz.dart';
import 'package:moje_badania/pages/morfo_details_pacjent.dart';
import 'package:moje_badania/pages/proby_details_pacjent.dart';
import 'package:moje_badania/pages/loading_lekarz_pacjent.dart';
import 'package:moje_badania/pages/lekarz_pacjent.dart';
import 'package:moje_badania/pages/register_morfo.dart';
import 'package:moje_badania/pages/loading_register_morfo.dart';
import 'package:moje_badania/pages/register_proby.dart';
import 'package:moje_badania/pages/loading_register_proby.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
    ),
    initialRoute: '/',
    routes: {
          '/': (context) => Home(),
          '/home': (context) => Home(),
          '/loadinghomepacjent': (context) => LoadingHomePacjent(),
          '/loadinghomelekarz': (context) => LoadingHomeLekarz(),
          '/loadinghomediagnosta': (context) => LoadingHomeDiagnosta(),
          '/homepacjent': (context) => HomePacjent(),
          '/homelekarz': (context) => HomeLekarz(),
          '/homediagnosta': (context) => HomeDiagnosta(),
          '/login': (context) => Login(),
          '/loading_login': (context) => LoadingLogin(),
          '/loading_register': (context) => LoadingRegister(),
          '/loginpacjent': (context) => LoginPacjent(),
          '/register': (context) => Register(),
          '/loadingprofile': (context) => LoadingProfile(),
          '/profilepacjent': (context) => ProfilePacjent(),
          '/profilelekarz': (context) => ProfileLekarz(),
          '/profilediagnosta': (context) => ProfileDiagnosta(),
          '/loadingmorfodiagnosta': (context) => LoadingMorfoDiagnosta(),
          '/morfodiagnosta': (context) => MorfoDiagnosta(),
          '/loadingprobydiagnosta': (context) => LoadingProbyDiagnosta(),
          '/probydiagnosta': (context) => ProbyDiagnosta(),
          '/loadingmorfo': (context) => LoadingMorfo(),
          '/loadingproby': (context) => LoadingProby(),
          '/morfodetailsdiagnosta': (context) => MorfoDetailsDiagnosta(),
          '/probydetailsdiagnosta': (context) => ProbyDetailsDiagnosta(),
          '/morfodetailslekarz': (context) => MorfoDetailsLekarz(),
          '/probydetailslekarz': (context) => ProbyDetailsLekarz(),
          '/morfodetailspacjent': (context) => MorfoDetailsPacjent(),
          '/probydetailspacjent': (context) => ProbyDetailsPacjent(),
          '/loadinglekarzpacjent': (context) => LoadingLekarzPacjent(),
          '/lekarzpacjent': (context) => LekarzPacjent(),
          '/registermorfo': (context) => RegisterMorfo(),
          '/loadingregistermorfo': (context) => LoadingRegisterMorfo(),
          '/registerproby': (context) => RegisterProby(),
          '/loadingregisterproby': (context) => LoadingRegisterProby(),
    }
));