import 'package:chat_app/modules/chats/models/chat_model.dart';

List<ChatModel> chatModelDummyData = [
  ChatModel(
    name: "John Doe",
    isGroup: false,
    time: "10:30 AM",
    currentMessage: "Hey, how are you?",
    id: 1
  ),
  ChatModel(
    name: "Flutter Devs",
    isGroup: true,
    time: "09:15 AM",
    currentMessage: "Standup meeting at 10",
    id: 2
  ),
  ChatModel(
    name: "Emma Watson",
    isGroup: false,
    time: "Yesterday",
    currentMessage: "Can you send the files?",
    id: 3
  ),
  ChatModel(
    name: "Family Group",
    isGroup: true,
    time: "Yesterday",
    currentMessage: "Dinner at 8 PM 🍽️",
    id: 4
  ),
  ChatModel(
    name: "Michael Scott",
    isGroup: false,
    time: "Monday",
    currentMessage: "That’s what she said!",
    id: 5
  ),
  ChatModel(
    name: "Project Alpha",
    isGroup: true,
    time: "Sunday",
    currentMessage: "Deadline is approaching",
    id: 6
  ),
];
