import 'package:callingapp/featues/screens/welcome/calldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class calling_screen extends StatefulWidget {
  @override
  State<calling_screen> createState() => _calling_screenState();
}

class _calling_screenState extends State<calling_screen> {


Uri dialnumber = Uri(scheme: 'tel', path: '123456');

callnumber()async{
  await launchUrl(dialnumber);
}

  directcall(String  phonenumber) async {
    await FlutterPhoneDirectCaller.callNumber('phonenumber');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => calldetails(),
              ));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(child: Text("ZEN CALL")),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Employee').snapshots(),
          builder: (context, petSnapshot) {
            if (petSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final petDocs = petSnapshot.data!.docs;
              return ListView.builder(
                  itemCount: petDocs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      child: ListTile(
                        title: Text(petDocs[index]['firstname']),
                        subtitle: Text(petDocs[index]['phoneno']),
                        trailing: IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            directcall(petDocs[index]['phoneno']);
                          },
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
