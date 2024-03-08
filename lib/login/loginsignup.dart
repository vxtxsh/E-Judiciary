import 'package:ejudiapp/login/loginpage.dart';
import 'package:ejudiapp/login/signup.dart';
import 'package:flutter/material.dart';


class loginsignup extends StatefulWidget {
  const loginsignup({super.key});

  @override
  State<loginsignup> createState() => _loginsignupState();
}

class _loginsignupState extends State<loginsignup> {

  bool islogin = true;

  void togglepage() {
    setState(() {
      islogin = !islogin;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    if (islogin) {
      return login(onPressed: togglepage,);
    }else{
      return signup(
        onPressed: togglepage,
      );

    }
    
  }
}