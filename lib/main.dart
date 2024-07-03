import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  // init hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox('todobox');

  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        textTheme: GoogleFonts.firaSansExtraCondensedTextTheme(),
        useMaterial3: true,
        // textTheme: GoogleFonts.antonTextTheme(),
        appBarTheme: const AppBarTheme(color:Color.fromARGB(255, 189, 224, 255), elevation: 0),
        // scaffoldBackgroundColor: Colors.blueGrey[100],
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        // dialogBackgroundColor: Colors.blueGrey[100],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 189, 224, 255),
                  textStyle: const TextStyle(color: Colors.white),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
      ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}