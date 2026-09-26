import 'package:flutter/material.dart';

class VoiceCall extends StatelessWidget {
  final String name;
  final String profilePic;
  final String duration;

  const VoiceCall({
    super.key,
    required this.name,
    required this.profilePic,
    required this.duration,
  });

  ImageProvider _getImageProvider(String path) {
      return AssetImage(path);
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF074E3E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            children: [
              // Top Bar: Down Chevron & Encryption Status
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () => Navigator.maybePop(context),
                    ),
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock,
                        color: Colors.white70,
                        size: 13,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'End-to-end encrypted',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Spacer(flex: 2),

              // Profile Picture
              CircleAvatar(
                radius: 65,
                backgroundImage: _getImageProvider(profilePic),
              ),

              const SizedBox(height: 20),

              // Contact Name
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),

              const SizedBox(height: 8),

              // Call Duration
              Text(
                duration,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),

              const Spacer(flex: 3),

              // Action Buttons: Speaker, Video, Mute
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    icon: Icons.volume_up_rounded,
                    label: 'Speaker',
                    onTap: () {},
                  ),
                  _buildActionButton(
                    icon: Icons.videocam_rounded,
                    label: 'Video',
                    onTap: () {},
                  ),
                  _buildActionButton(
                    icon: Icons.mic_off_rounded,
                    label: 'Mute',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // End Call Button
              InkWell(
                onTap: () => Navigator.maybePop(context),
                borderRadius: BorderRadius.circular(35),
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.call_end,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
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
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
