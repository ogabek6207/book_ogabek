import 'dart:io';
import 'package:book_ogabek/src/ui/main_screen.dart';
import 'package:book_ogabek/src/ui/music_player/music_player_screen.dart';
import 'package:book_ogabek/src/ui/music_player/music_player_screen1.dart';
import 'package:book_ogabek/src/ui/music_player/music_player_screen_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        primarySwatch: Colors.blue,
      ),
      home:   MusicPlayerBottom(),
    );
  }
}




