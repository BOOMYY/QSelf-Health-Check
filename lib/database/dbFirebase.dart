import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_trial_three/screen/data.dart';
import 'package:flutter_trial_three/screen/userList.dart';
class dbService {

  final String uid;

  dbService({this.uid});

  final CollectionReference userCollect = Firestore.instance.collection("user");

  final CollectionReference userContact = Firestore.instance.collection("contact_info");

  final CollectionReference travel_histo = Firestore.instance.collection("travel_histo");

  final CollectionReference diagnoseForm = Firestore.instance.collection(
      'diagnose_form');


//user info
  Future updateUserData(String id, String fname, String lname,
      String nationality,
      String passport_no) async {
    return await userCollect.document(uid).setData({
      'id': id,
      'fname': fname,
      'lname': lname,
      'nationality': nationality,
      'passport_no': passport_no,
    });
  }

  Future updateContact(String contact_no, String contact_emergency_no,
      String quar_hotel) async {
    return await userContact.document(uid).setData({
      'contact_no': contact_no,
      'contact_emergency_no': contact_emergency_no,
      'quar_hotel': quar_hotel,
    });
  }

  Future updateTravel(String travel_arrival_date,
      String travel_country) async {
    return await travel_histo.document(uid).setData({
      'travel_arrival_date': travel_arrival_date,
      'travel_country': travel_country,
    });
  }

// user diagnose_form
  Future submitForm(int day, String fever, String cough,
      String diff_breathing, String sore_throat,
      String heacache, String body_weaknesses) async {
    return await diagnoseForm.document(uid).setData({
      'day': day,
      'fever': fever,
      'cough': cough,
      'diff_breathing': diff_breathing,
      'sore_throat': sore_throat,
      'headache': heacache,
      'body_weaknesses': body_weaknesses,
    });
  }
  
  //update password
//  changePassword(){
//    DocumentReference documentReference =
//    Firestore.instance.collection("user").document(uid);
//
//    Map<String, dynamic> users = {
//      ""
//    };
//  }

  Stream<List<userList>> get user {
    return userCollect.snapshots()
    .map(_userList);
  }


  List<userList> _userList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return userList(
          fname: doc.data['fname'] ?? '',
          lname: doc.data['lname'] ?? '',
          nationality: doc.data['nationality'] ?? '',
          passport_no: doc.data['passport_no'] ?? ''
      );
    }).toList();
  }
}