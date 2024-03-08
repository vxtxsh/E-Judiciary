import 'package:ejudiapp/erepository/rephome.dart';
import 'package:ejudiapp/home/case_status.dart';
import 'package:flutter/material.dart';

class CaseDetailsPage extends StatelessWidget {
  final List<dynamic> caseDetails;

  CaseDetailsPage({required this.caseDetails});

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
                  builder: (context) =>  cstatus(),
                ),
              );
            },
          ),
        title: Text('Case Status'),
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 58, 57, 57),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('S.No.: ${caseDetails[0]}'),
            Text('Court Type: ${caseDetails[1]}'),
            Text('Dairy No.: ${caseDetails[2]}'),
            Text('Case Filed On: ${caseDetails[3]}'),
            Text('Last Listed On: ${caseDetails[4]}'),
            Text('Registered On: ${caseDetails[5]}'),
            Text('Verified On: ${caseDetails[6]}'),
            Text('Case Status: ${caseDetails[7]}'),
            Text('Chief Justice: ${caseDetails[8]}'),
            Text('Category: ${caseDetails[9]}'),
            Text('Respondent(s): ${caseDetails[10]}'),
            Text('Petitioner(s): ${caseDetails[11]}'),
            Text('Advocate(s): ${caseDetails[12]}'),
            Text('Advocate(s) Code: ${caseDetails[13]}'),
            Text('Case may be listed on: ${caseDetails[14]}'),
          ],
        ),
      ),
    );
  }
}
