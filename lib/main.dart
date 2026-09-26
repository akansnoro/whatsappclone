import 'package:flutter/material.dart';
import 'package:whatsappclone/screens/chats.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/screens/navscreen.dart';


void main() {

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Navscreen(),
    theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        brightness: Brightness.light,
        primaryColor: Color(0xFF16AE4F),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF16AE4F))
    ),
    themeMode: ThemeMode.light,
    darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF007E2F),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF007E2F),
            brightness: Brightness.dark)
    ),
  ));
}

