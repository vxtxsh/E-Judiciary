import 'package:ejudiapp/efiling/efilinghome.dart';
import 'package:ejudiapp/efiling/existing.dart';
import 'package:flutter/material.dart';
class efiling1home extends StatelessWidget {
  const efiling1home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Text('E-Filing'),
        backgroundColor:
            const Color.fromARGB(255, 58, 57, 57),
     ),
     body: Container(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
         InkWell(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Container(
              child: Center(child: Text('New-Case',
              style: TextStyle(fontSize: 30,color: Colors.white),)),
                   width : double.infinity,
                   height:70,
                   decoration: BoxDecoration(
                    color:
            const Color.fromARGB(255, 58, 57, 57),
                    borderRadius: BorderRadius.circular(20)
             
                   ),
                    
             ),
           ),
           onTap: () {
                          
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>efiling()//name
          ),);}
         ),
     InkWell(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Container(
              child: Center(child: Text('Existing-Case',
              style: TextStyle(fontSize: 30,color: Colors.white),)),
                   width : double.infinity,
                   height:70,
                   decoration: BoxDecoration(
                    color:
            const Color.fromARGB(255, 58, 57, 57),
                    borderRadius: BorderRadius.circular(20)
             
                   ),
                    
             ),
           ),
           onTap: () {
                          
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>existing()//name
          ),);}
         )
        ],
      ),
     ),
    );
  }
}