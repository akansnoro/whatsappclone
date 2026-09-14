import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[600],
        appBar: AppBar(
          backgroundColor: Colors.green[600],
          title: Text('Status',style: TextStyle(
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
          crossAxisAlignment: .start,
          children: [
            Divider(
              color: Colors.white10,
              thickness: 1,
              height: 1,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: .start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('asset/img/homepic.png'),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text("My status",style: TextStyle(
                      fontSize: 15,
                          color: Colors.white
                    )),
                        Text("Tap to add status update",style: TextStyle(
                            fontSize: 11,
                            color: Colors.white
                        ))
                      ],
                    ),
                  )

                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 500,
                child: Divider(
                  color: Colors.white10,
                  thickness: 1,
                  height: 1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Recent Updates",style: TextStyle(
                fontWeight: .bold,
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 16

              ),),
            ),
            _buildstatusitem('asset/img/images1.png', "Jane Smith", "Just now"),
            _buildstatusitem('asset/img/ii.jpg', 'John Doe', '10 minutes ago'),
            _buildstatusitem('asset/img/rrr.jpg', "Besties", "25 minutes ago"),
            _buildstatusitem("asset/img/eee.jpg", "Emily Johnson", '1 hour ago')

          ],
        ),
        floatingActionButton:  Column(
          mainAxisAlignment: .end,
          children: [
            FloatingActionButton(
              mini: true,
              onPressed: (){},
              backgroundColor: Colors.white,
              foregroundColor: Colors.green,
              child: Icon(Icons.create,),
              shape: StadiumBorder(),

            ),
            SizedBox(height: 10,),
            FloatingActionButton(

              onPressed: (){},
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              child: Icon(Icons.camera_alt,),
              shape: StadiumBorder(),

            ),
          ],
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
        // floatingActionButton:  FloatingActionButton(
        //
        //   onPressed: (){},
        //   backgroundColor: Colors.white,
        //   foregroundColor: Colors.green,
        //   child: Icon(Icons.create,),
        //   shape: StadiumBorder(),
        //
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,


      ),


      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme() ,
      ),
    );
  }
}
Widget _buildstatusitem (String image,String name,String time)
{
  return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: .start,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.tealAccent,
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(name,style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
              )),
              Text(time,style: TextStyle(
                  fontSize: 11,
                  color: Colors.white
              ))
            ],
          ),
        )

      ],
    ),
  );
}
