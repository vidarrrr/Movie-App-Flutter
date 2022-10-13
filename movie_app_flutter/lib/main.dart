import 'package:flutter/material.dart';

import 'core/home_view.dart';
import 'data/source/local/shared_prefs.dart';

Future<void> main() async {
  //https://stackoverflow.com/questions/58389285/how-to-create-singleton-class-of-sharedpreferences-in-flutter
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const HomeView());
  }
}
