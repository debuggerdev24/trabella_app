// lib/providers/chat_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessage {
  final String messageContent;
  final String messageType; 
  final String time;

  ChatMessage({
    required this.messageContent,
    required this.messageType,
    required this.time,
  });
}

class ChatProvider with ChangeNotifier {
  double _currentFontSize = 15.sp;

  double get currentFontSize => _currentFontSize;

  void increaseFontSize() {
    _currentFontSize += 2.sp;
    notifyListeners();
  }

  void decreaseFontSize() {
    if (_currentFontSize > 10.sp) { 
      _currentFontSize -= 2.sp;
      notifyListeners();
    }
  }

  final List<ChatMessage> _messages = [
    ChatMessage(
        messageContent:
            "Hey Rebecca, lovely to connect. Would love to see you when you are in Portugal next!",
        messageType: "receiver",
        time: "02:25 PM"),
    ChatMessage(
        messageContent: "Hey Thalia! How are you?",
        messageType: "sender",
        time: "03:02 PM"),
    ChatMessage(
        messageContent:
            "Good thank you! How are you? I’m going to Lisbon next month. Do you want to catch up?",
        messageType: "receiver",
        time: "02:25 PM"),
    ChatMessage(
        messageContent: "ehhhh, doing OK.",
        messageType: "sender",
        time: "02:25 PM"),
    ChatMessage(
        messageContent: "Absolutely! I’ll call you!",
        messageType: "receiver",
        time: "02:25 PM"),
  ];

  List<ChatMessage> get messages => _messages;

  void addMessage(ChatMessage message) {
    _messages.add(message);
    notifyListeners();
  }
}
