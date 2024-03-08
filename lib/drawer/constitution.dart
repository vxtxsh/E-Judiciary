import 'package:ejudiapp/home/first.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class constitution extends StatefulWidget {
  const constitution({super.key});

  @override
  State<constitution> createState() => _constitutionState();
}

class _constitutionState extends State<constitution> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Constitution',
      home: Scaffold(
        appBar: AppBar(
          leading:
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const First(),
                ),
              );
            },
          ),
          title: const Text('The Constitution'),
          backgroundColor: Color.fromARGB(0, 28, 28, 28),
          centerTitle: true,
        ),
        body: SfPdfViewer.asset("assets/constitution.pdf")
        ),
      );
    
  }
}