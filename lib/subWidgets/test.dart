import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/modals/list.dart';

class Testpage extends StatefulWidget {
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  int selectedIndex = 0;
  String? selectedVal;

  final _formKey = GlobalKey<FormState>();

  List<String> fruits = ['orange', 'apple', 'banana', 'pinapple'];

  // List<Widget> widgets = [
  //   DismissibleWidget(),

  //   DismissibleWidget(),
  //   DismissibleWidget(),
  //   DismissibleWidget(),

  //   Text('Home'),
  //   Text('Search'),
  //   Text('Add'),
  //   Text('Profile'),
  // ];

  // void onTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Page'), centerTitle: true),
      //
      //
      //
      drawer: Drawer(
        elevation: 20,
        backgroundColor: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/cake.png"),
              ),
            ),
            ListTile(
              leading: Text(
                'HI',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              title: Text(
                'HI',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        ),
      ),

      //
      //
      // body: SafeArea(
      //   child: IndexedStack(index: selectedIndex, children: widgets),
      // ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _Mydialogue(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login Successfull'),
                        behavior: SnackBarBehavior.fixed,
                      ),
                    );
                    // showModalBottomSheet(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadiusGeometry.only(
                    //       topLeft: Radius.circular(20),
                    //       topRight: Radius.circular(20),
                    //     ),
                    //   ),
                    //   backgroundColor: Colors.white,
                    //   elevation: 20,
                    //   showDragHandle: true,

                    //   context: context,
                    //   builder: (context) {
                    //     return Column(
                    //       mainAxisSize: MainAxisSize.max,
                    //       children: [
                    //         ListTile(
                    //           title: Text('BOOKSTORE'),
                    //           subtitle: Text('My Book'),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // );
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(height: 20),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Hello Shamiq',
                    textStyle: TextStyle(fontSize: 20),
                    speed: Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 4,
                pause: Duration(milliseconds: 200),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              SizedBox(height: 5),
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    colors: [Colors.blue, Colors.red, Colors.green],
                    'Hello Shamiq',
                    textStyle: TextStyle(fontSize: 50),
                    speed: Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 8,
                pause: Duration(milliseconds: 400),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              SizedBox(height: 20),

              //
              //
              SizedBox(
                width: 360,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text('Enter Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name Cannot be Empty';
                    }
                    if (value.length < 3) {
                      return 'Enter at Least 3 Character';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _Mydialogue(context);
                  }
                },
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              //
              //
              //
              //
              //
              DropdownButton<String>(
                value: selectedVal,
                hint: Text('Select name'),
                icon: Icon(Icons.arrow_downward_sharp),
                items: Alphabet.map((item) {
                  return DropdownMenuItem<String>(
                    value: item.name,

                    child: Text('Select ${item.name}'),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedVal = value;
                  });
                },
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 300,
                      width: 300,

                      decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('images/cake.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 50,

                    child: Container(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  // Center(
                  //   child: Container(
                  //     height: 100,
                  //     width: 100,
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  // Center(
                  //   child: Container(
                  //     height: 50,
                  //     width: 50,
                  //     color: Colors.green,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // //
      //
      //

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profie'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        // onTap: onTapped,
      ),
    );
  }
}

Future<void> _Mydialogue(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('This is an Alert'),
        content: SingleChildScrollView(
          child: ListTile(
            leading: Text(
              'HI',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: () {}, child: Text('Login')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'),
          ),
        ],
      );
    },
  );
}
