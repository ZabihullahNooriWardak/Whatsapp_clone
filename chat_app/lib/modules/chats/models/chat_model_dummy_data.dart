import 'package:chat_app/modules/chats/models/chat_model.dart';

List<ChatModel> chatModelDummyData = [
  ChatModel(
    name: "John Doe",
    isGroup: false,
    time: "10:30 AM",
    currentMessage: "Hey, how are you?",
  ),
  ChatModel(
    name: "Flutter Devs",
    isGroup: true,
    time: "09:15 AM",
    currentMessage: "Standup meeting at 10",
  ),
  ChatModel(
    name: "Emma Watson",
    isGroup: false,
    time: "Yesterday",
    currentMessage: "Can you send the files?",
  ),
  ChatModel(
    name: "Family Group",
    isGroup: true,
    time: "Yesterday",
    currentMessage: "Dinner at 8 PM 🍽️",
  ),
  ChatModel(
    name: "Michael Scott",
    isGroup: false,
    time: "Monday",
    currentMessage: "That’s what she said!",
  ),
  ChatModel(
    name: "Project Alpha",
    isGroup: true,
    time: "Sunday",
    currentMessage: "Deadline is approaching",
  ),
];
