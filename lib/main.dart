import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_crud/splash_screen.dart';
import 'package:flutter_firebase_crud/user_page.dart';

  Future main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
     runApp(const MyApp());
  }
 


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen()
      // home: HomePage(),
    );
  }
}




