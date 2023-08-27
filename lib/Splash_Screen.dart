
import 'package:flutter/material.dart';
import 'dart:async';
import 'login.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 6),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    LoginForm(),
            )
        )
    );
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlue.shade900,
      body: Center(
        child: Column(
          children: [

            // applogoWidget(),
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/splash_bg.jpg'),
                    fit: BoxFit.cover),
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(alignment: Alignment.center,),

                    Image.asset('assets/notes.png',height: 160,width: 160,)
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}

Widget applogoWidget(){

  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/splash_bg.jpg'),
          fit: BoxFit.cover),
    ),
  );

}


