import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'crud.dart';
import 'firebase_options.dart';
import 'showData.dart';
import 'login.dart';
import 'home.dart';
import 'package:crud_operation/Splash_Screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );
  final currentUser = FirebaseAuth.instance;
  runApp(

      MaterialApp(
        initialRoute: 'phone',
        debugShowCheckedModeBanner: false,
        routes: {
          'phone': (context) => Splash_Screen(),
          // 'verify': (context) => MyVerify(),
          // 'home': (context) => MyHome()
        },
      )


  );
}