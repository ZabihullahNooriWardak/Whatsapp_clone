import 'package:chat_app/modules/chats/models/chat_model.dart';
import 'package:chat_app/modules/create_conversation/components/contact_card.dart';
import 'package:chat_app/modules/create_conversation/new_group/components/selected_avatar.dart';
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
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(height: selectedContacts.isNotEmpty ? 90 : 10);
              }
              return InkWell(
                onTap: () {
                  if (contacts[index - 1].selected) {
                    setState(() {
                      contacts[index - 1].selected = false;
                      selectedContacts.remove(contacts[index - 1]);
                    });
                  } else {
                    setState(() {
                      contacts[index - 1].selected = true;
                      selectedContacts.add(contacts[index - 1]);
                    });
                  }
                },
                child: ContactCard(contact: contacts[index - 1]),
              );
            },
          ),
          if (selectedContacts.isNotEmpty)
            Column(
              children: [
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: selectedContacts.length,
                    itemBuilder: (context, index) {
                      return SelectedContactAvatar(
                        contact: selectedContacts[index],
                        onRemovedClick: () {
                          setState(() {
                            selectedContacts[index].selected = false;
                            selectedContacts.remove(selectedContacts[index]);
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
