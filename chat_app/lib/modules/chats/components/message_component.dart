import 'package:flutter/material.dart';

class MessageComponent extends StatelessWidget {
  const MessageComponent({
    super.key,
    required this.content,
    required this.isOurs,
  });
  final String content;
  final bool isOurs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isOurs ? 40 : 0, right: !isOurs ? 40 : 0),
      child: Card(
        color: isOurs ? Colors.greenAccent : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              // Message text
              Padding(
                padding: const EdgeInsets.only(bottom: 18), // space for time
                child: Text(
                  "This is a messag",
                  style: TextStyle(fontSize: 16),
                ),
              ),

       
              Positioned(
                bottom: 0,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "10:45 PM",
                      style: TextStyle(fontSize: 11, color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    if (isOurs) Icon(Icons.done_all),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
