import 'package:chat_app/modules/create_conversation/screens/new_conversation_view.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final int index;

  const CustomFloatingActionButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return buildFloatingActionButton(context, index);
  }
}

Widget buildFloatingActionButton(BuildContext context, int index) {
  switch (index) {
    case 1:
      return FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return NewConversationView();
              },
            ),
          );
        },
        child: Icon(Icons.chat),
      );

    case 2:
      return FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.data_usage_outlined),
      );

    case 3:
      return FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.call_outlined),
      );

    default:
      return SizedBox.shrink();
  }
}
