import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/functions/databaseFunction.dart';

class Noteappmainscreen extends StatefulWidget {
  const Noteappmainscreen({super.key});

  @override
  State<Noteappmainscreen> createState() => _NoteappmainscreenState();
}

class _NoteappmainscreenState extends State<Noteappmainscreen> {
  TextEditingController searchController = TextEditingController();
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 6, 102, 92),
            ),
            height: 400,
            width: double.infinity,

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 60, 0, 0),
                  child: Row(
                    children: [
                      Icon(Icons.pin_drop_sharp, size: 30, color: Colors.white),
                      SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          text: 'Your Location\n',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'San Antonio, TX',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 80),
                      CircleAvatar(
                        backgroundImage: AssetImage('Photos/pic8.png'),
                        radius: 25,
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage('Photos/pic4.png'),
                        radius: 25,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 370,
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchText = value.toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search, color: Colors.teal),
                      hintText: 'Search Your Note',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 1.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Your Solution, One\n',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Note Away\n',
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                TextSpan(
                                  text: 'Seemeless, Fast & Reliable\n',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Services at Your Fingertips',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    SizedBox(
                      height: 140,
                      width: 140,

                      child: Image.asset('Photos/pic9.png', fit: BoxFit.cover),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: [
                Text(
                  'Service Catagories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 140),
                Text('View All', style: TextStyle()),
                SizedBox(width: 5),
                Icon(Icons.keyboard_double_arrow_right_outlined),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 350,
            child: ElevatedButton(
              onPressed: () {
                _addNote(context);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.teal),
              child: Text('Create', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            // child: ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => Notesappretrieve(),
            //       ),
            //     );
            //   },
            //   style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            //   child: Text(
            //     'Retrieve Notes',
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('notes')
                  .snapshots(),
              builder: (context, SnapshotID) {
                if (SnapshotID.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  final item = SnapshotID.data!.docs;
                  final filterNotes = item.where((doc) {
                    final note = doc['Note Content'].toString().toLowerCase();
                    return note.contains(searchText);
                  }).toList();
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: filterNotes.length,
                    // itemCount: item.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        child: ListTile(
                          leading: IconButton(
                            onPressed: () {
                              _updateNote(
                                context,
                                // item[index].id,
                                // item[index]['Note Content'],
                                filterNotes[index].id,
                                filterNotes[index]['Note Content'],
                              );
                            },
                            icon: Icon(Icons.edit),
                          ),
                          // title: Text(item[index]['Note Content']),
                          title: Text(filterNotes[index]['Note Content']),
                          trailing: TextButton(
                            onPressed: () {
                              // delete1('notes', item[index].id);
                              _deleteNote(context, item[index].id);
                            },
                            child: Icon(Icons.delete),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _addNote(BuildContext context) {
  TextEditingController addController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Add Note'),
        content: TextField(
          controller: addController,
          decoration: InputDecoration(hintText: 'Add Your Note'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // final note = addController;
              create1(addController.text);
              print(addController.text);
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      );
    },
  );
}

Future<void> _updateNote(
  BuildContext context,
  String docID,
  String oldtext,
) async {
  TextEditingController updateController = TextEditingController(text: oldtext);
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Update Note'),
        content: TextField(
          controller: updateController,
          decoration: InputDecoration(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              update1('notes', docID, 'Note Content', updateController.text);
            },
            child: Text('Update'),
          ),
        ],
      );
    },
  );
}

Future<void> _deleteNote(BuildContext context, String Id) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Are You Sure You Want To Delete the note?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              delete1('notes', Id);
            },
            child: Text('Delete'),
          ),
        ],
      );
    },
  );
}
