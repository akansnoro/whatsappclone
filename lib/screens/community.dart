import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            // leading:IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back_outlined,) ),

            backgroundColor: Colors.green[600],
            title: Text('Communities',style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            )),

            actions: [
              Icon(Icons.more_vert_outlined,color: Colors.white,)
            ],
          ),
         body:  Padding(
           padding: const EdgeInsets.all(8.0),
           child: SingleChildScrollView(
             child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18)
                    ),
                    child: Image.asset("asset/img/community.jpg", width: 200,
                      height: 200,),
                  ),
                  Text("Stay Connected with a",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Text("Community" ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 5,),
                  Text("Community brings members together in ",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text("topic_based groups and make it easy to get",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text("admin announcements. Any community You're ",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Text("added to will appear here.",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text("See example communities >",style: TextStyle(color: Colors.blue),),
                  SizedBox(height: 30,),
                  ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent[700],
                        foregroundColor: Colors.white,
                        fixedSize: Size(1400,45)
                      )
                      , child:
                      Text("Start your Community",style: TextStyle(
                          fontSize: 15,
                          color: Colors.white
                      ))
                  ),
                ],
              ),
           ),
         )
      )
    );

  }
}


