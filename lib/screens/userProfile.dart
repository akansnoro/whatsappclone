import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Userprofile extends StatelessWidget {
 final String image;
 final String  name;
 final String  number;

  const Userprofile({super.key,required this.image,required this.name,required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back_outlined,) ),
        actions: [
          Icon(Icons.more_vert_sharp,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(image),
              ),
            ),
            Text(name),
            Text(number),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.phone)),
                  SizedBox(width: 5,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.videocam_outlined)),
                  SizedBox(width: 5,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined)),
                ],
              ),
            ),
            Divider(
              thickness: 9,
            ),
            _info(Icons.notifications, "Notifications"),
            _info(Icons.image, "Media visibility"),
            Divider(
              thickness: 9,
            ),
            _info2(Icons.lock_open, "Encryption", "Messages and calls are end-to-end", "encrypted. Tap to verify."),
            _info2(Icons.av_timer, "Disappearing messages", "off", ""),
            _info2(Icons.shield, "Advanced chat privacy", "off", ""),
            Divider(
              thickness: 9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("No groups in common",style: TextStyle(
                      fontSize: 15,
                    color: Colors.grey
                      ),),
                ),
              ],
            ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.green, 
                      foregroundColor: Colors.white,
                      child: Icon(Icons.group)),
                ),
                  Row(
                    children: [
                      Text("Create group with  "),
                      Text(name)
                    ],
                  )
                ],
                            ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.group_add_outlined)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add to groups"),
                      Text("Add this contact to a group you're in.",style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey
                      ),)
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 9,
            ),
            _last(Icons.favorite_border, "Add to Favourites", Colors.black, Colors.black),
            _last(Icons.co_present_sharp, "Add to list",Colors.black, Colors.black),
            _last(Icons.cancel, "Clear chat", Colors.red,Colors.red),
            
        
          ],
        ),
      ),
    );
  }
}
Widget _info (IconData icon,String txt){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Icon(icon),
        SizedBox(width: 5,),
        Text(txt)
      ],
    ),
  );
}
Widget _info2(IconData icon,String txt2,String txt3,String txt4){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon),
            SizedBox(width: 10,),
            Text(txt2,style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),

          ],
        ),

        Row(
          children: [
            SizedBox(width: 36,),
          Text(txt3,style: TextStyle(
              fontSize: 13,
            color: Colors.grey

          ),),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 36,),
            Text(txt4,style: TextStyle(
                fontSize: 13,
                color: Colors.grey

            ),)
          ],
        )
      ],
    ),
  );
}
Widget _last( IconData icon,String text,Color color,Color iconColor ){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon,color: iconColor,),
      ),
      Text(text,style: TextStyle(
          fontSize: 17,
          color: color
      ),)
    ],
  );
}
