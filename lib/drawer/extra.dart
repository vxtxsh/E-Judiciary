import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';


class extra extends StatefulWidget {
  const extra({Key? key }) : super(key: key);
  

  @override
  State<extra> createState() => _extraState();
} 

class _extraState extends State<extra> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         
        body: Container(
          child:const WebViewPlus(
            initialUrl: 'assets/index.html',
          )
        ),
      ),
    );
  }
}