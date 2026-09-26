import 'package:flutter/material.dart';

class VideoCall extends StatelessWidget {
  final String bgPic;
  final String userImage;
  final String? name;

  const VideoCall({
    super.key,
     this.bgPic = 'asset/img/lll.jpg',
    this.userImage = 'asset/img/status4.jpg',
    this.name,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Full Screen Main Caller Video Display
            Positioned.fill(
              child: Image.asset(
                bgPic,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,

              ),
            ),

            // Subtle Gradient Overlay at Top for Header Visibility
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 100,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            // Top Control Bar: Back Arrow, Encryption Indicator, Switch Camera
            Positioned(
              top: 10,
              left: 12,
              right: 12,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () => Navigator.maybePop(context),
                  ),
                  const Spacer(),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 13,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'End-to-end encrypted',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.cameraswitch_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Picture-in-Picture (PiP) Inset Video Window
            Positioned(
              top: 70,
              right: 16,
              child: Container(
                width: 105,
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white30, width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    userImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,

                  ),
                ),
              ),
            ),

            // Bottom Action Control Panel
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF1B1E22),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Handle Indicator
                    const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white54,
                      size: 22,
                    ),
                    const SizedBox(height: 12),

                    // Action Controls Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildControlButton(
                          icon: Icons.camera_alt_outlined,
                          onTap: () {},
                        ),
                        _buildControlButton(
                          icon: Icons.mic_off_rounded,
                          onTap: () {},
                        ),
                        _buildControlButton(
                          icon: Icons.videocam_rounded,
                          onTap: () {},
                        ),

                        // End Call Button
                        InkWell(
                          onTap: () => Navigator.maybePop(context),
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 58,
                            height: 58,
                            decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.call_end,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
