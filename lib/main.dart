import 'package:flutter/material.dart';
import 'package:world_time/screen/choose_location.dart';
import 'package:world_time/screen/home.dart';
import 'package:world_time/screen/loading.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const ChooseLocation(),
      },
    ),
  );
}
