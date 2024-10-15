class ChatUsers {
  String text;
  String secondaryText;
  String image;
  String time;
  bool isRead;
  int unreadCount;
  ChatUsers({
    required this.text,
    required this.secondaryText,
    required this.image,
    required this.time,
    required this.isRead,
    required this.unreadCount,
  });
}


class ChatMessage{
  String messageContent;
  String messageType;
    String time;
    
  ChatMessage({required this.messageContent, required this.messageType,required this.time});
}