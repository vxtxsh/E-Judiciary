import 'package:ejudiapp/home/first.dart';
import 'package:ejudiapp/login/loginpage.dart';
import "package:ejudiapp/login/loginsignup.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";


class authpage extends StatelessWidget {
  const authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            if (snapshot.hasData) {
              return First();
            } else {
              return loginsignup();
            }
          }

        },),
         );
  }
}