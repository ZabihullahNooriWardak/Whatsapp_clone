import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});
  final ChatModel contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 55,
        width: 55,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
            if(contact.selected)
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightGreen,
                radius: 15,
                child: Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.about!),
    );
  }
}
