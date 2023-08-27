import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SignUp'),
        backgroundColor: Colors.black,
      ),

      body: Container(
        color: Colors.black12,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
