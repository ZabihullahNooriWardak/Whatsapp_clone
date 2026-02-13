import 'package:chat_app/modules/chats/components/message_component.dart';
import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatDetailsView extends StatefulWidget {
  const ChatDetailsView({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<ChatDetailsView> createState() => _ChatDetailsViewState();
}

class _ChatDetailsViewState extends State<ChatDetailsView> {
  late IO.Socket socket;

  bool isSendButtonVisible = false;

  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectSocket();
  }

  void connectSocket() {
    socket = IO.io(
      "http://192.168.0.8:3000",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );
    socket.connect();

    socket.onConnect((_) {
      print('connected from flutter print');
    });

    socket.on("message_from_node", (data) {
      print(data);
    });
    socket.onDisconnect((_) {
      print('disconnected from flutter print');
    });
  }

  void sendMessage() {
    try {
      socket.emit('message_from_flutter', {
        "msg": "Hello from flutter ",
        "time": DateTime.now().toString(),
      });
    } catch (e, s) {
      print(e);
      print('trance:');
      print(s);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    socket.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
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
          Image.asset(
            'assets/images/wb.jpg',
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              MessageComponent(isOurs: true, content: "Hi"),
              MessageComponent(content: 'How are you', isOurs: false),
              MessageComponent(
                content:
                    'how you prepared for tommorrow exam it will be very soon tommorrow morning and i think you studied alot for this ',
                isOurs: true,
              ),
            ],
          ),
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
                              controller: controller,
                              onChanged: (value) {
                                if (controller.text.isNotEmpty) {
                                  setState(() {
                                    isSendButtonVisible = true;
                                  });
                                } else {
                                  setState(() {
                                    isSendButtonVisible = false;
                                  });
                                }
                              },
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type a message',
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                prefixIcon: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.emoji_emotions,
                                    color: Colors.grey,
                                  ),
                                ),

                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        _showBottomSheet();
                                      },
                                      icon: Icon(
                                        Icons.attach_file,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            print('sending');
                            sendMessage();
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.green,
                            child: Icon(isSendButtonVisible ? Icons.send:Icons.mic, color: Colors.white),
                          ),
                        ),
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
