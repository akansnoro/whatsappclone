import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsappclone/models/navCon.dart';
import 'package:whatsappclone/screens/calls.dart';
import 'package:whatsappclone/screens/chats.dart';
import 'package:whatsappclone/screens/community.dart';
import 'package:whatsappclone/screens/status.dart';

class NavCons extends GetxController {
  RxInt selectedindex = 0.obs;
  var selectedButton = 0.obs;

  List<NavItem> NavItems = [
    NavItem(title: 'Chats', icon: Icons.camera_alt, selectedIcon: Icons.camera_alt,page: Chats()),
    NavItem(title: 'Status', icon: Iconsax.status, selectedIcon: Iconsax.status ,page: Status()),
    NavItem(title: 'Calls', icon: Icons.call, selectedIcon: Icons.call ,page: Calls()),
    NavItem(title: 'Community', icon: Icons.groups, selectedIcon: Icons.groups ,page: Community()),



  ];
}