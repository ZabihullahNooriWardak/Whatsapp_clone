import 'package:chat_app/modules/chats/components/chat_tile.dart';
import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:chat_app/modules/chats/screens/chat_details_view.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.chats});
  final List<ChatModel> chats;
  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.chats.length,
      itemBuilder: (context, index) {
        return ChatTile(
          chatTile: widget.chats[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ChatDetailsView(chatModel: widget.chats[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
