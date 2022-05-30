import 'package:clone_netflix/ui/screens/home_page.dart';
import 'package:clone_netflix/ui/screens/loading_screen.dart';
//import 'package:clone_netflix/ui/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'repositories/data_repository.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => DataRepository()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ksi Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoadingScreen(),
    );
  }
}
