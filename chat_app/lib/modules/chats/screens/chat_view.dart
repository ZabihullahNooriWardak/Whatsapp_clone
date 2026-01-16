import 'package:chat_app/modules/chats/components/chat_tile.dart';
import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:chat_app/modules/chats/models/chat_model_dummy_data.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<ChatModel> conversations = chatModelDummyData;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: conversations.length,
      itemBuilder: (context, index) {
        return ChatTile(conversationTile: conversations[index]);
      },
    );
  }
}
