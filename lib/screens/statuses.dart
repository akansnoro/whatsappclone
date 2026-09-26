import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/screens/userProfile.dart';

class Statuses extends StatelessWidget {
  final String name;
  final String profilePic;
  final String statusImage;
  final String time;
  final String caption;
  final String number;

  const Statuses({
    super.key,
    required this.name,
    required this.profilePic,
    required this.statusImage,
    required this.time,
    required this.caption,
    required this.number
  });


  ImageProvider _getImageProvider(String path) {
      return AssetImage(path);
  }

  Widget _buildStatusImageWidget(String path) {
      return Image.asset(
        path,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[900],
          child: const Center(
            child: Icon(Icons.image, color: Colors.white54, size: 50),
          ),
        ),
      );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Top Status Progress Bar Indicator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Top Header: Profile Picture, Name, Time, and Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: InkWell(
                  onTap: (){
                    Get.to(()=>Userprofile(image: profilePic, name: name, number: number));
                  },
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 22),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => Navigator.maybePop(context),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: _getImageProvider(profilePic),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          time,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 6),

            // Status Main Image Display with Caption Overlay
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Status Image
                      _buildStatusImageWidget(statusImage),

                      // Caption Overlay Box
                      if (caption.isNotEmpty)
                        Positioned(
                          bottom: 30,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.45),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white12,
                                width: 0.8,
                              ),
                            ),
                            child: Text(
                              caption,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Bar: Reply Input Field & Heart Button
            Row(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.white54)
                            ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: Colors.white54)
                              ),
                              hintText: "Reply",
                              hintStyle: const TextStyle(color: Colors.white,fontSize: 13),

                          ),
                        ),),
                    )),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white, // Your border color (e.g. Colors.tealAccent, Colors.green)
                        width: 2.5,          // Border thickness
                      ),),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      child: IconButton(onPressed: (){},style: ElevatedButton.styleFrom(
                          fixedSize: Size(50, 50),
                          backgroundColor: Colors.black54,
                      ), icon:  Icon(Icons.favorite_border)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
