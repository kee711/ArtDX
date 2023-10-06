import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_artdx/app.dart';
import 'package:flutter_artdx/styles/app_text_style.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'bottom_sheet.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xomlhkusycjnfjshqyqx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhvbWxoa3VzeWNqbmZqc2hxeXF4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY0OTM3ODMsImV4cCI6MjAxMjA2OTc4M30.1urLXw5dAmZyIAWlGOafvU7ObTGoBiqEejhuwinnPdM',
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: Color.fromARGB(255, 242, 242, 242),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w100,
            ),
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.5),
      ),
      home: MyApp(),
    ),
  );
}
