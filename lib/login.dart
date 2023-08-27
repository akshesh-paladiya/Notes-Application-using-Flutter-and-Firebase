import 'package:crud_operation/showData.dart';
import 'package:flutter/material.dart';
import 'package:crud_operation/services/functions/authFunctions.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text('Login'),
      // ),
      body: Form(

        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,

          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/splash_bg.jpg'),
                fit: BoxFit.cover),
          ),
          // color: Colors.black12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.fromLTRB(40, 150, 40, 140),
                padding: EdgeInsets.all(14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ======== Full Name ========
                    login
                        ? Container()
                        :
                    TextFormField(
                      key: ValueKey('fullname'),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Full Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Full Name';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          fullname = value!;
                        });
                      },
                    ),

                    SizedBox(height: 20,),
                    // ======== Email ========
                    TextFormField(
                      cursorColor: Colors.white,
                      key: ValueKey('email'),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: 'Enter Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please Enter valid Email';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                    ),

                    SizedBox(height: 20,),
                    // ======== Password ========
                    TextFormField(
                      key: ValueKey('password'),
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: 'Enter Password',
                      ),
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Please Enter Password of min length 6';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              login
                                  ? AuthServices.signinUser(email, password, context)
                                  : AuthServices.signupUser(
                                  email, password, fullname, context);
                              Route route = MaterialPageRoute(builder: (context) => showData());
                              Navigator.push(context, route);
                            }
                          },
                          child: Text(login ? 'Login' : 'Signup', style: TextStyle(fontSize: 17,color: Colors.black),)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(

                      onPressed: () {
                        setState(() {
                          login = !login;
                        });
                      },
                      child: Text(login
                          ? "Don't have an account? Signup"
                          : "Already have an account? Login", style: TextStyle(color: Colors.black),),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}