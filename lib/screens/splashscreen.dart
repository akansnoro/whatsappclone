import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:whatsappclone/screens/homeScreen.dart';
import 'package:whatsappclone/screens/navscreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    4.delay((){
      Get.to(() => Homescreen());
    });
    return

        Scaffold(
          backgroundColor: Color(0xFF217842),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("asset/icon/WhatsApp-Logo.wine.svg",
                height: 100,
                width: 100,),
              Center(
                child: Text('WhatsApp', style: TextStyle(
                  fontSize: 30, fontWeight:
                FontWeight.bold,
                  color: Colors.white,
                ),
                ),
              ),
              SizedBox(height: 30,),
              Text('Secure. Simple. Reliable', style: TextStyle(
                fontSize: 17, fontWeight:
              FontWeight.bold,
                color: Colors.white,
              ),
              ),
            ],
          ),

        );

  }
}