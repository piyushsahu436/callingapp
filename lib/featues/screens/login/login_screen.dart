import 'package:flutter/material.dart';
import 'package:callingapp/featues/screens/signup/signup_screen.dart';
import 'package:callingapp/featues/screens/welcome/calling_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginmodal extends StatefulWidget {
  loginmodal({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;
  final GlobalKey<FormState> _formKey;

  @override
  State<loginmodal> createState() => _loginmodalState();
}

class _loginmodalState extends State<loginmodal> {

final _auth = FirebaseAuth.instance;

  final PageController _pageController = PageController(initialPage: 0);

  final email = TextEditingController();

  final password = TextEditingController();

  void login(){
    _auth.signInWithEmailAndPassword(email: "${email.text}" , password: "${password.text}")
        .then((value) {
Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> calling_screen()));
    } );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Form(
            child: ListView(
              children: [
                Form(
                  key: widget._formKey,
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Align(
                              alignment: Alignment.topRight, child: Text("X"))),
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Email",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.left),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Password",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.left),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "Forget Password ?",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if(widget._formKey.currentState!.validate()){
                              login();
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          child: Text(
                            "Login".toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signupscreen()),
                            );
                          },
                          child: Text.rich(TextSpan(
                              text: "Dont have account",
                              style: TextStyle(fontSize: 18),
                              children: [
                                TextSpan(
                                    text: "SignUp",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18))
                              ])))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
