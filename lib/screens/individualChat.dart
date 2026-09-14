import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/screens/userProfile.dart';

class Individualchat extends StatelessWidget {
  final String  name;
  final String  image;
  final String Time1;
  final String Time2;
  final String Text1;
  final String Text2;
  final String Text3;
  final String Text4;
  const Individualchat({super.key,required this.Time1,required this.Time2,required this.name,required this.image,required this.Text1,required this.Text2,required this.Text3,required this.Text4});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECE5DD),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        leadingWidth: 90,
        leading:  Row(
          children: [
            IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.chevron_left_sharp) ),

            InkWell(
              onTap: (){
                Get.to(()=>Userprofile(image: image, name: name, number: "+234 9038285096"));
              },
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(image),
              ),
            ) ,

          ],
        ),
        title: Text(name),
        actions: [
          Icon(Icons.videocam_outlined),
          SizedBox(width: 5,),
          Icon(Icons.call),
          SizedBox(width: 5,),
          Icon(Icons.more_vert),

        ],
        
      ),
      body: 
      Column(
crossAxisAlignment: .start,
        children: [
          _colum1(Text1, Text2,Time1),
          SizedBox(height: 10,),
          _colum2(Text3, Text4,Time2)
        ],
      ),


    );
  }
}
Widget _colum1(String Text1,String Text2,String Time1){
  return
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 74,
              width: 260,
              // color: Colors.white,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(18),bottomRight: Radius.circular(18),bottomLeft: Radius.circular(18))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(Text1,style: TextStyle(fontSize: 14),),
                    Text(Text2,style: TextStyle(fontSize: 14),),
                    Row(
                     mainAxisAlignment: .end,
                        children: [
                      Text(Time1,style: TextStyle(color: Colors.black,fontSize: 12),)
                    ],)
                  ],
                ),
              ),
            ),
          ),
        ],
      );

}
Widget _colum2(String Text3,String Text4,String Time2){
  return
      Row(
        mainAxisAlignment: .end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              width: 260,
              // color: Colors.green,
              decoration: BoxDecoration(
                color: Colors.green,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(18),bottomRight: Radius.circular(18),bottomLeft: Radius.circular(18))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(Text3,style: TextStyle(color: Colors.white,fontSize: 14),),
                    Text(Text4,style: TextStyle(color: Colors.white,fontSize: 14),),
                    Row(
                      mainAxisAlignment: .end,
                      children: [
                      Text(Time2,style: TextStyle(color: Colors.white54,fontSize: 12),)
                    ],)
                  ],
                ),
              ),
            ),
          ),
        ],
      );

}
