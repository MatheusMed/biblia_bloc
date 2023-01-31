import 'package:biblia_bloc/app/core/injector.dart';
import 'package:biblia_bloc/app/presenter/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  Injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biblia Sagrada',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
