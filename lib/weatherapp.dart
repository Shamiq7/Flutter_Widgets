// data['students'][0]['marks']['math']

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Weatherapp extends StatefulWidget {
  const Weatherapp({super.key});

  @override
  State<Weatherapp> createState() => _WeatherappState();
}

class _WeatherappState extends State<Weatherapp> {
  TextEditingController weatherTextfield = TextEditingController();

  Map weatherData =
      {}; //why map is used here because this api returns one object not many movie/wallpaper

  fetchAPI() async {
    String city = weatherTextfield.text;
    print('fetchAPI started');
    String apiKEY = '43cf54d9d43131598cb968a0b7290591';
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKEY}&units=metric';

    var response = await http.get(Uri.parse(url));

    Map result = jsonDecode(response.body);

    if (result['cod'] == 200) {
      setState(() {
        weatherData = result;
      });
      print(weatherData);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please enter correct city name')));
    }
    weatherTextfield.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weatherTextfield.text = 'Delhi';
    fetchAPI();
  }

  @override
  Widget build(BuildContext context) {
    String city = weatherTextfield.text;
    String iconCode = weatherData['weather'][0]['icon'];

    String iconUrl = 'https://openweathermap.org/img/wn/$iconCode@2x.png';
    return Scaffold(
      appBar: AppBar(title: Text('Weather App'), centerTitle: true),
      body: weatherData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 350,
                      child: TextField(
                        controller: weatherTextfield,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hoverColor: Colors.black,

                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          hintText: 'Enter Your City Name',

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 1.5),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        fetchAPI();
                      },
                      child: Text('Search'),
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.pin_drop),
                        SizedBox(width: 5),
                        Text(
                          ' ${weatherData['name']}, ${weatherData['sys']['country']}',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   weatherData['weather'][0]['id'].toString(),
                        //   style: TextStyle(),
                        // ),
                        SizedBox(width: 5),
                        Text(
                          weatherData['weather'][0]['description'].toString(),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Image.network(iconUrl),
                    SizedBox(height: 10),
                    Text(
                      'Temprature: ${weatherData['main']['temp'].toString()}°',
                      style: TextStyle(fontSize: 25),
                    ),

                    Text(
                      'Feels Like: ${weatherData['main']['feels_like'].toString()}°',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Pressure: ${weatherData['main']['pressure'].toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),

                                Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),

                                // Icon(Icons.sunny, color: Colors.yellow, size: 30),
                                Text(
                                  'Humidity: ${weatherData['main']['humidity'].toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Wind Speed: ${weatherData['wind']['speed'].toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),

                                Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),

                                Text(
                                  'Pressure ${weatherData['main']['pressure'].toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Icon(
                                //   Icons.thunderstorm,
                                //   color: Colors.blueGrey,
                                //   size: 30,
                                // ),
                                Text(
                                  'Visibility: ${weatherData['visibility'].toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),

                                Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),

                                // Icon(Icons.sunny, color: Colors.yellow, size: 30),
                                Text(
                                  'Sea Level: ${weatherData['main']['sea_level'].toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Longitute: ${weatherData['coord']['lon'].toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),

                                Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),

                                Text(
                                  'Latitute ${weatherData['coord']['lat'].toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
