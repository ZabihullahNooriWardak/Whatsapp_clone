import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, required this.conversationTile});
  final ChatModel conversationTile;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 25,
              child: Icon(
                conversationTile.isGroup ? Icons.group : Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
            title: Text(
              conversationTile.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 10),
                Text(conversationTile.currentMessage),
              ],
            ),
            trailing: Text(conversationTile.time),
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
