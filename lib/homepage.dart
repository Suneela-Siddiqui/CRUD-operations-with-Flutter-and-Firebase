import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: TextField(
          controller: controller,
        ),
        actions: [
          IconButton(onPressed: () {
            final name = controller.text;

            createUser(name: name);
          },
           icon: Icon(Icons.add)),
        ],
      ),
      
      
    );

    

    
  }

Stream <List<User>> readUsers() => FirebaseFirestore.instance.collection('users')
.snapshots()
.map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future createUser({required String name}) async{
    // Reference to document


    final docUser = FirebaseFirestore.instance.collection('users').doc();
    
        final user = User(
      id: docUser.id,
      name: name, 
      age: 21,
      );
       final json = user.toJson();
        await docUser.set(json);

  //   final json = {
  //     'name': name,
  //     'age': 21,
      
  //   };

  //       // final docUser = FirebaseFirestore.instance.collection('users').doc();
  //   final json = user.toJson();
  // await docUser.set(json);

  //   final user = User(
  //     id: docUser.id,
  //     name: name, 
  //     age: 21,
  //     );

    // // Create document and write data to Firebase
  

  }



}
class User {
  String id;
  final String name;
  final int age;
 
 

  User({
    this.id = '',
    required this.name,
    required this.age,
   });

    Map<String, dynamic> toJson() =>  {
      'id': id,
      'name': name,
      'age': age,
      
      
    };

    static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      age: json['age']);
}