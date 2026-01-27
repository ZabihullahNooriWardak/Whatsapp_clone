import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:chat_app/modules/create_conversation/components/contact_card.dart';
import 'package:chat_app/modules/create_conversation/components/header_tile.dart';
import 'package:flutter/material.dart';

class CreateGroupView extends StatefulWidget {
  const CreateGroupView({super.key});

  @override
  State<CreateGroupView> createState() => _CreateGroupViewState();
}

class _CreateGroupViewState extends State<CreateGroupView> {
  List<ChatModel> contacts = [
    ChatModel(name: 'Ali', about: 'Full stack developer'),
    ChatModel(name: 'Kalid', about: 'Life is nice'),
    ChatModel(name: 'Wali', about: 'Stay strong baby'),
    ChatModel(name: 'Ahmad', about: 'Mindset is everything'),
  ];
  List<ChatModel> selectedContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New Group'),
            Text('Add participants', style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (contacts[index].selected) {
                setState(() {
                  contacts[index].selected = false;
                  selectedContacts.remove(contacts[index]);
                });
              } else {
                setState(() {
                  contacts[index].selected = true;
                  selectedContacts.add(contacts[index]);
                });
              }
            },
            child: ContactCard(contact: contacts[index]),
          );
        },
      ),
    );
  }
}
