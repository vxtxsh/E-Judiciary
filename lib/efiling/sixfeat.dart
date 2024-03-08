import 'dart:math';
import 'package:ejudiapp/efiling/efilinghome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(sixfea());
}

class sixfea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aadhar Number Entry',
      home: AadharEntryPage(),
    );
  }
}

class AadharEntryPage extends StatefulWidget {
  @override
  _AadharEntryPageState createState() => _AadharEntryPageState();
}

class _AadharEntryPageState extends State<AadharEntryPage> {
  TextEditingController _aadharController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  bool _showOTPSection = false;
  String _caseId = "";
  int _diaryNumber = 0;

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Successful'),
          content: Text('You have successfully registered!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _generateCaseId() {
    Random random = Random();
    int generatedNumber = random.nextInt(900000) + 100000;
    setState(() {
      _caseId = generatedNumber.toString();
    });
  }

  void _generateDiaryNumber() {
    Random random = Random();
    _diaryNumber = random.nextInt(900) + 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  efiling(),
                ),
              );
            },
          ),
        title: Text('Aadhar Number Entry'),
        backgroundColor:
            const Color.fromARGB(255, 58, 57, 57),
          centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _aadharController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Aadhar Number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 58, 57, 57),
                  ),
              onPressed: () {
                String enteredAadhar = _aadharController.text;

                if (enteredAadhar.length == 12) {
                  print('Entered Aadhar Number: $enteredAadhar');
                  setState(() {
                    _showOTPSection = true;
                  });
                } else {
                  print('Invalid Aadhar Number. Please enter 12 digits.');
                }
              },
              child: Text('Submit'),
            ),
            if (_showOTPSection) ...[
              SizedBox(height: 20),
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter OTP',
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 58, 57, 57),
                  ),
                onPressed: () {
                  String enteredOTP = _otpController.text;
                  print('Entered OTP: $enteredOTP');
                  _showSuccessDialog();
                  _generateCaseId();
                  _generateDiaryNumber();
                },
                child: Text('Verify'),
              ),
              if (_caseId.isNotEmpty) ...[
                SizedBox(height: 20),
                Text(
                  'Case ID: $_caseId',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Diary Number: $_diaryNumber',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}