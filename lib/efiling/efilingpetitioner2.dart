
import 'package:ejudiapp/efiling/efilinghome.dart';
import 'package:ejudiapp/efiling/respondent1.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class petitioner2 extends StatefulWidget {
  const petitioner2({Key? key}) : super(key: key);

  @override
  State<petitioner2> createState() => _petitioner2State();
}

class _petitioner2State extends State<petitioner2> {
  var rname = TextEditingController();
  var relation = TextEditingController();
  var address = TextEditingController();
  var ward = TextEditingController();
  var district = TextEditingController();
  var state = TextEditingController();
  var pincode = TextEditingController();
  var pscode = TextEditingController();

  void saveDataToFirestore() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;
      if (pincode.text.length > 6) {
        showValidationError('Pincode should be 6 digits');
        return;
      }

      Map<String, String> data = {
        'name': rname.text,
        'email': relation.text,
        'phno': address.text,
        'dob': ward.text,
        'age': district.text,
        'gender': state.text,
        'religion': pincode.text,
        'caste': pscode.text,
        // Add more fields or customize the field names as needed
      };

      firestore
          .collection('efiling')
          .doc(userId)
          .collection('petitioner2')
          .add(data)
          .then((value) {
        print("Data added to Firestore");
      }).catchError((error) {
        print("Error adding data to Firestore: $error");
      });
    } else {
      print("User not signed in");
    }
  }

  void showValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('petitioner2'),
        backgroundColor: const Color.fromARGB(255, 58, 57, 57),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //1st
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: rname,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 29, 101), width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 72, 49, 41), width: 2)),
                    labelText: 'Relative name',
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 5, 29, 101)),
                    hintText: 'Enter Relative Name'),
                ),
              ),
              //2
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: relation,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 29, 101), width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 72, 49, 41), width: 2)),
                    labelText: 'Relation',
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 5, 29, 101)),
                    hintText: 'Enter Relation'),
                ),
              ),
              //3
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: address,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 29, 101), width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 72, 49, 41), width: 2)),
                    labelText: 'Address',
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 5, 29, 101)),
                    hintText: 'Enter Address'),
                ),
              ),
              //4
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: ward,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 29, 101), width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 72, 49, 41), width: 2)),
                    labelText: 'Ward',
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 5, 29, 101)),
                    hintText: 'Enter Ward'),
                ),
              ),
              //5
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: district,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 29, 101), width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 72, 49, 41), width: 2)),
                    labelText: 'District',
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 5, 29, 101)),
                    hintText: 'Enter District'),
                ),
              ),
              //6
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: state,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 29, 101), width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 72, 49, 41), width: 2)),
                    labelText: 'State',
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 5, 29, 101)),
                    hintText: 'Enter State'),
                ),
              ),
              //7
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: pincode,
                  keyboardType: TextInputType.number, // Set keyboard type to number
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 29, 101), width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 72, 49, 41), width: 2)),
                    labelText: 'Pincode',
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 5, 29, 101)),
                    hintText: 'Enter Pincode'),
                ),
              ),
              //8
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: pscode,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 5, 29, 101), width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 72, 49, 41), width: 2)),
                    labelText: 'Police Station Code',
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 5, 29, 101)),
                    hintText: 'Enter Police Station code'),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text('Save'),
                    onPressed: () {
                      saveDataToFirestore();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Details added successfully'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text('Next'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  efiling()),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}