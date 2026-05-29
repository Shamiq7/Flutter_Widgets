import 'package:flutter/material.dart';
import 'package:flutter_widgets/provider/imagepickerprovider.dart';
import 'package:flutter_widgets/weatherapp.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ImagePickerProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Weatherapp(),
      theme: ThemeData(brightness: Brightness.dark),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, Snapshot) {
      //     if (Snapshot.hasData) {
      //       return Databaseui();
      //     } else {
      //      return Loginpg1();
      //     }

      //   },
      // ),
    );
    // return MaterialApp(debugShowCheckedModeBanner: false, home: Loginpg1());
  }
}
