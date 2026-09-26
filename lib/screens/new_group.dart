import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/screens/new_group2.dart';

class GroupContactItem {
  final String name;
  final String profilePic;
  final String status;
  final bool isSelected;

  const GroupContactItem({
    required this.name,
    required this.profilePic,
    required this.status,
    this.isSelected = false,
  });
}

class NewGroup extends StatefulWidget {
  final String? name;
  final String? profilePic;
  final List<GroupContactItem>? contacts;

  const NewGroup({
    super.key,
    this.name,
    this.profilePic,
    this.contacts,
  });

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  final Set<int> _selectedIndices = {};

  List<GroupContactItem> get _defaultContacts => [
        GroupContactItem(
          name: widget.name ?? 'Jane Smith',
          profilePic: widget.profilePic ?? 'asset/img/rrr.jpg',
          status: 'Hey there! I am using WhatsApp.',
        ),
        const GroupContactItem(
          name: 'John Doe',
          profilePic: 'asset/img/ii.jpg',
          status: 'Online',
        ),
        const GroupContactItem(
          name: 'Emily Johnson',
          profilePic: 'asset/img/eee.jpg',
          status: 'At the gym',
        ),
      ];

  ImageProvider _getImageProvider(String path) {
      return AssetImage(path);
  }

  @override
  Widget build(BuildContext context) {
    final displayContacts = widget.contacts ?? _defaultContacts;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'New group',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Add participants',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),

      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              // height: 40,
              child: TextField(
                decoration: InputDecoration(
                  hint: Text('Search name or number...',
                    style: TextStyle(fontSize: 20,color: Colors.grey),),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.search_rounded)
                  ),
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide: BorderSide(color: Color(0xFFD1D9D6))
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide: BorderSide(color: Color(0xFFD1D9D6))
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide: BorderSide(color: Color(0xFFD1D9D6))
                  ),

                ),
              ),
            ),
          ),

          // Contact List
          Expanded(
            child: ListView.builder(
              itemCount: displayContacts.length,
              itemBuilder: (context, index) {
                final item = displayContacts[index];
                final isSelected = _selectedIndices.contains(index);

                return InkWell(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedIndices.remove(index);
                      } else {
                        _selectedIndices.add(index);
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    color: isSelected
                        ? Colors.green.withValues(alpha: 0.12)
                        : Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      children: [
                        // Profile Picture
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: _getImageProvider(item.profilePic),
                        ),
                        const SizedBox(width: 14),

                        // Contact Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item.status,
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

                        // Selection Circle Indicator
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? Colors.green : Colors.grey.shade400,
                              width: 2.0,
                            ),
                            color: isSelected ? Colors.green : Colors.transparent,
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  size: 15,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  if(_selectedIndices.length < 1){
                    Get.snackbar(
                      'Selection Required',
                      'At least 1 participant must be added',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      margin: const EdgeInsets.all(12),
                      duration: const Duration(seconds: 2),
                    );
                    return;
                  }
                  Get.to(()=> NewGroup2());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  foregroundColor: Colors.white,
                  shape: const StadiumBorder(),
                  elevation: 2,
                ),
                child: Text(
                  _selectedIndices.isEmpty
                      ? 'Next'
                      : 'Next (${_selectedIndices.length})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
