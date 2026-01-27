class ChatModel {
  String name;
  String? icon;
  bool isGroup;
  String? time;
  String ?currentMessage;
  String? status;
  ChatModel({
    required this.name,
     this.isGroup=false,
     this.time,
     this.currentMessage,
    this.icon,
    this.status
  });
}
