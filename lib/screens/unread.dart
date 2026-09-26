import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/nav_con.dart';
import 'individualChat.dart';

class Unread extends StatelessWidget {
  const Unread({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
              onTap: (){
                Get.to(()=>Individualchat(Time1: "10:14AM", Time2: "10:16AM✔✔", name: "Jane Smith", image: 'asset/img/images1.png', Text1: "Hey! Are you free to look over the", Text2: "new designs today?", Text3: "Yes! Just finished my morning", Text4: "meeting. Send them over",duration: "0:12",)
                );
              },
              child: _buildChatItem("Jane Smith", "see you later", 'asset/img/images1.png' , "9.41AM", "2")
          ),

          InkWell(
              onTap: (){
                Get.to(()=>Individualchat(Time1: "2:10PM", Time2: "2:14PM✔✔", name: "Family Group", image: 'asset/img/images2.jpg', Text1: "Hi babe", Text2: "Dinner at 8", Text3: "Hello Hon", Text4: "OK",duration: "0:22",));
              },
              child: _buildChatItem("Emily Johnson", "Emily Johnson:Dinner at 7", 'asset/img/images2.jpg', "9:30AM", "5")
          ),
          _buildChatItem("Besties", "Mike:😂😂", 'asset/img/rrr.jpg', "9:18AM", "1"),
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
