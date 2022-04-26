
import 'package:final_project/views/all_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/all_controller.dart';

class ChatScreen extends StatelessWidget {
  static const rountename='/chat_screen';

  final ChatController _controller=Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    // _controller.getChatting();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Obx(()=>ListView.builder(
        reverse: true,
        itemCount: _controller.chatModel.value.brandList?.length??0,
        itemBuilder: (context, index) => ListTile(title: Text(_controller.chatModel.value.brandList![index].brandName??''),


    ))),
    );
  }
}
