import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/user_page.dart';

class ShowUsers extends StatelessWidget {
   ShowUsers({ Key? key, }) : super(key: key);
final Stream<QuerySnapshot> users = 
FirebaseFirestore.instance.collection('users')
      .snapshots();
       TextEditingController controllerName = TextEditingController();
  TextEditingController controllerAge = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        title:  Text('Showing all user'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey[200],
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: 
                StreamBuilder<QuerySnapshot> 
                  (stream: users,
                  builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,) {
                      if (snapshot.hasError){
                        return Text('Something went wrong');
                      }

                      if  (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Data is Loading');
                      }
                      final data = snapshot.requireData;
                      return ListView.builder(
                        itemCount:  data.size,
                        itemBuilder: (comtext, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.indigo,
                              radius: 16,
                              child: Text(data.docs[index]['name'][0], 
                              style: TextStyle(color: Colors.white),),
                            ),
                            // title: Text('My name is ${snapshot.data?.docs[index]['name']}'),
                            title: Text('My name is ${data.docs[index]['name']}'),
                            subtitle: Text('My age is ${data.docs[index]['age']}'),
                            trailing: Wrap(
                              spacing: 2,
                              children: [
                               IconButton(
                                onPressed: () {
                                  var docId = data.docs[index]['id'];
                                   FirebaseFirestore.instance.collection('users').doc(docId).update({
                                    "name": 'Inception',
                                    "age": '50'
                                  }); 
                                  // // print(data.docs[index]['id']);   
                               }, icon: Icon(Icons.edit, color:  Colors.indigo,)),
                               IconButton(onPressed: () {  
                                final docUser = FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(data.docs[index]['id']);

                                    docUser.delete();
                                //  final docId = data.docs[index]['id'];
                                //    FirebaseFirestore.instance.collection('users').doc();
                                //    docId.delete();                            
                               }, icon: Icon(Icons.delete, color:  Colors.red,))

                              ] 
                            ),
              
                          );
                        });
                    },   
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }

  
}


