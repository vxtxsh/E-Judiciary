import 'package:ejudiapp/drawer/editprofile.dart';
import 'package:ejudiapp/drawer/location.dart';
import 'package:ejudiapp/home/first.dart';

import 'settings.dart';


import 'package:flutter/material.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showNotificationPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Center(
            child: Text(
              'Notification Page',
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    );
  }

  void _navigateToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
 return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
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
        
          title: Text('Profile'),
          backgroundColor:
            const Color.fromARGB(255, 58, 57, 57),
          centerTitle: true,
          
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: Stack(
                  children: [
                    ClipRRect(
                      child: Container(
                        width: double.infinity,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Color(0xFFDCD3D3),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 16),
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Color(0xFFDCD3D3),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/profile.png'),
                              fit: BoxFit.cover,
                            ),
                            
                          ),
                          child: GestureDetector(
                            onTap: () {
                              print('Profile icon tapped');
                              // Handle profile icon tap
                            },
                            /*child: Icon(
                              Icons.photo_outlined,
                              color: Colors.white,
                              size: 60,
                            ),*/
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 0),
                child: Text(
                  'User',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 4, 0, 16),
                child: Text(
                  'user@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              ListTile(
  leading: Icon(
    Icons.account_circle_outlined,
    color: Colors.grey[600],
    size: 24,
  ),
  title: Text(
    'Edit Profile',
    style: TextStyle(
      fontSize: 18,
    ),
  ),
  trailing: Icon(
    Icons.arrow_forward_ios,
    color: Colors.grey[600],
    size: 18,
  ),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage()),
    );
  },
),

ListTile(
  leading: Icon(
    Icons.settings,
    color: Colors.grey[600],
    size: 24,
  ),
  title: Text(
    'Settings',
    style: TextStyle(
      fontSize: 18,
    ),
  ),
  trailing: Icon(
    Icons.arrow_forward_ios,
    color: Colors.grey[600],
    size: 18,
  ),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  },
),


              ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.grey[600],
                  size: 24,
                ),
                title: Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[600],
                  size: 18,
                ),
                onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LocationPage()),
  );
},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Profile Page'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: Stack(
                  children: [
                    // ... Profile picture and cover
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 0),
                child: Text(
                  'User',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}