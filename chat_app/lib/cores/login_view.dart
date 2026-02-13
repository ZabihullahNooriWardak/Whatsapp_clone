import 'package:chat_app/cores/home_view.dart';
import 'package:chat_app/modules/chats/components/chat_tile.dart';
import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  List<ChatModel> chats = [
    ChatModel(
      name: "John Doe",
      isGroup: false,
      time: "10:30 AM",
      currentMessage: "Hey, how are you?",
      id: 1,
    ),

    ChatModel(
      name: "Emma Watson",
      isGroup: false,
      time: "Yesterday",
      currentMessage: "Can you send the files?",
      id: 2,
    ),

    ChatModel(
      name: "Michael Scott",
      isGroup: false,
      time: "Monday",
      currentMessage: "That’s what she said!",
      id: 3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ChatTile(
            chatTile: chats[index],
            onTap: () {
              final selectedChat = chats.removeAt(index);
              
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen(chats: chats);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
