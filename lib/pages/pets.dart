import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/functions/databaseFunction.dart';

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
                        leading: IconButton(
                          onPressed: () {
                            delete('pets', petDocs[index].id);
                          },
                          icon: Icon(Icons.delete),
                        ),
                        title: Text(petDocs[index]['name']),

                        subtitle: Text(
                          "${petDocs[index]['Animal']} - age (${petDocs[index]['age']})",
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            _myDoilogue(context, petDocs[index].id);
                            // update('pets', petDocs[index].id, 'age', 10);
                          },
                          icon: Icon(Icons.next_plan),
                        ),
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

Future<void> _myDoilogue(BuildContext context, String docId) async {
  TextEditingController updateController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Update Age'),
        content: TextField(
          controller: updateController,
          decoration: InputDecoration(hintText: 'Enter NEw age'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              update('pets', docId, 'age', int.parse(updateController.text));
              Navigator.pop(context);
            },
            child: Text('Update'),
          ),
        ],
      );
    },
  );
}
