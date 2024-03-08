
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 58, 57, 57),
          title: Text('Settings'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(
                  Icons.language,
                  color: Colors.grey[600],
                  size: 24,
                ),
                title: Text(
                  'Language',
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
                  // Handle Language tap
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.notifications,
                  color: Colors.grey[600],
                  size: 24,
                ),
                title: Text(
                  'Notification Settings',
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
                  // Handle Notification Settings tap
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Colors.grey[600],
                  size: 24,
                ),
                title: Text(
                  'Change Password',
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
                  // Handle Change Password tap
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.grey[600],
                  size: 24,
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[600],
                  size: 18,
                ),
                onTap: ()async {
                  await FirebaseAuth.instance.signOut();
                  /* IconButton(
        onPressed: ()async{
         await FirebaseAuth.instance.signOut();
        }, 
        icon: Icon(Icons.login)
         ) */
                  // Handle Log Out tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



