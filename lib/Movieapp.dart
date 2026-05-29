import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Movieapp extends StatefulWidget {
  const Movieapp({super.key});

  @override
  State<Movieapp> createState() => _MovieappState();
}

class _MovieappState extends State<Movieapp> {
  List trendingMOV = [];
  final String apiKEY = '2269867207db2d6a53f544a5865db0fc';
  final accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMjY5ODY3MjA3ZGIyZDZhNTNmNTQ0YTU4NjVkYjBmYyIsIm5iZiI6MTc3OTg1ODU4OS4xMzkwMDAyLCJzdWIiOiI2YTE2N2M5ZDE1YWU5NjFlODZmY2U3NDUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.cImvWvsX7DyuF7U-opXT99cTHQDctSpRk8G-v4FK8JI';

  loadMovies() async {
    TMDB tmdbLogs = TMDB(ApiKeys(apiKEY, accessToken),
    logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
   
    Map trendingResult = await tmdbLogs.v3.trending.getTrending();
    print(trendingResult);
    setState(() {
      trendingMOV = trendingResult['results'];
    });
    print(trendingMOV);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Movie App', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: Column(children: [
        
      ],)),
    );
  }
}
