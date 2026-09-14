import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsappclone/controllers/nav_con.dart';
import 'package:whatsappclone/screens/favourites.dart';
import 'package:whatsappclone/screens/groups.dart';
import 'package:whatsappclone/screens/individualChat.dart';
import 'package:whatsappclone/screens/newChat.dart';
import 'package:whatsappclone/screens/individualChat.dart';
import 'package:whatsappclone/screens/unread.dart';
import 'package:whatsappclone/screens/chatCon.dart'; // Import your list here



class Chats extends StatelessWidget {

  const Chats({super.key, });

  @override
  Widget build(BuildContext context) {

     NavCons controller = Get.find<NavCons>();

    return
       Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[600],
          foregroundColor: Colors.white,
          title: Text('Chats',style: TextStyle(
            fontSize: 30,
          )),
          actions: [
            Icon(Icons.camera_alt_outlined),
            SizedBox(width: 20),
            Icon(Icons.more_vert_outlined)
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green[600],

                  ),
                  child: Obx(
                    ()=> Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: (){
                            controller.selectedButton.value=0;
                          },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: controller.selectedButton.value == 0
                                  ? Colors.greenAccent[200]
                                  : Colors.greenAccent[700],
                                   foregroundColor: Colors.white,
                                  fixedSize: Size(65,12),
                              )

                              , child:
                              Text("All",style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white
                              ))
                          ),
                          ElevatedButton(onPressed: (){
                            controller.selectedButton.value=1;
                          },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.selectedButton.value == 1
                                ? Colors.greenAccent[200]
                                : Colors.greenAccent[700],
                                foregroundColor: Colors.white,
                                fixedSize: Size(83,12),
                                shadowColor:  Colors.green[700],

                              )

                              , child:
                              Text("Unread",style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.white
                              ))
                          ),
                          ElevatedButton(onPressed: (){
                            controller.selectedButton.value=2;
                          },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.selectedButton.value == 2
                                    ? Colors.greenAccent[200]
                                    : Colors.greenAccent[700],
                                foregroundColor: Colors.white,
                                fixedSize: Size(83,12),
                                shadowColor:  Colors.green[700],

                              )

                              , child:
                              Text("Groups",style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.white
                              ))
                          ),
                          ElevatedButton(onPressed: (){
                            controller.selectedButton.value=3;
                          },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.selectedButton.value == 3
                                    ? Colors.greenAccent[200]
                                    : Colors.greenAccent[700],
                                foregroundColor: Colors.white,
                                fixedSize: Size(87,12),
                                shadowColor:  Colors.green[700],

                              )

                              , child:
                              Text("Favourites",style: TextStyle(
                                  fontSize: 7,
                                  color: Colors.white
                              ))
                          ),


                        ],
                      ),
                  ),


                )


              ],
            ),

            InkWell(
                onTap: (){
                  Get.to(()=>Individualchat(Time1: "10:14AM", Time2: "10:16AM✔✔", name: "Jane Smith", image: 'asset/img/images1.png', Text1: "Hey! Are you free to look over the", Text2: "new designs today?", Text3: "Yes! Just finished my morning", Text4: "meeting. Send them over")
                  );
                },
                child: _buildChatItem("Jane Smith", "see you later", 'asset/img/images1.png' , "9.41AM", "2")
            ),

            InkWell(
              onTap: (){
                Get.to(()=>Individualchat(Time1: "2:10PM", Time2: "2:14PM✔✔", name: "Family Group", image: 'asset/img/images2.jpg', Text1: "Hi babe", Text2: "Dinner at 8", Text3: "Hello Hon", Text4: "OK"));
              },
                child: _buildChatItem("Emily Johnson", "Emily Johnson:Dinner at 7", 'asset/img/images2.jpg', "9:30AM", "5")
            ),


            _buildChatItem("Besties", "Mike:😂😂", 'asset/img/rrr.jpg', "9:18AM", "1"),


            _buildChatItem("Work Team", "You:Project update", 'asset/img/nnn.jpg', "8:50AM", ""),

            _buildChatItem("Family Group", "Thanks!", "asset/img/eee.jpg", "Yesterday", ""),



          ],
        ),
       floatingActionButton:  FloatingActionButton(

          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Newchat()),);
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(Icons.chat,),
         shape: StadiumBorder(),

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,


      );
  }
}


Widget _buildChatItem(String name, String message, String image, String time, String count) {
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



