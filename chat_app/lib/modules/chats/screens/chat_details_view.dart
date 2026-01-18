import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ChatDetailsView extends StatefulWidget {
  const ChatDetailsView({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<ChatDetailsView> createState() => _ChatDetailsViewState();
}

class _ChatDetailsViewState extends State<ChatDetailsView> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  bool _emojiShowing = false;
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
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call_outlined)),
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
          ListView(), // Your chat messages
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Input field
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            margin: EdgeInsets.zero,
                            child: TextFormField(
                              scrollController: _scrollController,
                              controller: _controller,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type a message',
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                prefixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _emojiShowing = !_emojiShowing;
                                    });
                                  },
                                  child: Icon(Icons.emoji_emotions),
                                ),

                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
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
                    Offstage(
                      offstage: !_emojiShowing,
                      child: EmojiPicker(
                        textEditingController: _controller,
                        scrollController: _scrollController,
                        config: Config(
                          height: 256,
                          checkPlatformCompatibility: true,
                          viewOrderConfig: const ViewOrderConfig(),
                          emojiViewConfig: EmojiViewConfig(
                            // Issue: https://github.com/flutter/flutter/issues/28894
                            emojiSizeMax:
                                28 *
                                (foundation.defaultTargetPlatform ==
                                        TargetPlatform.iOS
                                    ? 1.2
                                    : 1.0),
                          ),
                          skinToneConfig: const SkinToneConfig(),
                          categoryViewConfig: const CategoryViewConfig(),
                          bottomActionBarConfig: const BottomActionBarConfig(),
                          searchViewConfig: const SearchViewConfig(),
                        ),
                      ),
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
}
