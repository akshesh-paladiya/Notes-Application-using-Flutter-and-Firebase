import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operation/showData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';
// import 'package:crud_operation/home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final currentUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          // stream: FirebaseAuth.instance.authStateChanges(),
          stream: FirebaseFirestore.instance
              .collection('user')
              .where('uid', isEqualTo:currentUser.currentUser!.uid)
              .snapshots(),

          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return showData();
            } else {
              return LoginForm();
            }
          },
        )
    );
  }
}