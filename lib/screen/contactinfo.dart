import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'start.dart';
import 'package:flutter_trial_three/database/DatabaseHelper.dart';
import 'data.dart';

class ContactInfoPage extends StatefulWidget {
  static const routeName = '/contactinfo';
  @override
  _ContactInfoPageState createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  FocusNode myFocusNode = new FocusNode();
  String valueChoose;
  List hotel = [
        "Century Park Hotel",
        "The Mini Suites-Eton Tower Makati",
        "The Charter House",
        "Belmont Hotel Manila",
        "Citadines Bay City Manila",
        "Conrad Manila",
        "Golden Phoenix Hotel Manila",
        "Hilton Manila",
        "Holiday Inn Express Manila Newport City",
        "Hotel 101",
        "Jen Manila By Shangri-La",
        "Manila Marriott Hotel",
        "Microtel By Wyndham Mall of Asia",
        "Midas Hotel And Casino",
        "Savoy Hotel Manila",
        "Sheraton Manila Hotel",
        "The Heritage Hotel",
        "Tryp By Wyndham Mall of Asia",
        "Amelie Hotel Manila",
        "Bayview Park Hotel Manila",
        "Diamond Hotel Manila",
        "Orchid Garden Suites Manila",
        "Sheraton Manila Bay",
        "The Bayleaf Intramuros",
        "Ascott Makati",
        "Astoria Greenbelt",
        "Berjaya Hotel Makati",
        "Citadines Salcedo Makati",
        "Discovery Primea",
        "Holiday Inn And Suites Makati",
        "Hotel Celeste",
        "Jinjiang Inn- Makati",
        "Makati Shangri-La, Manila",
        "New World Makati Hotel",
        "Oxford Suites Makati",
        "Seda Residences Makati",
        "Somerset Millenium Makati",
        "Somerset Olympia Makati",
        "Valero Grand Suites By Swiss-Belhotel",
        "Ascott Bonifacio Global City",
        "Seda BGC",
        "Acacia Hotel Manila",
        "B Hotel Alabang",
        "Crimson Hotel Filinvest City",
        "Discovery Suites",
        "Jinjiang Inn- Ortigas",
        "Richmonde Hotel Ortigas",
        "The Linden Suite",
        "B Hotel Quezon City",
        "Eastwood Richmonde Hotel",
        "Hotel Rembrandt",
        "Luxent Hotel",
        "Microtel by Wyndham Acropolis",
        "Microtel by Wyndham UP Technohub",
        "Novotel Manila Araneta City",
        "Seda Vertis North",
  ];

  final dbHelper = DatabaseHelper.instance;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

//  INSERT DATA
  void insert() async {
    Map<String, dynamic> row = {
      DatabaseHelper.c_contact_no: contactData.contact_number,
      DatabaseHelper.c_contact_emergency: contactData.contact_emergency,
      DatabaseHelper.c_quar_hotel: contactData.quar_hotel,

    };
    final id = await dbHelper.submit(row);
    print("pasok na database: Id is:  $id");
  }

//  validation
  void validate(){
    if(formkey.currentState.validate()){
      print("VALIDATE");
//      Navigator.of(context)
//          .pushReplacementNamed(ContactInfoPage.routeName);
      insert();
    }else{
      print("not validated");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Color(0xFFFA8072),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 40),
                            child: Text(
                              "Contact \nInformation",
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        key: formkey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              labelText: 'Contact Number',
                              filled: true,
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.blue
                                      : Colors.black),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey[400])),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey[400])),
                            ),
                            validator: (value) {
                              if(value.toString().isEmpty){
                                return 'INVALID CONTACT NUMBER';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              contactData.contact_number = value;
                            },
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              labelText: 'In case of emergency',
                              filled: true,
                              labelStyle: TextStyle(
                                  color: myFocusNode.hasFocus
                                      ? Colors.blue
                                      : Colors.black),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey[400])),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.grey[400])),
                            ),
                            validator: (value) {
                              if(value.toString().isEmpty){
                                return 'INVALID EMERGENCY NUMBER';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              contactData.contact_emergency = value;
                            },
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "Quarantine Hotel",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Divider(
                            color: Colors.black54,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          //dropdown
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Quarantine Hotel Checked in",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF8A8A8A),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 100.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black12, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonFormField(
                              validator: (newValue) {
                                if(newValue.toString().isEmpty){
                                  return 'INVALID QUARANTINE HOTEL';
                                }
                                return null;
                              },
                              value: valueChoose,
                              onChanged: (newValue) {
                                setState(() {
                                  valueChoose = newValue;
                                  contactData.quar_hotel = newValue;
                                });
                              },
                              items: hotel.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 50,
                          onPressed: () {
                            validate();
                          },
                          color: Color(0xFFFF5555),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
