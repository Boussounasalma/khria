
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetv2/screens/login_screen.dart';
import 'package:projetv2/screens/register_screen.dart';
import 'package:projetv2/spalshScreen/splash_screen.dart';

import 'package:projetv2/themeprovider/Themeprovider.dart';

bool _initialized = false;
Future <void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    // Add your Firebase options here

    options: FirebaseOptions(
      apiKey: 'AIzaSyDW_s2JcO5vTQoXhkQGF3pIEh8pmWhopPw',
      projectId: 'version2projet',
      storageBucket: 'version2projet.appspot.com',
      messagingSenderId: '106231691628',
      appId: '1:106231691628:ios:58ba9561440067a8051b49',
      databaseURL: 'https://version2projet-default-rtdb.firebaseio.com',
    ),
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: MyThemes.lighTheme,
      debugShowCheckedModeBanner: false,
      home: SpalshScreen(),
    );
  }
}


