import 'package:ejudiapp/efiling/efiling1home.dart';
import 'package:ejudiapp/drawer/profile.dart';
import 'package:ejudiapp/erepository/pages/miscellaneous.dart';
import 'package:ejudiapp/login/loginsignup.dart';
import 'package:ejudiapp/drawer/settings.dart';
import 'package:ejudiapp/home/feature_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:ejudiapp/efilingpetitioner1.dart';
import 'package:ejudiapp/efiling/efilinghome.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const First());
}

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepScreen(),
    );
  }
}

class RepScreen extends StatefulWidget {
  const RepScreen({Key? key}) : super(key: key);

  @override
  State<RepScreen> createState() => _RepScreenState();
}

class _RepScreenState extends State<RepScreen> {
  
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List myRep = [
    // [ featureName, iconPath  ]
    ["Supreme-Court", "assets/efil.png"],
    ["High-Court", "assets/cstatus.png"],
  ];


@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("E-Judi"),
        backgroundColor:
            const Color.fromARGB(255, 58, 57, 57), //const Color.fromARGB(214, 120, 37, 227),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
              ),
            ),

            const SizedBox(height: 20),

            // welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Text(
                    'E-REPOSITORY',
                    style: GoogleFonts.bebasNeue(fontSize: 72),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                thickness: 1,
                color: Color.fromARGB(255, 107, 105, 105),
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            
            ),
            const SizedBox(height: 10),

            // grid
            Expanded(
              child: GridView.builder(
                itemCount: 2,
                //physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                ),
                itemBuilder: (context, index) {
                  return RepBox(
                    featureName: myRep[index][0],
                    
                    
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

class RepBox extends StatelessWidget {
  final String featureName;
  
  

  RepBox({
    Key? key,
    required this.featureName,
    
    
     // Include onChanged as an optional parameter
  }) : super(key: key);

  void _navigateToDevicePage(BuildContext context) {
    // Define a map to associate device names with their respective page classes
    final repPageRoutes = {
      " Supreme-Court": miscellaneous(),
      "High-Court": efiling1home(),
      
    };

    // Get the corresponding page based on the device name
    final RepPage = repPageRoutes[featureName];

    if (RepPage != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => RepPage));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToDevicePage(context),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color:  Colors.grey[900],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                      Expanded(
                         child: Padding(
                          padding: const EdgeInsets.all( 10.0),
                          child: Center(
                            child: Text(
                              
                              featureName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Colors.white,
                              ),
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

     //background: #212121;


  