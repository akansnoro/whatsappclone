import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/nav_con.dart';

class Groups extends StatelessWidget {
  const Groups({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildChatItem("Besties", "Mike:😂😂", 'asset/img/rrr.jpg', "9:18AM", "1"),

          _buildChatItem("Work Team", "You:Project update", 'asset/img/nnn.jpg', "8:50AM", ""),

          _buildChatItem("Family Group", "Thanks!", "asset/img/eee.jpg", "Yesterday", ""),
        ],
      ),
    );
  }
}
Widget _buildChatItem(String name, String message, String image, String time, String count) {
  NavCons controller = Get.find<NavCons>();
  return Padding(
    padding:  EdgeInsets.all(8.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(image),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(message, style:  TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
              Column(
                children: [
                  Text(time, style: TextStyle(fontSize: 11, color: Colors.grey)),
                  if (count.isNotEmpty)
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      radius: 7,
                      child: Text(count, style: TextStyle(fontSize: 6)),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
