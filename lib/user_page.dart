import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/homepage.dart';
import 'package:flutter_firebase_crud/show_users.dart';
import 'package:flutter_firebase_crud/update_delete.dart';
import 'package:flutter_firebase_crud/user_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({ Key? key }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
   TextEditingController controllerName = TextEditingController();
  TextEditingController controllerAge = TextEditingController();
  // TextEditingController controllerDesignation = TextEditingController();
 void clearText() {
  controllerName.clear();
  controllerAge.clear();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add user'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: const [
                         Padding(
                           padding: EdgeInsets.all(8.0),
                           child: CircleAvatar(
                    maxRadius: 20,
                    minRadius: 20,
                    backgroundColor: Colors.white,
                    child: Text('S', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                         ),

                  SizedBox(
                    width: 4,
                  ),
                
                    Align(
                      alignment: Alignment.center,
                      child: Text('Suneela Siddiqui', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                height: 150,
                color: Colors.indigo,
              ),
              ListTile(
                onTap: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  ShowUsers()),
                           );
                },
                leading: Icon(Icons.switch_account_rounded, color: Colors.indigo,),
                title: Text('Show all Users')),
              
              
                const ListTile(
                leading: Icon(Icons.menu_book_outlined, color: Colors.indigo,),
                title: Text('Vouchers')),
                const ListTile(
                leading: Icon(Icons.notification_add, color: Colors.indigo,),
                title: Text('Notifications')),
                const ListTile(
                leading: Icon(Icons.settings, color: Colors.indigo,),
                title: Text('Settings')),
                  const ListTile(
                leading: Icon(Icons.logout,color: Colors.indigo,),
                title: Text('Logout')),
                const ListTile(
                leading: Icon(Icons.menu_book_outlined, color: Colors.indigo,),
                title: Text('Challenges and Rewards')),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[

         Container
         (width: MediaQuery.of(context).size.width,
         height: 200,
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Image.network('https://camo.githubusercontent.com/267d588d1d8d786f463d83bd2a449a664f90c9882c6156d3421a3ca8ee3b5f62/687474703a2f2f626c6f672e657870657274736f6674776172657465616d2e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031392f30312f666c757474657231322e706e67'),
         ),
         ),
          TextField(
          controller: controllerName,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.indigo)
          ),
            hintText: 'Areeba Akhtar' ,
          label: Text('Enter Name'),

        border: OutlineInputBorder()
       )
      ),
        const SizedBox(height: 24),
          TextField(
        keyboardType: TextInputType.number,
          controller: controllerAge,
           decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.indigo)
          ),

            hintText: '21',
           label: Text('Enter Age'),
           
        border: OutlineInputBorder()
        
      )
     ),
          const SizedBox(height: 24),
                ElevatedButton(
                          onPressed: () {
                            final user = User(
                              name: controllerName.text,
                               age: int.parse(controllerAge.text));

                               createUser(user);

                               clearText();

                              //  Navigator.pop(context);

                          },
                          child: const Text(
                            'Create User',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.indigo,
                              minimumSize: const Size(500, 40))),

                              const SizedBox(height: 24),
  
                  // ElevatedButton(
                  //         onPressed: () {
                  //          Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) =>  ShowUsers()),
                  //          );

                  //         },
                  //         child: const Text(
                  //           'Show Users',
                  //           style: TextStyle(color: Colors.white),
                  //         ),
                  //         style: ElevatedButton.styleFrom(
                  //             primary: Colors.indigo,
                  //             minimumSize: const Size(500, 40))),

                  // ElevatedButton(
                  //         onPressed: () {
                  //          Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) =>  UpdateDeleteData()),
                  //          );

                  //         },
                  //         child: const Text(
                  //           'Update and Delete Users',
                  //           style: TextStyle(color: Colors.white),
                  //         ),
                  //         style: ElevatedButton.styleFrom(
                  //             primary: Colors.indigo,
                  //             minimumSize: const Size(500, 40))),

        ],
      ),
      
    );

   
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;

    final json = user.toJson();
    await docUser.set(json);
  }
 
}