import 'package:flutter/material.dart';
import 'package:flutter_widgets/list.dart';

class Widget2 extends StatefulWidget {

  const Widget2({super.key});

  @override
  State<Widget2> createState() => _Widget2State();
}

class _Widget2State extends State<Widget2> {
     int selectedindex = 0;


 void onTapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      //       body: Center(
      //   child: Text(
      //     'WORKING',
      //     style: TextStyle(fontSize: 30),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 310),
                    Icon(Icons.favorite),
                    SizedBox(width: 10),
                    Icon(Icons.settings),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('Photos/pic4.png'),
                  radius: 38,
                ),
              ),
              SizedBox(height: 10),
              Text('Martinaz Pacho', style: TextStyle(fontSize: 20)),
              SizedBox(height: 3),
              Text(
                'Founder & CEO Ui Gruop LPP',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20),
              //
              //
              SizedBox(
                height: 100,

                child: ListView.builder(
                  itemCount: W2icons.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = W2icons[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              item.num.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(item.char.toString()),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(5.0),
              //       child: Column(
              //         children: [
              //           Text('23', style: TextStyle(fontSize: 20)),
              //           Text('Posts'),
              //         ],
              //       ),
              //     ),
              //     SizedBox(width: 30),
              //     Padding(
              //       padding: const EdgeInsets.all(5.0),
              //       child: Column(
              //         children: [
              //           Text('7', style: TextStyle(fontSize: 20)),
              //           Text('Heighlights'),
              //         ],
              //       ),
              //     ),
              //     SizedBox(width: 30),
              //     Padding(
              //       padding: const EdgeInsets.all(5.0),
              //       child: Column(
              //         children: [
              //           Text('80', style: TextStyle(fontSize: 20)),
              //           Text('Stories'),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.curtains_rounded, size: 20),
                      SizedBox(width: 60),
                      Icon(Icons.safety_check),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 390,

                child: GridView.builder(
                  itemCount: w2img.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    final imagee = w2img[index];
                    return Container(
                      margin: EdgeInsets.all(2),

                      child: Image(image: imagee.img.image, fit: BoxFit.cover),
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
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search',),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selectedindex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}
