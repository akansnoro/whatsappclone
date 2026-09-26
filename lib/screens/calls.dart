// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/nav_con.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    NavCons controller = Get.find<NavCons>();
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[600],
        appBar: AppBar(
          backgroundColor: Colors.green[600],
          title: Text('Calls',style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          )),

          actions: [
            Icon(Icons.search_outlined,color: Colors.white,),
            SizedBox(width: 20),
            Icon(Icons.more_vert_outlined,color: Colors.white,)
          ],
        ),
        body: Column(
          children: [
            Obx(
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
                        fixedSize: Size(70,10),
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
                        fixedSize: Size(87,10),
                        shadowColor:  Colors.green[700],

                      )

                      , child:
                      Text("Missed",style: TextStyle(
                          fontSize: 9,
                          color: Colors.white
                      ))
                  ),
                  ElevatedButton(onPressed: (){
                    controller.selectedButton.value=2;
                    // Get.to(Unread());
                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.selectedButton.value == 2
                          ? Colors.greenAccent[200]
                          : Colors.greenAccent[700],
                      foregroundColor: Colors.white,
                      fixedSize: Size(97,12),
                      shadowColor:  Colors.green[700],

                    )
                    , child:

                    Text("Blocked",style: TextStyle(
                        fontSize: 9,
                        color: Colors.white
                    )),


                  ),

                ],
              ),
            ),
            Expanded(
              child: Obx((){
                if (controller.selectedButton.value == 0){
                  return ListView(
                  children: [
                  _buildcalls('asset/img/ii.jpg', 'John Doe', "Outgoing","9:40 Am"),
                  _buildincomingcalls('asset/img/images1.png', "Jane Smith", "incoming", "9:15 Am"),
                  _buildcalls("asset/img/nnn.jpg", "Mom", "Outgoing", "Yesterday"),
                  _buildmissedcalls("asset/img/images2.jpg", "Dad", "Missed", "Yesterday",Icons.call),
                    _buildmissedcalls("asset/img/jj.jpg", "Bro", "Blocked", "Yesterday",Icons.block)

                  ]
                  );
                } else if (controller.selectedButton.value == 1){
                  return ListView(children: [ _buildmissedcalls("asset/img/images2.jpg", "Dad", "Missed", "Yesterday",Icons.call)],) ;
                }
                else {
                  return ListView(children: [_buildmissedcalls("asset/img/jj.jpg", "Bro", "Blocked", "Yesterday",Icons.block) ],) ;
                }
              }),
            )


          ],
        )


      ),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme() ,
      ),
    );
  }
}
Widget _buildcalls ( String image, String name,String typeofcall,String time){
  NavCons controller  = Get.find<NavCons>();
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
           CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(image),
          ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                    )),
                    Row(
                      children: [
                        Icon(Icons.call,color: Colors.green[300],),
                        Text(typeofcall,style: TextStyle(
                            fontSize: 11,
                            color: Colors.white
                        ))
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(time,style: TextStyle(
                              fontSize: 11,
                              color: Colors.white
                          )),
                        ),
                        Icon(Icons.call,color: Colors.green[300],),

                      ],
                    )
                  ],
                )
              ],
            ),
          )


        ),

      ],
    ),
  );
}
Widget _buildincomingcalls ( String image, String name,String typeofcall,String time){
  NavCons controller  = Get.find<NavCons>();
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(image),
          ),

        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(name,style: TextStyle(
                          fontSize: 15,
                          color: Colors.white
                      )),
                      Row(
                        children: [
                          Icon(Icons.call_missed_outgoing_outlined,color: Colors.green[300],),
                          Text(typeofcall,style: TextStyle(
                              fontSize: 11,
                              color: Colors.white
                          ))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(time,style: TextStyle(
                                fontSize: 11,
                                color: Colors.white
                            )),
                          ),
                          Icon(Icons.call,color: Colors.green[300],),

                        ],
                      )
                    ],
                  )
                ],
              ),
            )


        ),

      ],
    ),
  );
}
Widget _buildmissedcalls ( String image, String name,String typeofcall,String time,IconData Icon1){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
         CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(image),
          ),

        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,style: TextStyle(
                          fontSize: 15,
                          color: Colors.white
                      )),
                      Row(
                        children: [
                          Icon(Icons.call_missed,color: Colors.red,),
                          Text(typeofcall,style: TextStyle(
                              fontSize: 11,
                              color: Colors.white
                          ))
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(time,style: TextStyle(
                                fontSize: 11,
                                color: Colors.white
                            )),
                          ),
                          Icon(Icon1,color: Colors.red,),

                        ],
                      )
                    ],
                  )
                ],
              ),
            )


        ),

      ],
    ),
  );
}
