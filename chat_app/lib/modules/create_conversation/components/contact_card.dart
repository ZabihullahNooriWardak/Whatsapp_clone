import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        child: Icon(Icons.person),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      title: Text(contact.name),
      subtitle: Text(contact.status!),
    );
  }
}
