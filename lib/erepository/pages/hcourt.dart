import 'package:ejudiapp/efiling/efiling1home.dart';
import 'package:ejudiapp/drawer/profile.dart';
import 'package:ejudiapp/erepository/pages/highCourt/Hp.dart';
import 'package:ejudiapp/erepository/pages/highCourt/allahabad.dart';
import 'package:ejudiapp/erepository/pages/highCourt/andhra.dart';
import 'package:ejudiapp/erepository/pages/highCourt/bombay.dart';
import 'package:ejudiapp/erepository/pages/highCourt/calcutta.dart';
import 'package:ejudiapp/erepository/pages/highCourt/chhattisgarh.dart';
import 'package:ejudiapp/erepository/pages/highCourt/delhi.dart';
import 'package:ejudiapp/erepository/pages/highCourt/gauhati.dart';
import 'package:ejudiapp/erepository/pages/highCourt/guj.dart';
import 'package:ejudiapp/erepository/pages/highCourt/jamm.dart';
import 'package:ejudiapp/erepository/pages/highCourt/jharkhand.dart';
import 'package:ejudiapp/erepository/pages/highCourt/karnataka.dart';
import 'package:ejudiapp/erepository/pages/highCourt/kerala.dart';
import 'package:ejudiapp/erepository/pages/highCourt/madras.dart';
import 'package:ejudiapp/erepository/pages/highCourt/manipur.dart';
import 'package:ejudiapp/erepository/pages/highCourt/meghalaya.dart';
import 'package:ejudiapp/erepository/pages/highCourt/mp.dart';
import 'package:ejudiapp/erepository/pages/highCourt/orissa.dart';
import 'package:ejudiapp/erepository/pages/highCourt/patna.dart';
import 'package:ejudiapp/erepository/pages/highCourt/punjab.dart';
import 'package:ejudiapp/erepository/pages/highCourt/rajastan.dart';
import 'package:ejudiapp/erepository/pages/highCourt/sikkim.dart';
import 'package:ejudiapp/erepository/pages/highCourt/telangana.dart';
import 'package:ejudiapp/erepository/pages/highCourt/tripura.dart';
import 'package:ejudiapp/erepository/pages/highCourt/uttar.dart';
import 'package:ejudiapp/erepository/pages/home.dart';
import 'package:ejudiapp/erepository/rep.dart';
import 'package:ejudiapp/login/loginsignup.dart';
import 'package:ejudiapp/drawer/settings.dart';
import 'package:ejudiapp/home/feature_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:ejudiapp/efilingpetitioner1.dart';
import 'package:ejudiapp/efiling/efilinghome.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const hcourt());
}

class hcourt extends StatelessWidget {
  const hcourt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hscreen(),
    );
  }
}

class hscreen extends StatefulWidget {
  const hscreen({Key? key}) : super(key: key);

  @override
  State<hscreen> createState() => _hScreenState();
}

class _hScreenState extends State<hscreen> {
  
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List myFeatures = [
    // [ featureName, iconPath  ]
    ["Allahabad "],
    [ "Andhra Pradesh "],
    [ "Bombay "],
    [ "Calcutta "],
    [ "Chhattisgarh "],
    [ "Delhi "],
    [ "Gauhati "],
    [ "Gujarat "],
    [ "Himachal Pradesh "],
    [ "Jammu & Kashmir and Ladakh "],
    [ "Jharkhand "],
    [ "Karnataka "],
    [ "Kerala "],
    [ "Madhya Pradesh "],
    [ "Madras "],
    [ "Manipur "],
    [ "Meghalaya "],
    [ "Orissa "],
    [ "Patna "],
    [ "Punjab and Haryana "],
    [ "Rajasthan "],
    [ "Sikkim "],
    [ "Telangana "],
    [ "Tripura "],
    ["Uttarakhand "],
      
    
  ];


@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("E-Repository"),
        backgroundColor:
            const Color.fromARGB(255, 58, 57, 57), //const Color.fromARGB(214, 120, 37, 227),
        
          leading:
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Rhome(),
                ),
              );
            },
          ),
        
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            const SizedBox(height: 10),
            Center(
              child: Text(
                      'High Courts',
                      style: GoogleFonts.bebasNeue(fontSize: 55),
                    ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 107, 105, 105),
              ),
            ),
            /*Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
              ),
            ),*/

            // welcome home
            /*Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            
            ),*/
            

            // grid
            Expanded(
              child: GridView.builder(
                itemCount: 25,
                //physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                ),
                itemBuilder: (context, index) {
                  return hbox(
                    featureName: myFeatures[index][0],
                    
                    
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


class hbox extends StatelessWidget {
  final String featureName;
  
  

  hbox({
    Key? key,
    required this.featureName,
    
    
     // Include onChanged as an optional parameter
  }) : super(key: key);

  void _navigateToDevicePage(BuildContext context) {
    // Define a map to associate device names with their respective page classes
    final devicePageRoutes = {
      "Allahabad ": Ahc(),
      "Andhra Pradesh ": Aphc(),
      "Bombay ": Bhc(),
      "Calcutta ": Cahc(),
      "Chhattisgarh ": Chhc(),
      "Delhi ": Dhc(),
      "Gauhati ": Gahc(),
      "Gujarat ": Guhc(),
      "Himachal Pradesh ": Hphc(),
      "Jammu & Kashmir and Ladakh ": jahc(),
      "Jharkhand ": jhhc(),
      "Karnataka ": kahc(),
      "Kerala ": kehc(),
      "Madhya Pradesh ": mphc(),
      "Madras ": mdhc(),
      "Manipur ": manhc(),
      "Meghalaya ": mehc(),
      "Orissa ": ohc(),
      "Patna ": pahc(),
      "Punjab and Haryana ": puhc(),
      "Rajasthan ": rahc(),
      "Sikkim ": sihc(),
      "Telangana ": Thc(),
      "Tripura ": trihc(),
      "Uttarakhand ": utthc(),
      
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
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color:  Colors.grey[900],
            boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5.0, -5.0),
                  blurRadius: 3,
                  spreadRadius: 0.0,
                ),
                
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(10.0, 10.0),
                  blurRadius: 18,
                  spreadRadius: 0.0,
                ),
              ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                
                  SizedBox(
                          height: 12.0,
                        ),
                  
                  
                  Row(
                    children: [
                      Expanded(
                        
                         child: Center(
                           child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              
                              featureName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                                                 ),
                         ),
                      ),
                      
                      
                    ],
                  ),
                  
                  Expanded(
                        
                         child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text( "High Court",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                ],

            ),
                ),
          ),
              ),
        ),),);
  }
}


