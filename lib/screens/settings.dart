import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/screens/profile.dart';

class Settings extends StatelessWidget {
  final String name;
  final String profilePic;
  final String statusMessage;

  const Settings({
    super.key,
    this.name = 'Akans Noro',
    this.profilePic = 'asset/img/status1.jpg',
    this.statusMessage = 'Hey there! I am using WhatsApp.',
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // User Profile Header Tile
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: InkWell(
                onTap: (){
                  Get.to(()=> Profile());
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(profilePic),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            statusMessage,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),

            // Settings Options List
            _buildSettingsTile(
              icon: Icons.key_outlined,
              title: 'Account',
              subtitle: 'Security notifications, change number',
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.lock_outlined,
              title: 'Privacy',
              subtitle: 'Block contacts, disappearing messages',
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.face_outlined,
              title: 'Avatar',
              subtitle: 'Create, edit, profile photo',
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.chat_outlined,
              title: 'Chats',
              subtitle: 'Theme, wallpapers, chat history',
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              subtitle: 'Message, group & call tones',
              onTap: () {},
            ),
            _buildSettingsTile(
              icon: Icons.data_saver_off_outlined,
              title: 'Storage and data',
              subtitle: 'Network usage, auto-download',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF075E54),
              size: 24,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
