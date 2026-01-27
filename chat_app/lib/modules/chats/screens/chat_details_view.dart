import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatDetailsView extends StatefulWidget {
  const ChatDetailsView({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<ChatDetailsView> createState() => _ChatDetailsViewState();
}

class _ChatDetailsViewState extends State<ChatDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: InkWell(
          onTap: () {},
          child: Row(
            children: [
              BackButton(),
              CircleAvatar(
                radius: 20,
                child: Icon(
                  widget.chatModel.isGroup ? Icons.group : Icons.person,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.chatModel.name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'last seen today at 12:00 AM',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text('Search')),
                PopupMenuItem(child: Text('Mute notification')),
              ];
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            margin: EdgeInsets.zero,
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type a message',
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                prefixIcon: InkWell(
                                  onTap: () {},
                                  child: Icon(Icons.emoji_emotions),
                                ),

                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        _showBottomSheet();
                                      },
                                      icon: Icon(Icons.attach_file),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.camera_alt),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(radius: 25, child: Icon(Icons.mic)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showBottomSheet() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          child: Card(
            margin: EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomSheetIcon(
                      Icons.insert_drive_file,
                      Colors.blueGrey,
                      'Documents',
                    ),
                    _buildBottomSheetIcon(
                      Icons.camera_alt,
                      const Color.fromARGB(255, 161, 10, 83),
                      'Camera',
                    ),
                    _buildBottomSheetIcon(
                      Icons.image,
                      Colors.deepPurple,
                      'Gallery',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomSheetIcon(
                      Icons.headphones,
                      Colors.orange,
                      'Audio',
                    ),
                    _buildBottomSheetIcon(
                      Icons.location_on_rounded,
                      Colors.purpleAccent,
                      'Location',
                    ),
                    _buildBottomSheetIcon(Icons.person, Colors.blue, 'Contact'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetIcon(IconData icon, Color color, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(icon),
          foregroundColor: Colors.white,
        ),
        SizedBox(height: 10),
        Text(title),
      ],
    );
  }
}
