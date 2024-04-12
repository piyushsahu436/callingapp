import 'package:callingapp/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class calldetails extends StatefulWidget {
  const calldetails({super.key});

  @override
  State<calldetails> createState() => _calldetailsState();
}

class _calldetailsState extends State<calldetails> {

  TextEditingController firstname = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController phoneno = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 5,
              ),
              Text(
                "Create contact",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 55,
              ),
              TextButton(
                  onPressed: () async {
                    String Id = randomAlphaNumeric(10);
                    Map<String, dynamic> empolyeeInfoMap = {
                      "firstname": firstname.text,
                      "lastname": lastname.text,
                      "phoneno": phoneno.text,
                      "Id": Id,
                    };
                    await DatabaseMethods()
                        .addEmployeeDetails(empolyeeInfoMap,Id).then((value) => {

                      Fluttertoast.showToast(
                          msg: "Contact has been saved",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      ),
                    });
                  },
                  child: Text("Save",
                      style: TextStyle(color: Colors.blue, fontSize: 22.0)))
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: firstname,
                decoration: InputDecoration(
                  hintText: 'First name ',
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: lastname,
                decoration: InputDecoration(
                  hintText: 'Last name ',
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: phoneno,
                decoration: InputDecoration(
                  hintText: 'Phone Number ',
                  prefixIcon: Icon(Icons.phone_iphone_rounded),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
