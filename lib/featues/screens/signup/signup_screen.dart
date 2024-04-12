import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "../login/login_screen.dart";

class signupscreen extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confrimpassword = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose(){
    email.dispose();
    password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Form(
              child: ListView(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Align(
                                alignment: Alignment.topRight, child: Text("X"))),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Username",
                              style: TextStyle(color: Colors.black, fontSize: 16),
                              textAlign: TextAlign.left),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: username,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'UserName',
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
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
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
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
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _auth.createUserWithEmailAndPassword(
                                    email: email.text.toString(),
                                    password: password.text.toString());
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            child: Text(
                              "SignUp".toUpperCase(),
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> loginmodal(formKey: _formKey),)
                              );
                            },
                            child: Text.rich(TextSpan(
                                text: "Already have account",
                                style: TextStyle(fontSize: 18),
                                children: [
                                  TextSpan(
                                      text: "LoginUp",
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
