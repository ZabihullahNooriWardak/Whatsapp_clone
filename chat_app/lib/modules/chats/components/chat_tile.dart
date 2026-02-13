import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, required this.chatTile, required this.onTap});

  final ChatModel chatTile;


  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 25,
              child: Icon(
                chatTile.isGroup ? Icons.group : Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
            title: Text(
              chatTile.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 10),
                Text(chatTile.currentMessage!),
              ],
            ),
            trailing: Text(chatTile.time!),
          ),
          Padding(
            padding: EdgeInsets.only(left: 80, right: 20),
            child: Divider(thickness: 1.5),
          ),
        ],
      ),
    );
  }
}
