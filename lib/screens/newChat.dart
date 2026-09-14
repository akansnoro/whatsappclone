import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsappclone/screens/chats.dart';
import 'package:whatsappclone/screens/community.dart';

class Newchat extends StatelessWidget {
  const Newchat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
         leading: IconButton(onPressed: (){
           Navigator.pop(context,MaterialPageRoute(builder: (context)=> Chats()));
         }, icon: Icon(Icons.arrow_back)),
          title: Text('New chat',style: TextStyle(
            // color: Colors.white,
            fontWeight: .bold,
            fontSize: 23,
          )),
          actions: [
            Icon(Icons.search_outlined,color: Colors.white,),
            SizedBox(width: 20),
            Icon(Icons.more_vert_outlined,color: Colors.white,)
          ],
        ),
        body: Column(
          crossAxisAlignment: .start,
          children: [
            _types("New Group"),
            _types("New Contact"),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                child:Icon(Icons.terrain_outlined,size: 23,),
              ),

              SizedBox(width: 10,),
              Text("New Community",style: TextStyle(
                  fontWeight: .bold,
                  fontSize: 20
              ),)
            ],
          ),
        ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Frequently Contacted",style: TextStyle(
                  fontWeight: .bold,
                  fontSize: 15
              ),),
            ),
            SizedBox(height: 8,),
            _newContact("asset/img/uuu.jpg", "John", "Hey there! i am using Whatsapp"),
            _newContact("asset/img/lll.jpg", "Jane ", "Available"),
            _newContact("asset/img/mm.jpg", "Emily", "At the gym")
            
          ],
        ),
        floatingActionButton:  FloatingActionButton(

          onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Newchat()),);
            Get.to(()=>Community());
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(Icons.group,),
          shape: StadiumBorder(),

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
Widget _types (String name){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child:Icon(Icons.group,size: 23,),
        ),

        SizedBox(width: 10,),
        Text(name,style: TextStyle(
          fontWeight: .bold,
          fontSize: 20
        ),)
      ],
    ),
  );
}
Widget _newContact (String image,String name,String description){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage:  AssetImage(image),
          ),
        ),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(name,style: TextStyle(
              fontWeight: .bold,
              fontSize: 17
            ),),
            Text(description,style: TextStyle(
                color: Colors.grey
            ),)
          ],
        )
      ],
    ),
  );
}
