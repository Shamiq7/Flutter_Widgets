import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class Setwallpaper extends StatefulWidget {
  const Setwallpaper({super.key, required this.imageurl});
  final String imageurl;

  @override
  State<Setwallpaper> createState() => _SetwallpaperState();
}

class _SetwallpaperState extends State<Setwallpaper> {
 
 
  Future<void> setWallpaper() async {
    int location = WallpaperManagerFlutter.bothScreens
    ;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    bool result = await WallpaperManagerFlutter().setWallpaper(
      file,
      location,
    );
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Wallpaper'),centerTitle: true,),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(child: Image.network(widget.imageurl))),
            InkWell(
              onTap: () async {
                await setWallpaper();
              },
              child: Container(
                height: 30,
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Set Wallpaper',
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
