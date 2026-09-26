import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String name;
  final String profilePic;
  final String about;
  final String phone;

  const Profile({
    super.key,
    this.name = 'Akans Noro',
    this.profilePic = 'asset/img/status1.jpg',
    this.about = 'Hey there! I am using WhatsApp.',
    this.phone = '+234 801 234 5678',
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
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),

            // Profile Avatar with Camera Overlay Button
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundImage: AssetImage(profilePic),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: Colors.green[600],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Name Tile
            _buildProfileTile(
              label: 'Name',
              value: name,
              showEditIcon: true,
              onEditTap: () {},
            ),

            const SizedBox(height: 12),

            // About Tile
            _buildProfileTile(
              label: 'About',
              value: about,
              showEditIcon: true,
              onEditTap: () {},
            ),

            const SizedBox(height: 12),

            // Phone Tile
            _buildProfileTile(
              label: 'Phone',
              value: phone,
              showEditIcon: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile({
    required String label,
    required String value,
    bool showEditIcon = false,
    VoidCallback? onEditTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              if (showEditIcon)
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blueGrey, size: 20),
                  onPressed: onEditTap ?? () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
