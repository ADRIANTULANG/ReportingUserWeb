import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responderuserweb/src/chat_screen/controller/chat_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../../history_screen/view/history_main_view.dart';
import '../../../../sidebar_wrapper_screen/controller/sidebar_wrapper_controller.dart';

class ChatPortraitPage extends GetView<ChatController> {
  const ChatPortraitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.find<SideBarController>().currentRoute.value =
                HistoryMainPage.id;
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.chatList.length,
                      shrinkWrap: true,
                      controller: controller.scrollController,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                left: 14,
                                right: 14,
                                top: 10,
                              ),
                              child: controller.chatList[index].type == "text"
                                  ? Align(
                                      alignment:
                                          (controller.chatList[index].sender !=
                                                  controller.userID
                                              ? Alignment.topLeft
                                              : Alignment.topRight),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: (controller
                                                      .chatList[index].sender !=
                                                  controller.userID
                                              ? Colors.blue
                                              : const Color.fromARGB(
                                                  255, 178, 220, 240)),
                                        ),
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          controller.chatList[index].chats,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    )
                                  : Align(
                                      alignment:
                                          (controller.chatList[index].sender !=
                                                  controller.userID
                                              ? Alignment.topLeft
                                              : Alignment.topRight),
                                      child: Container(
                                        height: 30.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(controller
                                                    .chatList[index].url))),
                                        padding: const EdgeInsets.all(16),
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 4.w,
                                right: 4.w,
                              ),
                              child: Align(
                                  alignment:
                                      (controller.chatList[index].sender !=
                                              controller.userID
                                          ? Alignment.topLeft
                                          : Alignment.topRight),
                                  child: Text(
                                    "${DateFormat('yMMMd').format(controller.chatList[index].datecreated)} ${DateFormat('jm').format(controller.chatList[index].datecreated)}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontSize: 5.sp),
                                  )),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 10.h,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: 3,
                      offset: Offset(1, 2))
                ]),
                padding: EdgeInsets.only(bottom: 2.h, left: 3.w, right: 3.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 6.h,
                      width: 80.w,
                      child: TextField(
                        controller: controller.message,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.only(left: 3.w),
                            alignLabelWithHint: false,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            hintText: 'Type something..'),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          controller.sendImage();
                        },
                        child: const Icon(Icons.attachment)),
                    InkWell(
                        onTap: () {
                          controller.sendMessage(
                              messagetosend: controller.message.text);
                        },
                        child: const Icon(Icons.send))
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
