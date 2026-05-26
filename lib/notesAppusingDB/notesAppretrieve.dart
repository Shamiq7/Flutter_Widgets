// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_widgets/functions/databaseFunction.dart';

// class Notesappretrieve extends StatefulWidget {
//   const Notesappretrieve({super.key});

//   @override
//   State<Notesappretrieve> createState() => _NotesappretrieveState();
// }

// class _NotesappretrieveState extends State<Notesappretrieve> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Edit Notes'), centerTitle: true),
//       body: SafeArea(
//         child: Container(
//           margin: EdgeInsets.all(20),
//           child: StreamBuilder(
//             stream: FirebaseFirestore.instance.collection('notes').snapshots(),
//             builder: (context, SnapshotID) {
//               if (SnapshotID.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               } else {
//                 final item = SnapshotID.data!.docs;
//                 return Card(
//                   child: ListView.builder(
//                     itemCount: item.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         elevation: 10,
//                         child: ListTile(
//                           leading: IconButton(
//                             onPressed: () {
//                               _myDialogue(context, item[index].id);
//                             },
//                             icon: Icon(Icons.edit),
//                           ),
//                           title: Text(item[index]['Note Content']),
//                           trailing: TextButton(
//                             onPressed: () {
//                               delete1('notes', item[index].id);
//                             },
//                             child: Icon(Icons.delete),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// Future<void> _myDialogue1(BuildContext context, String docID) async {
//   TextEditingController updateController = TextEditingController();
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text('Update Note'),
//         content: TextField(
//           controller: updateController,
//           decoration: InputDecoration(hintText: 'Update Your Note'),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               update1('notes', docID, 'Note Content', updateController.text);
//             },
//             child: Text('Update'),
//           ),
//         ],
//       );
//     },
//   );
// }

