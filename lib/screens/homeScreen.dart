import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsappclone/screens/chats.dart';
import 'package:whatsappclone/screens/navscreen.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override

  Widget build(BuildContext context) {
    TextEditingController phonecontroller = TextEditingController();
    final _phone = GlobalKey<FormState>();

    return
       Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: ()=> Get.back()
          , icon: Icon(Icons.arrow_back), ),

        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 10,),
                      Text('Welcome👋',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34
                      ),),
                      Text('connect with friends and',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87
                      )),
                      Text('the world around you',style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87
                      )),
                      Image.asset('asset/img/homepic.png',
                        width: double.infinity,
                        height: 230,

                      ),
                      Form(
                        key: _phone,
                          child: TextFormField(
                            // style: TextStyle(color: Color(0xFFFFFFFF)),
                            validator: ((value) {
                              if(value==null ||value.isEmpty ){
                                return  "Enter your Phone Number";

                              }
                              if(value.length!=11){
                                return  "Enter a valid Phone Number";
                              }
                              return null;
                            }),
                            controller: phonecontroller,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                hintText:'Phone Number',
                                prefixIcon:  Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: DropdownButton<String>(
                                    value: '+234',
                                    underline: SizedBox(),
                                    items: [
                                      DropdownMenuItem(child: Text('+234'),
                                        value: '+234',),
                                      DropdownMenuItem(child: Text('+1'),
                                        value: '+1',),
                                      DropdownMenuItem(child: Text('+543'),
                                        value: '+543',),
                                      DropdownMenuItem(child: Text('+765'),
                                        value: '+765',),
                                    ],
                                    onChanged: (value) {

                                    },
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(color: Color(0x9FC6C6B6)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(color: Color(0x9FC6C6B6)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(color: Color(0x9FC6C6B6)),
                                )

                            ),
                          )),


                    ],
                  ),

                ),
              ),
            ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(onPressed: (){
                            if(_phone.currentState!.validate()){
                              Get.to(Navscreen());
                            }
                          },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                shape: const StadiumBorder(),
                                elevation: 2,
                              )

                              , child:
                              Text("Continue")
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: Text('or continue with',style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87
                        )),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(onPressed: (){}, icon: SvgPicture.asset("asset/icon/Google__G__logo.svg",height: 30,width: 30,),),
                          IconButton(onPressed: (){}, icon:  SvgPicture.asset("asset/icon/Apple_Inc.-Logo.wine.svg",height: 30,width: 30),),
                          IconButton(onPressed: (){}, icon: SvgPicture.asset("asset/icon/email.svg",height: 30,width: 30),)

                        ],
                      ),




          ],
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Text(
            'end to end encryption',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
      );

  }
}
