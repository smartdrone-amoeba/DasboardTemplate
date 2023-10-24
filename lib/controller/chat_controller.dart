import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webui/controller/my_controller.dart';
import 'package:webui/helper/utils/generator.dart';
import 'package:webui/models/chat_data.dart';

class ChatController extends MyController {
  ScrollController? scrollController;
  List<Chat> chat = [];
  Chat? singleChat;
  late Timer _timer;
  int _nowTime = 0;
  String timeText = "00 : 00";

  bool isAudioOn = false, isVideoOn = true;

  TextEditingController messageController = TextEditingController();

  void sendMessage() {
    chat.add(
      Chat(
        -1,
        "",
        "",
        DateTime.now(),
        messageController.text,
        "",
        '',
        true,
      ),
    );
    messageController.clear();
    scrollToBottom(isDelayed: true);
    update();
  }

  void onChangeChat(Chat singleChatData) {
    singleChat = singleChatData;
    update();
  }

  scrollToBottom({bool isDelayed = false}) {
    final int delay = isDelayed ? 400 : 0;
    Future.delayed(Duration(milliseconds: delay), () {
      scrollController!.animateTo(scrollController!.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubicEmphasized);
    });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      _nowTime = _nowTime + 1;
      timeText = Generator.getTextFromSeconds(time: _nowTime);
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    Chat.dummyList.then((value) {
      chat = value.sublist(0, 10);
      singleChat = chat[0];
      update();
    });
    scrollController = ScrollController();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
