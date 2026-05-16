import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  TextEditingController controller = TextEditingController();
  var message = '';
  List fruit = ['A', 'B', 'C', 'D'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Test pg 2', style: TextStyle(fontSize: 20)),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 750,
            color: Colors.blue,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.4,
                    child: Image.asset('Photos/pic1.png', fit: BoxFit.cover),
                  ),
                ),
                Positioned.fill(
                  child: Container(color: Colors.purple.withOpacity(0.5)),
                ),
                Positioned(
                  top: 450,
                  left: 10,
                  child: RichText(
                    textAlign: TextAlign.start,

                    text: TextSpan(
                      text: 'Easy and\n',
                      style: TextStyle(fontSize: 40),
                      children: [
                        TextSpan(text: 'quick\n'),
                        TextSpan(text: 'Learn\n'),
                        TextSpan(text: 'Language\n'),
                        TextSpan(text: 'online!'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login Successfull'),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: Size(200, 50),
              ),
              child: Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
