import 'package:ejudiapp/drawer/settings.dart';
import 'package:ejudiapp/erepository/pages/hcourt.dart';
import 'package:ejudiapp/erepository/pages/home.dart';
import 'package:ejudiapp/erepository/rephome.dart';
import 'package:ejudiapp/home/home.dart';
import 'package:flutter/material.dart';

//import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//import 'main.dart';
//import 'menu.dart';

class jahc extends StatelessWidget {
  const jahc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
          leading:
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const hcourt(),
                ),
              );
            },
          ),
        
          title: Text('Jammu And Kashmir High Court',style: TextStyle(color: Colors.white),),
          backgroundColor:
            const Color.fromARGB(255, 58, 57, 57),
          centerTitle: true,
          
        ),
      body: WebView(
        initialUrl:
            'https://hcservices.ecourts.gov.in/ecourtindiaHC/cases/s_kiosk_order.php?state_cd=12&dist_cd=1&court_code=1&stateNm=Jammu%20and%20Kashmir',
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
        onWebViewCreated: (WebViewController webViewController) {
          // You can use the webViewController to interact with the WebView
        },
        onPageStarted: (String url) {
          // Handle page loading started
        },
        onPageFinished: (String url) {
          // Handle page loading finished
        },
        onWebResourceError: (WebResourceError error) {
          // Handle web resource errors
          print("Web resource error: $error");
        },
      ),
    );
  }
}
