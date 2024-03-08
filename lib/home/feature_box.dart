
import 'package:ejudiapp/efiling/efiling1home.dart';
import 'package:ejudiapp/efiling/efilinghome.dart';
import 'package:ejudiapp/erepository/rep.dart';
import 'package:ejudiapp/home/calendar.dart';
import 'package:ejudiapp/home/case_status.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class FeatureBox extends StatelessWidget {
  final String featureName;
  final String iconPath;
  

  FeatureBox({
    Key? key,
    required this.featureName,
    required this.iconPath,
    
     // Include onChanged as an optional parameter
  }) : super(key: key);

  void _navigateToDevicePage(BuildContext context) {
    // Define a map to associate device names with their respective page classes
    final devicePageRoutes = {
      " E-Filing": efiling(),
      "Case Status": cstatus(),
      "Calendar": HomeCalendarPage(),
      "E-Repository": rep(),
    };

    // Get the corresponding page based on the device name
    final devicePage = devicePageRoutes[featureName];

    if (devicePage != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => devicePage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToDevicePage(context),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color:  Colors.grey[900],
            boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 239, 238, 238),
                  offset: Offset(-5.0, -5.0),
                  blurRadius: 5,
                  spreadRadius: 0.0,
                ),
                
                BoxShadow(
                  color: Color.fromARGB(255, 105, 104, 104),
                  offset: Offset(21.0, 21.0),
                  blurRadius: 17,
                  spreadRadius: 0.0,
                ),
              ],
          ),
          //Nyx aka Vit
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                          height: 3.0,
                        ),
                  // icon
                  Image.asset(
                    iconPath,
                    height: 65,
                    color:  Color.fromARGB(255, 229, 228, 228),
                  ),
                  SizedBox(
                          height: 3.0,
                        ),
                  
                  Row(
                    children: [
                      Expanded(
                        
                         child: Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: Text(
                            
                            featureName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color:  Color.fromARGB(255, 229, 229, 229),
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                  SizedBox(
                          height: 3.0,
                        ),
                ],
            ),
                ),
          ),
              ),
        ),),);
  }
}