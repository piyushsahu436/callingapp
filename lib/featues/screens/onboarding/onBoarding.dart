import 'package:flutter/material.dart';

import 'package:callingapp/featues/screens/login/login_screen.dart';

class Onboarding extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60,),
            Container(
              height: 700,
              width:500,
              child: Image.asset("assets/images/k8b0B8d26M.gif"),
            ),

            SizedBox(
              width: 400,
              height:50,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(

                  backgroundColor: Colors.red, // Background color
                ),
                  onPressed: () { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginmodal(formKey: _formKey)),
                  );},
                  child: Text("Login" , style: TextStyle(color: Colors.white,fontSize: 22 ), ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

