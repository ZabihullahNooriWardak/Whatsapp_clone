import 'package:chat_app/modules/chats/widgets/conversation_tile.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [ConversationTile(), ConversationTile(), ConversationTile()],
    );
  }
}
