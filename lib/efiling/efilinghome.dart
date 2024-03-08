import 'package:ejudiapp/efiling/actdetails.dart';
import 'package:ejudiapp/efiling/payment.dart';
import 'package:ejudiapp/efiling/respondent1.dart';
import 'package:ejudiapp/efiling/sixfeat.dart';
import 'package:ejudiapp/efiling/uploaddocuments.dart';
import 'package:flutter/material.dart';
import 'package:ejudiapp/home/first.dart';
import 'efilingpetitioner1.dart';

//import 'package:test/main.dart';
//class First

class efiling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Filing'),
        centerTitle: true,
        backgroundColor:
            const Color.fromARGB(255, 58, 57, 57),
            leading:
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  First(),
                ),
              );
            },
          ),
        
      ),
      //drawer: const AppDrawer(),
      body: Center(
        child: Stack(
          children: <Widget>[
            
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const petitioner()),
                              );
                            }, //add code for redirect here{}
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color:  Color.fromARGB(255, 197, 197, 197),
                                        boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(255, 239, 238, 238),
                                              offset: Offset(-5.0, -5.0),
                                              blurRadius: 5,
                                              spreadRadius: 0.0,
                                            ),
                                            
                                            BoxShadow(
                                              color: Color.fromARGB(255, 160, 159, 159),
                                              offset: Offset(15.0, 15.0),
                                              blurRadius: 15,
                                              spreadRadius: 0.0,
                                            ),
                                          ],
                                      ),
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.co_present_outlined,
                                      size: 24.0,
                                    ),
                                    SizedBox(width: double.infinity, height: 8.0),
                                    Text(
                                      'Petitioner',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // ONTO THE NEXT COLOR WIDGET
                        const SizedBox(height: 9),

                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const uploaddocuments() //upload documents
                                    ),
                              );
                              //resp
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24),
                                          color:  Color.fromARGB(255, 197, 197, 197),
                                          boxShadow: [
                                              BoxShadow(
                                              color: Color.fromARGB(255, 239, 238, 238),
                                              offset: Offset(-5.0, -5.0),
                                              blurRadius: 5,
                                              spreadRadius: 0.0,
                                            ),
                                            
                                            BoxShadow(
                                              color: Color.fromARGB(255, 160, 159, 159),
                                              offset: Offset(15.0, 15.0),
                                              blurRadius: 15,
                                              spreadRadius: 0.0,
                                            ),
                                            ],
                                        ),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.attach_file_outlined,
                                      size: 24.0,
                                    ),
                                    SizedBox(width: double.infinity, height: 8.0),
                                    Text(
                                      'Upload Documents',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Since we want a third box, we'll put it here under row itself.
                        const SizedBox(height: 9),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const actdetails(),
                                  //HERE
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(24),
                                            color:  Color.fromARGB(255, 197, 197, 197),
                                            boxShadow: [
                                                BoxShadow(
                                              color: Color.fromARGB(255, 239, 238, 238),
                                              offset: Offset(-5.0, -5.0),
                                              blurRadius: 5,
                                              spreadRadius: 0.0,
                                            ),
                                            
                                            BoxShadow(
                                              color: Color.fromARGB(255, 160, 159, 159),
                                              offset: Offset(15.0, 15.0),
                                              blurRadius: 15,
                                              spreadRadius: 0.0,
                                            ),
                                              ],
                                          ),
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.auto_stories_outlined,
                                      size: 24.0,
                                    ),
                                    SizedBox(width: double.infinity, height: 8.0),
                                    Text(
                                      'Act Details',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // MOVING ONTO COLUMN CHILD
                  const SizedBox(height: 9),

                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const respondent1(), //respondent
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(24),
                                              color:  Color.fromARGB(255, 197, 197, 197),
                                              boxShadow: [
                                                  BoxShadow(
                                              color: Color.fromARGB(255, 239, 238, 238),
                                              offset: Offset(-5.0, -5.0),
                                              blurRadius: 5,
                                              spreadRadius: 0.0,
                                            ),
                                            
                                            BoxShadow(
                                              color: Color.fromARGB(255, 160, 159, 159),
                                              offset: Offset(15.0, 15.0),
                                              blurRadius: 15,
                                              spreadRadius: 0.0,
                                            ),
                                                ],
                                            ),
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.badge_outlined,
                                      size: 24.0,
                                    ),
                                    SizedBox(width: double.infinity, height: 8.0),
                                    Text(
                                      'Respondent',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        //SEC LAST LIL BOXXX
                        const SizedBox(height: 9),

                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const payment(), //fee
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(24),
                                              color:  Color.fromARGB(255, 197, 197, 197),
                                              boxShadow: [
                                                  BoxShadow(
                                              color: Color.fromARGB(255, 239, 238, 238),
                                              offset: Offset(-5.0, -5.0),
                                              blurRadius: 5,
                                              spreadRadius: 0.0,
                                            ),
                                            
                                            BoxShadow(
                                              color: Color.fromARGB(255, 160, 159, 159),
                                              offset: Offset(15.0, 15.0),
                                              blurRadius: 15,
                                              spreadRadius: 0.0,
                                            ),
                                                ],
                                            ),
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.confirmation_number_outlined,
                                      size: 24.0,
                                    ),
                                    SizedBox(width: double.infinity, height: 8.0),
                                    Text(
                                      'E-Court Fee',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        //put in the last box down here
                        const SizedBox(height: 9),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                       sixfea(), //fee
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(24),
                                              color:  Color.fromARGB(255, 197, 197, 197),
                                              boxShadow: [
                                                  BoxShadow(
                                              color: Color.fromARGB(255, 239, 238, 238),
                                              offset: Offset(-5.0, -5.0),
                                              blurRadius: 5,
                                              spreadRadius: 0.0,
                                            ),
                                            
                                            BoxShadow(
                                              color: Color.fromARGB(255, 160, 159, 159),
                                              offset: Offset(15.0, 15.0),
                                              blurRadius: 15,
                                              spreadRadius: 0.0,
                                            ),
                                                ],
                                            ),
                                child:  Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.balance,
                                      size: 24.0,
                                    ),
                                    SizedBox(width: double.infinity, height: 8.0),
                                    Text(
                                      'UID',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}