import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:plant_app/constants.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Post').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Container(
          child: Text(
            "Post",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: Container(
        child: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                print('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                print("Loading");
              }
              print(snapshot.hasData);
              print(snapshot.data);
              print(snapshot.data?.docs[1]['title']);

              List data1 = snapshot.data!.docs;

              print(data1[1]['title']);

              return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(data1.length, (index) {
                    return Container(
                      child: Text(data1[index]['title']),
                    );
                    // return Container(
                    //   color: Colors.green,
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width / 2,
                    //     child: Row(children: [
                    //       Text(data1[index]['title']),
                    //       Text(data1[index]['email']),
                    //     ]),
                    //   ),
                    // );
                  }));

              // return Align(
              //   alignment: Alignment.centerLeft,
              //   child: Center(
              //     child: Container(
              //       height: 200,
              //       width: 200,
              //       color: Colors.black,
              //     ),
              //   ),
              // );
              // return ListView(
              //   children: <Widget>[
              //     Container(
              //         height: 100, color: Colors.black, child: Text('abc')),
              //     Container(
              //         height: 100, color: Colors.green, child: Text('abc')),
              //     Container(
              //         height: 100, color: Colors.grey, child: Text('abc')),
              //   ],
              // );
              // return ListView(
              //   children:
              //       snapshot.data!.docs.map((DocumentSnapshot document) {
              //     Map<String, dynamic> data =
              //         document.data()! as Map<String, dynamic>;

              //     return ListTile(
              //       title: Text(data['title']),
              //       subtitle: Text(data["descriptio"]),
              //     );
              //   }).toList(),
              // );
            },
          ),
        ),
      ),
    );
  }
}
