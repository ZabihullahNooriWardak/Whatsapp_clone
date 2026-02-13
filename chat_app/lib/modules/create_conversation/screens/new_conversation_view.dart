import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:chat_app/modules/create_conversation/components/contact_card.dart';
import 'package:chat_app/modules/create_conversation/components/header_tile.dart';
import 'package:flutter/material.dart';

class NewConversationView extends StatefulWidget {
  const NewConversationView({super.key});

  @override
  State<NewConversationView> createState() => _NewConversationViewState();
}

class _NewConversationViewState extends State<NewConversationView> {
  List<ChatModel> contacts = [
    ChatModel(name: 'Ali', about: 'Full stack developer', id: 1),
    ChatModel(name: 'Kalid', about: 'Life is nice', id: 2),
    ChatModel(name: 'Wali', about: 'Stay strong baby', id: 3),
    ChatModel(name: 'Ahmad', about: 'Mindset is everything', id: 4),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Contact'),
            Text('255 contacts', style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton(
            onSelected: (value) {},
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {},
                  value: 'invite',
                  child: Text('Invite a friend'),
                ),
                PopupMenuItem(
                  onTap: () {},
                  value: 'contacts',
                  child: Text('Contacts'),
                ),
                PopupMenuItem(
                  onTap: () {},
                  value: 'refresh',
                  child: Text('Refresh'),
                ),
                PopupMenuItem(onTap: () {}, child: Text('Help'), value: 'help'),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return HeaderTile(name: 'New group', icon: Icons.group);
          }
          if (index == 1) {
            return HeaderTile(name: 'New contact', icon: Icons.person_add);
          }
          return ContactCard(contact: contacts[index - 2]);
        },
      ),
    );
  }
}
