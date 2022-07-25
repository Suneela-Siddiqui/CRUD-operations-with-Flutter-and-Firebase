import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateDeleteData extends StatefulWidget {
  const UpdateDeleteData({ Key? key }) : super(key: key);

  @override
  State<UpdateDeleteData> createState() => _UpdateDeleteDataState();
}

class _UpdateDeleteDataState extends State<UpdateDeleteData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title:  Text('Update Delete user'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

                  ElevatedButton(
                            onPressed: () {

                              final docUser = FirebaseFirestore.instance
                                    .collection('users')
                                    .doc('my-id');

                                    docUser.update({'name': 'ABC',});
                          
                            },
                            child: const Text(
                              'Update data',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.indigo,
                                minimumSize: const Size(500, 40))),
                 ElevatedButton(
                            onPressed: () {

                              final docUser = FirebaseFirestore.instance
                                    .collection('users')
                                    .doc('my-id');

                                    docUser.delete();
                          
                            },
                            child: const Text(
                              'Delete data',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.indigo,
                                minimumSize: const Size(500, 40))),
        ]),
      ),
      
    );
  }
}