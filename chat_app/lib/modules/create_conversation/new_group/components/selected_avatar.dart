import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:flutter/material.dart';

class SelectedContactAvatar extends StatelessWidget {
  const SelectedContactAvatar({
    super.key,
    required this.contact,
    required this.onRemovedClick,
  });
  final ChatModel contact;
  final Function onRemovedClick;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                child: Icon(Icons.person, size: 30),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  onRemovedClick();
                },
                child: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.close),
                ),
              ),
            ),
          ],
        ),
        Text(contact.name),
      ],
    );
  }
}
