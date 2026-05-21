import 'package:cloud_firestore/cloud_firestore.dart';

create(String colecName, docName, name, animal, int age) async {
  await FirebaseFirestore.instance.collection(colecName).doc(docName).set({
    'name': name,
    'Animal': animal,
    'age': age,
  });
  print('//////////Database updated///////////////');
}

// why we use field and  var newfield as the value we want to update can be any value and of different datatype thhat is why we use var
update(String collecName, doc, field, var newField) async {
  await FirebaseFirestore.instance.collection(collecName).doc(doc).update({
    field: newField,
  });
}

delete(String collectName, doc) async {
  await FirebaseFirestore.instance.collection(collectName).doc(doc).delete();
}

// import 'package:cloud_firestore/cloud_firestore.dart';

// create(String colecName, docName,name,animal,int age) async {
//   await FirebaseFirestore.instance.collection('pets').doc('tome').set({
//     'name': 'Tome',
//     'Animal': 'Dog',
//     'age': 12,
//   });
//   print('//////////Database updated///////////////');
// }
