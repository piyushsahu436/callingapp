import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addEmployeeDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {

      await FirebaseFirestore.instance
          .collection('Employee')
          .doc(id)
          .set(employeeInfoMap);

  }

Future<Stream<QuerySnapshot>> getEmpolyeeDetails()async{
    return await FirebaseFirestore.instance.collection('Empolyee').snapshots();

  }

}
