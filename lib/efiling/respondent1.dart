
import 'package:ejudiapp/efiling/efilinghome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'respondent2.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class respondent1 extends StatefulWidget {
  const respondent1({super.key});

  @override
  State<respondent1> createState() => _respondent1State();

}

class _respondent1State extends State<respondent1> {
  
  var name = TextEditingController();
  var email = TextEditingController();
  var phno = TextEditingController();
  var dob = TextEditingController();
  var age = TextEditingController();
  var gender = TextEditingController();
  var religion = TextEditingController();
  var caste = TextEditingController();

  // Email validation regex
  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  // Phone number validation regex
  final RegExp phoneRegex = RegExp(r'^[0-9]{10}$');

  // Date of birth validation regex (you might need to adjust it based on your date format)
  final RegExp dobRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');

  void saveDataToFirestore() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String userId = user.uid;

      // Validate email, phone number, and date of birth
      if (!emailRegex.hasMatch(email.text)) {
        showValidationError('Invalid email address');
        return;
      }
      

      if (!phoneRegex.hasMatch(phno.text)) {
        showValidationError('Invalid phone number');
        return;
      }

      if (!dobRegex.hasMatch(dob.text)) {
        showValidationError('Invalid date of birth (use MM/dd/yyyy format)');
        return;
      }

      Map<String, String> data = {
        'name': name.text,
        'email': email.text,
        'phno': phno.text,
        'dob': dob.text,
        'age': age.text,
        'gender': gender.text,
        'religion': religion.text,
        'caste': caste.text,
        // Add more fields or customize the field names as needed
      };

      firestore
          .collection('efiling')
          .doc(userId)
          .collection('Respondent')
          .add(data)
          .then((value) {
        print("Data added to Firestore");
      }).catchError((error) {
        print("Error adding data to Firestore: $error");
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Details added successfully'),
          duration: Duration(seconds: 2),
        ),
      );
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
        title: const Text('respondent1 '),
        backgroundColor:const Color.fromARGB(255, 58, 57, 57),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.home),
        //     onPressed: () {
        //       Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context) => efiling(),
        //         ),
        //       );
        //     },
        //   )
        // ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
            
              //1st 
               Padding(
                padding:const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: name,
                  
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 5, 29, 101),
                      width:2 
                     )
        
                    ),
                    enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 72, 49, 41),
                      width:2 
                     )
        
                    ),
                      
                      labelText: 'Name',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 5, 29, 101),),
                      
                      hintText: 'Enter Name'),
                ),
              ),
              //2
               Padding(
                padding:const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: email,
                  
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 5, 29, 101),
                      width:2 
                     )
        
                    ),
                    enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 72, 49, 41),
                      width:2 
                     )
        
                    ),
                      
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 5, 29, 101),),
                      
                      hintText: 'Enter Email'),
                ),
              ),
              //3
               Padding(
                padding:const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: phno,
                    keyboardType: TextInputType.number,  // Set keyboard type to number
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,  // Allow only digits
      LengthLimitingTextInputFormatter(10),  // Limit the length to 6 digits
    ],
                  
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 5, 29, 101),
                      width:2 
                     )
        
                    ),
                    enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 72, 49, 41),
                      width:2 
                     )
        
                    ),
                      
                      labelText: 'Phone Number',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 5, 29, 101),),
                      
                      hintText: 'Enter Phone Number'),
                ),
              ),
              //4
               Padding(
                padding:const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: dob,
                  
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 5, 29, 101),
                      width:2 
                     )
        
                    ),
                    enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 72, 49, 41),
                      width:2 
                     )
        
                    ),
                      
                      labelText: 'DateOfBirth',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 5, 29, 101),),
                      
                      hintText: 'Enter Date Of Birth'),
                ),
              ),
              //5
               Padding(
                padding:const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: age,
                  
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 5, 29, 101),
                      width:2 
                     )
        
                    ),
                    enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 72, 49, 41),
                      width:2 
                     )
        
                    ),
                      
                      labelText: 'Age',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 5, 29, 101),),
                      
                      hintText: 'Enter Age'),
                ),
              ),
              //6
               Padding(
                padding:const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: gender,
                  
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 5, 29, 101),
                      width:2 
                     )
        
                    ),
                    enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 72, 49, 41),
                      width:2 
                     )
        
                    ),
                      
                      labelText: 'Gender',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 5, 29, 101),),
                      
                      hintText: 'Enter Gender'),
                ),
              ),
              //7
               Padding(
                padding:const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: religion,
                  
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 5, 29, 101),
                      width:2 
                     )
        
                    ),
                    enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 72, 49, 41),
                      width:2 
                     )
        
                    ),
                      
                      labelText: 'Religion',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 5, 29, 101),),
                      
                      hintText: 'Enter Religion'),
                ),
              ),
              //8
                  Padding(
                padding:const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextField(
                  controller: caste,
                  
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 5, 29, 101),
                      width:2 
                     )
        
                    ),
                    enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(11),
                     borderSide: const BorderSide(
                      color:Color.fromARGB(255, 72, 49, 41),
                      width:2 
                     )
        
                    ),
                      
                      labelText: 'Caste',
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 5, 29, 101),),
                      
                      hintText: 'Enter Caste'),
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
                        MaterialPageRoute(builder: (context) => const respondent2()),
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