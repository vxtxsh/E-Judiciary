

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class actdetails extends StatefulWidget {
  const actdetails({Key? key});

  @override
  State<actdetails> createState() => _actdetailsState();
}

class _actdetailsState extends State<actdetails> {
  var action = TextEditingController();
  var date = TextEditingController();
  var section = TextEditingController();
  final RegExp dobRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');

  void saveDataToFirestore() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;
      if (!dobRegex.hasMatch(date.text)) {
        showValidationError('Invalid date of birth (use MM/dd/yyyy format)');
        return;
      }

      Map<String, String> data = {
        'action': action.text,
        'date': date.text,
        'section': section.text,
        // Add more fields or customize the field names as needed
      };

      firestore
          .collection('efiling')
          .doc(userId)
          .collection('actdetails')
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Act Details'),
        backgroundColor: const Color.fromARGB(255, 58, 57, 57),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: TextField(
                controller: action,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 5, 29, 101), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 72, 49, 41), width: 2),
                  ),
                  labelText: 'Cause of Action',
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(255, 5, 29, 101)),
                  hintText: 'Enter Cause of Action',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: TextField(
                controller: date,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 5, 29, 101), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 72, 49, 41), width: 2),
                  ),
                  labelText: 'Date',
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(255, 5, 29, 101)),
                  hintText: 'Enter Date',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: TextField(
                controller: section,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 5, 29, 101), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 72, 49, 41), width: 2),
                  ),
                  labelText: 'Section',
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(255, 5, 29, 101)),
                  hintText: 'Enter Section',
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
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
          ],
        ),
      ),
    );
  }
}