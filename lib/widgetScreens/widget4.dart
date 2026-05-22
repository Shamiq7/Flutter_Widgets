import 'package:flutter/material.dart';
import 'package:flutter_widgets/modals/list.dart';

class Widget4 extends StatefulWidget {
  const Widget4({super.key});

  @override
  State<Widget4> createState() => _Widget4State();
}

class _Widget4State extends State<Widget4> {
  int selectedVal = 0;

  void onTapped(int index) {
    setState(() {
      selectedVal = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('Photos/pic6.png'),
                    radius: 30,
                  ),
                  Text(
                    '|',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Feed',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(width: 120),
                  CircleAvatar(
                    backgroundImage: AssetImage('Photos/pic7.png'),
                    radius: 25,
                  ),
                  SizedBox(width: 30),
                  CircleAvatar(
                    backgroundImage: AssetImage('Photos/pic8.png'),
                    radius: 25,
                  ),
                ],
              ),
              SizedBox(height: 25),
              SizedBox(
                width: 390,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Typing',
                    labelText: 'Search',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: w2img.length,
                  itemBuilder: (context, index) {
                    final item = w2img[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 30, 10, 3),
                          child: CircleAvatar(
                            backgroundImage: item.img.image,
                            radius: 40,
                          ),
                        ),
                        Text(item.desc, style: TextStyle(fontSize: 17)),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 380,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: w3below.length,
                  itemBuilder: (context, index) {
                    final item = w3below[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: item.img.image,
                              radius: 25,
                            ),
                            SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.name, style: TextStyle(fontSize: 20)),

                                Text(
                                  item.city,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 150),
                            Text(item.date, style: TextStyle(fontSize: 15)),
                            SizedBox(width: 7),
                            Icon(Icons.more_vert, size: 25),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 400,
                          child: SizedBox(
                            width: 400,
                            height: 300,
                            child: Image(
                              image: item.img2.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.red),
                            SizedBox(width: 10),
                            Icon(Icons.message),
                            SizedBox(width: 10),
                            Icon(Icons.send),
                            SizedBox(width: 90),
                            Icon(Icons.more_horiz),
                            SizedBox(width: 140),
                            Icon(Icons.bookmark),
                          ],
                        ),
                        SizedBox(height: 30),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              // SizedBox(
              //   width: 380,
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           CircleAvatar(
              //             backgroundImage: AssetImage('Photos/pic4.png'),
              //             radius: 25,
              //           ),
              //           SizedBox(width: 20),
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text('Wanda S', style: TextStyle(fontSize: 20)),

              //               Text(
              //                 'NYC',
              //                 style: TextStyle(
              //                   fontSize: 13,
              //                   color: Colors.red,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ],
              //           ),
              //           SizedBox(width: 150),
              //           Text('Apr 24', style: TextStyle(fontSize: 15)),
              //           SizedBox(width: 7),
              //           Icon(Icons.more_vert, size: 25),
              //         ],
              //       ),
              //       SizedBox(
              //         height: 400,
              //         child: ClipRRect(
              //           child: Image.asset(
              //             'Photos/pic3.png',
              //             fit: BoxFit.contain,
              //           ),
              //         ),
              //       ),
              //       Row(
              //         children: [
              //           Icon(Icons.favorite, color: Colors.red),
              //           SizedBox(width: 10),
              //           Icon(Icons.message),
              //           SizedBox(width: 10),
              //           Icon(Icons.send),
              //           SizedBox(width: 90),
              //           Icon(Icons.more_horiz),
              //           SizedBox(width: 140),
              //           Icon(Icons.bookmark),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.compare), label: 'Next Pg'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Like',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'Profile'),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedVal,
        onTap: onTapped,
      ),
    );
  }
}
