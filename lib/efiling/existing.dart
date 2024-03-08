import 'package:flutter/material.dart';
class existing extends StatelessWidget {
  const existing({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Filing'),
        backgroundColor: Colors.deepPurple,)
  ,
  body: Container(
    child: Column(
      children: [
        Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
            child:TextFormField(
              decoration: InputDecoration(
                labelText: 'Select-Date',
                hintText: 'Enter Date',
                
                border: OutlineInputBorder(),
              ),
            ),
              ),

        ),
          Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
            child:TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter-Verdict',
                hintText: 'Enter Verdict',
                
                border: OutlineInputBorder(),
              ),
            ),
              ),
              
        ),
        Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child:ElevatedButton(onPressed: null, child: Text('Save'),
                style: ElevatedButton.styleFrom(
           
         foregroundColor: Colors.deepPurple
          ),
                ) 
              ),
                   ),
              

     
      ],
    ),
  ),
    );
  }
}