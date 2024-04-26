import 'package:flutter/material.dart';
import 'package:hear_it_through/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Signify',
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: const splashscreen(),
    );
  }
}
