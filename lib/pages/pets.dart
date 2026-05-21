import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Pets extends StatefulWidget {
  const Pets({super.key});

  @override
  State<Pets> createState() => _PetsState();
}

class _PetsState extends State<Pets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Retrieve data pets'), centerTitle: true),
      body: Container(
        margin: EdgeInsets.all(20),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('pets').snapshots(),
          builder: (context, petsSnapshot) {
            if (petsSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              final petDocs = petsSnapshot.data!.docs;
              return Card(
                child: ListView.builder(
                  itemCount: petDocs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 20,
                      child: ListTile(
                        title: Text(petDocs[index]['name']),
                        
                        subtitle: Text(petDocs[index]['Animal']),
                      ),
                    );
                  },
                  
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
