import 'package:flutter/material.dart';
import 'package:flutter_widgets/list.dart';

class Widget3 extends StatefulWidget {
  const Widget3({super.key});

  @override
  State<Widget3> createState() => _Widget3State();
}

class _Widget3State extends State<Widget3> {
  int selectedVal = 0;

  void onTapped(int index) {
    setState(() {
      selectedVal = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wanda.s', style: TextStyle(fontWeight: FontWeight.w500)),
        leading: Icon(Icons.arrow_back_ios_new),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('Photos/pic3.png'),
                          radius: 55,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Wanda.S',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text('Photographer / NYC'),
                      ],
                    ),
                  ),
                  SizedBox(width: 40),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('150', style: TextStyle(fontSize: 25)),

                              Text('Posts', style: TextStyle(fontSize: 13)),
                            ],
                          ),
                          SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('5k', style: TextStyle(fontSize: 25)),

                              Text('Followers', style: TextStyle(fontSize: 13)),
                            ],
                          ),
                          SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('100', style: TextStyle(fontSize: 25)),

                              Text('Following', style: TextStyle(fontSize: 13)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              elevation: 5,
                              fixedSize: Size(140, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(20),
                                side: BorderSide(width: 2),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Follow',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            size: 50,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
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
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: CircleAvatar(
                            backgroundImage: item.img.image,
                            radius: 40,
                          ),
                        ),

                        Text(item.desc, style: TextStyle(fontSize: 15)),
                      ],
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.satellite, size: 30, color: Colors.blue),
                  SizedBox(width: 60),
                  Icon(Icons.face, size: 30, color: Colors.yellow),
                  SizedBox(width: 60),
                  Icon(Icons.favorite_border, size: 30, color: Colors.red),
                  SizedBox(width: 60),
                  Icon(Icons.add_home, size: 30, color: Colors.green),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 390,

                child: GridView.builder(
                  itemCount: w3img.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    final item = w3img[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin: EdgeInsets.all(3),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(23),
                        child: Image(image: item.img.image, fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
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
