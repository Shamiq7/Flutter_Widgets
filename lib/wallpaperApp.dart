import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/setwallpaper.dart';
import 'package:http/http.dart' as hppt;

class Wallpaperapp extends StatefulWidget {
  const Wallpaperapp({super.key});

  @override
  State<Wallpaperapp> createState() => _WallpaperappState();
}

class _WallpaperappState extends State<Wallpaperapp> {
  List images = [];
  int pg = 1;

  fetchAPI() async {
    await hppt
        .get(
          Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
          headers: {
            'Authorization':
                'vPBuHBWMzLFlT0tp5etMkXAf4Jy2iFO347UsGzDqbfycjGnaHoSPScV1',
          },
        )
        .then((value) {
          // print(value.body);
          Map result = jsonDecode(value.body);
          setState(() {
            images = result['photos'];
          });
          print(images);
          // print(images[0]);
          // print(images.length);
        });
  }

  void initState() {
    super.initState();
    fetchAPI();
  }

  loadMore() async {
    setState(() {
      pg = pg + 1;
    });
    String url =
        'https://api.pexels.com/v1/curated?per_page=80&page =' + pg.toString();

    await hppt
        .get(
          Uri.parse(url),
          headers: {
            'Authorization':
                'vPBuHBWMzLFlT0tp5etMkXAf4Jy2iFO347UsGzDqbfycjGnaHoSPScV1',
          },
        )
        .then((value) {
          Map result = jsonDecode(value.body);
          setState(() {
            images.addAll(result['photos']);
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wallpaper app'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Setwallpaper(
                              imageurl: images[index]['src']['large2x'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.white10,
                        child: Image.network(
                          images[index]['src']['tiny'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                loadMore();
              },
              child: Container(
                height: 30,
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Load More',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
