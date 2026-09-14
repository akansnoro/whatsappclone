import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsappclone/controllers/nav_con.dart';

class Navscreen extends StatelessWidget {
  const Navscreen({super.key});

  @override
  Widget build(BuildContext context) {


    NavCons controller = Get.put(NavCons());

    return MaterialApp(
      home: Scaffold(
        body: Obx(()=>controller.NavItems[controller.selectedindex.value].page),
        bottomNavigationBar: Obx(
              (){
                bool currentindex = controller.selectedindex.value == 0 || controller.selectedindex.value==3;
                bool Pagecolour = controller.selectedindex.value==1 || controller.selectedindex.value==2;


                return NavigationBarTheme(
                  data: NavigationBarThemeData(
                    labelTextStyle: WidgetStateProperty.resolveWith((states){
                  if (states.contains(WidgetState.selected)) {
                    if (currentindex){
                      return TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight(400));
                    }
                    else if (Pagecolour){
                      return TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight(400));
                    }
                    return TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight(400));
                  }
                  return TextStyle(color: Colors.grey,fontSize: 12);
                  }),
                  ),
                  child: NavigationBar(
                      selectedIndex: controller.selectedindex.value,
                      onDestinationSelected: (newtappedvalue){
                        controller.selectedindex.value = newtappedvalue;
                      },
                      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                      indicatorColor: controller.selectedindex.value==1 || controller.selectedindex.value==2
                          ? Colors.green[400]
                          :Colors.transparent,
                      backgroundColor: controller.selectedindex.value==1 || controller.selectedindex.value==2
                          ? Colors.green[500]
                          : Colors.white,


                      destinations: [
                        ...controller.NavItems.map((Items)=>NavigationDestination
                          (icon: Icon(Items.icon,color: Colors.grey,),
                            selectedIcon: Icon(Items.selectedIcon,color: controller.selectedindex.value==1 || controller.selectedindex.value==2
                                ? Colors.white
                                :Theme.of(context).primaryColor,) ,
                            label: Items.title)),

                      ]),
                );
              }

        //           return NavigationBarTheme(
        //         data: NavigationBarThemeData(
        //     labelTextStyle: WidgetStateProperty.all(
        //     TextStyle(color: labelColor,fontSize: 12)
        //
        // ),
        // ),
        //         child: NavigationBar(
        //         selectedIndex: controller.selectedindex.value,
        //         onDestinationSelected: (newtappedvalue){
        //           controller.selectedindex.value = newtappedvalue;
        //         },
        //         labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        //         indicatorColor: controller.selectedindex.value==1 || controller.selectedindex.value==2
        //             ? Colors.green[400]
        //             :Colors.transparent,
        //             backgroundColor: controller.selectedindex.value==1 || controller.selectedindex.value==2
        //             ? Colors.green[600]
        //             : Colors.white,
        //
        //
        //         destinations: [
        //           ...controller.NavItems.map((Items)=>NavigationDestination
        //             (icon: Icon(Items.icon,color: Colors.grey,),
        //               selectedIcon: Icon(Items.selectedIcon,color: controller.selectedindex.value==1 || controller.selectedindex.value==2
        //                   ? Colors.white
        //                   :Theme.of(context).primaryColor,) ,
        //               label: Items.title)),
        //
        //         ]),
        //       ),
        ),

      ),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme() ,
      ),
    );

  }
}
