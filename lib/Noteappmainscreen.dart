import 'package:flutter/material.dart';

class Noteappmainscreen extends StatefulWidget {
  const Noteappmainscreen({super.key});

  @override
  State<Noteappmainscreen> createState() => _NoteappmainscreenState();
}

class _NoteappmainscreenState extends State<Noteappmainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 6, 102, 92),
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.elliptical(20, 20),
              //   bottomRight: Radius.elliptical(20, 20),
              // ),
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
                Container(
                  width: 370,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search, color: Colors.teal),
                      label: Text(
                        'Serch Your Note',
                        style: TextStyle(color: Colors.black),
                      ),
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
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('View Notes'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    Container(
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
          Column(
            children: [
              Container(
                width: 350,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Create', style: TextStyle(color: Colors.white)),
                  style: TextButton.styleFrom(backgroundColor: Colors.teal),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 350,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Retrieve Notes',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                ),
              ),
              SizedBox(height: 50),
              Container(
                height: 255,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 6, 102, 92),
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.elliptical(20, 20),
                  //   topRight: Radius.elliptical(20, 20),
                  // ),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Every Note Counts',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
