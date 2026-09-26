import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/screens/navscreen.dart';

class ChannelCreated extends StatelessWidget {
  final String channelName;
  final String profilePic;
  final String followers;
  final String about;
  final String publicLink;

  ChannelCreated({
    super.key,
    required this.channelName,
    String? name,
    required this.profilePic,
    this.followers = '12.4K followers',
    required this.about,
    this.publicLink = 'wa.me/channel/techupdates',
  });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Green Banner with Overlapping Profile Avatar
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                // Top Green Background
                Container(
                  height: 120,
                  color: Colors.green[600],
                  padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.maybePop(context),
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                // Overlapping Circular Profile Avatar
                Positioned(
                  bottom: -45,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage(profilePic),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 55),

            // Channel Title with Verified Badge
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        channelName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.verified,
                        color: Colors.green,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Channel • $followers',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Action Buttons: Mute, Share, More
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.notifications_none_outlined,
                  label: 'Mute',
                  onTap: () {},
                ),
                _buildActionButton(
                  icon: Icons.reply,
                  label: 'Share',
                  onTap: () {},
                ),
                _buildActionButton(
                  icon: Icons.more_horiz,
                  label: 'More',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 28),

            const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),

            // Channel Details Sections
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // About Section
                  const Text(
                    'About',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  if(about.isNotEmpty)
                  Text(
                    about,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Public Link Section
                  const Text(
                    'Public link',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    publicLink,
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Media Section
                  const Text(
                    'Media',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 200,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {

                      Get.to(()=> Navscreen());

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      foregroundColor: Colors.white,
                      shape: const StadiumBorder(),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            width: 85,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFE0E0E0), width: 1.2),
            ),
            child: Icon(
              icon,
              color: Colors.green[700],
              size: 22,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
