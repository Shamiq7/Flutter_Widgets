import 'package:flutter/material.dart';
import 'package:flutter_widgets/provider/imagepickerprovider.dart';
import 'package:flutter_widgets/widget2.dart';
import 'package:flutter_widgets/widget3.dart';
import 'package:provider/provider.dart';

void main() {
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
    return MaterialApp(debugShowCheckedModeBanner: false, home: Widget3());
  }
}
