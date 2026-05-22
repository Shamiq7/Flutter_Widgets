import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/functions/databaseFunction.dart';
import 'package:flutter_widgets/Database/pets.dart';

class Databaseui extends StatefulWidget {
  const Databaseui({super.key});

  @override
  State<Databaseui> createState() => _DatabaseuiState();
}

class _DatabaseuiState extends State<Databaseui> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database UI'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.leave_bags_at_home_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: controller1,
                      decoration: InputDecoration(
                        hintText: 'Write animal type',
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
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: controller2,
                      decoration: InputDecoration(
                        hintText: 'Write animal name',
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
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: controller3,
                      decoration: InputDecoration(
                        hintText: 'Write  animal age',
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
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: controller4,
                      decoration: InputDecoration(
                        hintText: 'Write field to update',
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
                  // Container(
                  //   width: 350,
                  //   child: TextField(
                  //     controller: controller5,
                  //     decoration: InputDecoration(
                  //       hintText: 'Write updated value',
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //         borderSide: BorderSide(width: 1.5),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //         borderSide: BorderSide(width: 1.5),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  // Container(
                  //   width: 350,
                  //   child: TextField(
                  //     controller: controller6,
                  //     decoration: InputDecoration(
                  //       hintText: 'Write field to Delete',
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //         borderSide: BorderSide(width: 1.5),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //         borderSide: BorderSide(width: 1.5),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final animal = controller1.text.toString();
                      final type = controller2.text.toString();
                      final age = controller3.text.toString();
                      create(animal, type, int.parse(age));
                                        },
                    child: Text('Create'),
                  ),
                  SizedBox(height: 5),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     final valToUpdate = controller4.text.toString();
                  //     final newValue = controller5.text.toString();
                  //     update('pets', 'dogesh', valToUpdate, newValue);
                  //   },
                  //   child: Text('Update'),
                  // ),
                  // SizedBox(height: 5),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     final deleteVal = controller6.text.toString();
                  //     delete('pets', deleteVal);
                  //   },
                  //   child: Text('Delete'),
                  // ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Pets()),
                      );
                    },
                    child: Text('Retrieve'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
