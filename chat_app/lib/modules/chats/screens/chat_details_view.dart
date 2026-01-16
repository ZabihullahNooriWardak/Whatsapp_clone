import 'package:flutter/material.dart';

class ChatDetailsView extends StatefulWidget {
  const ChatDetailsView({super.key});

  @override
  State<ChatDetailsView> createState() => _ChatDetailsViewState();
}

class _ChatDetailsViewState extends State<ChatDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Chat details view ')));
  }
}
