import 'package:flutter/material.dart';
import 'package:flutter_widgets/modals/list.dart';

class Widget1 extends StatelessWidget {
  const Widget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,

                    child: Image.asset('Photos/pic3.png', fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 40,
                    left: 10,
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 10,
                    child: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('Photos/pic4.png'),
                      radius: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(10, 0, 0, 0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Madrid city tour\n',
                      style: TextStyle(fontSize: 30, color: Colors.brown),
                      children: [
                        TextSpan(
                          text: 'for designers',
                          style: TextStyle(fontSize: 30, color: Colors.brown),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 70),
                Icon(Icons.add, size: 25),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(0, 0, 50, 0),
              child: Text(
                'This City Will Captivate You and make you fall in love',
                style: TextStyle(fontSize: 14, color: Colors.brown.shade400),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 40,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: W1icons.length,
                itemBuilder: (context, index) {
                  final item = W1icons[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Text(item.count.toString()),
                        SizedBox(width: 10),
                        Icon(item.icon),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 500,
              width: 380,
              child: Text(
                'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable.\n If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
