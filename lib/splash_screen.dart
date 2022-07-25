import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/user_page.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds:5), () async {
  Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const UserPage()),
        );
    });
  
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: const BoxDecoration(
             color: Colors.indigo
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(

                      decoration: 
                      BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                     
                      height: 150,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child:
                         Image.network(
                        'https://seeklogo.com/images/F/flutter-logo-5086DD11C5-seeklogo.com.png'),
                      ),
                    ),

                  ],
                ),
              ),
            )));
  }
}