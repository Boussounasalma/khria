import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:projetv2/Assistant/Assistant_method.dart';
import 'package:projetv2/global/golobal.dart';
import 'package:projetv2/screens/login_screen.dart';
import 'package:projetv2/screens/main_page.dart';
class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

  startTimer(){
    Timer(Duration(seconds:3),() async{
      if(await firebaseAuth.currentUser != null){
        firebaseAuth.currentUser!=null ? AssistandMethode.readCurrentOnlineUserInfo() : null;
        Navigator.push(context,MaterialPageRoute(builder:(c) => MainScreen()));

      }
      else{
        Navigator.push(context , MaterialPageRoute(builder: (c) => LoginScreen()));
      }
    }
  );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Text(
          'Covoturage',
        )
      ),
    );
  }
}
