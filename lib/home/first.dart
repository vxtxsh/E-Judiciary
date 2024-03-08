
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejudiapp/drawer/constitution.dart';
import 'package:ejudiapp/drawer/notif.dart';
import 'package:ejudiapp/drawer/profile.dart';
import 'package:ejudiapp/drawer/settings.dart';
import 'package:ejudiapp/erepository/pages/all_news.dart';
import 'package:ejudiapp/login/loginsignup.dart';
import 'package:ejudiapp/home/feature_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const First());
}

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeatureScreen(),
    );
  }
}

class FeatureScreen extends StatefulWidget {
  const FeatureScreen({Key? key}) : super(key: key);

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List myFeatures = [
    [" E-Filing", "assets/efil.png"],
    ["Case Status", "assets/cstatus.png"],
    ["Calendar", "assets/calender.png"],
    ["E-Repository", "assets/repository.png"],
  ];

  String? _username;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    setState(() {
      _username = snapshot['username'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                border: Border.symmetric(),
                color: Color.fromARGB(255, 183, 179, 179),
              ),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                radius: 150,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
              ),
            ),
            ListBody(
              children: [
                Padding(padding: EdgeInsets.only(left: 100, top: 10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Home',
                        style: TextStyle(
                            color: Color.fromARGB(255, 43, 45, 47), fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => First()));
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Profile',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 48, 50, 51), fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                    ),
                    ListTile(
                      title: Text(
                        'The Constitution',
                        style: TextStyle(
                            color: Color.fromARGB(255, 47, 48, 48), fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => constitution()));
                      },
                    ),
                    ListTile(
                      title: Text(
                        'News',
                        style: TextStyle(
                            color: Color.fromARGB(255, 47, 48, 48), fontSize: 18),
                      ),
                      onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AllNews(news: "Breaking")));
                                },
                    ),
                    ListTile(
                      title: Text(
                        'Settings',
                        style: TextStyle(
                            color: Color.fromARGB(255, 47, 48, 48), fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SettingsPage()));
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("E-Judi"),
        backgroundColor: const Color.fromARGB(255, 58, 57, 57),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => notif(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome ,",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _username ?? '',
                    style: GoogleFonts.bebasNeue(fontSize: 67),
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
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return FeatureBox(
                    featureName: myFeatures[index][0],
                    iconPath: myFeatures[index][1],
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
