import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:responderuserweb/src/chat_screen/views/chat_main_page.dart';
import 'package:sizer/sizer.dart';
import '../../../../chat_screen/controller/chat_controller.dart';
import '../../../../history_screen/view/history_main_view.dart';
import '../../../../sidebar_wrapper_screen/controller/sidebar_wrapper_controller.dart';
import '../../../controller/report_details_controller.dart';
import '../widget/report_details_portrait_alertdialog.dart';

class ReportDetailsPortraitPage extends GetView<ReportDetailsController> {
  const ReportDetailsPortraitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: Obx(
              () => GoogleMap(
                markers: controller.markers.toSet(),
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.defaultLatitude.value,
                      controller.defaultLongitude.value),
                  zoom: 12.4746,
                ),
                onMapCreated: (GoogleMapController gController) {
                  if (controller.completerController.isCompleted == false) {
                    controller.completerController.complete(gController);
                  }
                  controller.mapController = gController;
                },
              ),
            ),
          ),
          Obx(
            () => controller.isShowContainer.value
                ? Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 0), // changes x,y position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 2.w, right: 2.w, top: 2.h, bottom: .5.h),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      controller.reportDetails!.type,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Text(
                                      " (${controller.reportDetails!.status})",
                                      style: TextStyle(
                                        color:
                                            controller.reportDetails!.status ==
                                                    "Pending"
                                                ? Colors.orange
                                                : Colors.green,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                    onTap: () {
                                      controller.isShowContainer.value =
                                          controller.isShowContainer.value
                                              ? false
                                              : true;
                                    },
                                    child: const Icon(Icons.clear)),
                              ],
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            Text(
                              controller.reportDetails!.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                              ),
                            ),
                            Text(
                              controller.reportDetails!.contactnumber,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 10.sp,
                              ),
                            ),
                            Text(
                              controller.reportDetails!.address,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 10.sp,
                              ),
                            ),
                            Text(
                              "${DateFormat.yMMMMd().format(controller.reportDetails!.dateTime)} ${DateFormat.jm().format(controller.reportDetails!.dateTime)}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10.sp),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            Text(
                              controller.reportDetails!.caption,
                              maxLines: 3,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10.sp,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            Obx(
                              () => controller.hasImage.value == false
                                  ? const SizedBox()
                                  : Container(
                                      height: 15.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(controller
                                                  .reportDetails!.imageUrl))),
                                    ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Obx(
                              () => controller.hasReponder.value
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Responder Details",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        Text(
                                          controller.responderDetails!.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Text(
                                          controller.responderDetails!.address,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Text(
                                          controller
                                              .responderDetails!.contactnumber,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(
                                      height: 6.h,
                                      child: Center(
                                        child: Text(
                                          "This report has not yet been responded to by responders.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            controller.reportDetails!.responderRemarks == null
                                ? const SizedBox()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Responder remarks",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: .5.h,
                                      ),
                                      Text(
                                        controller
                                            .reportDetails!.responderRemarks!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      Text(
                                        "Level",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: .5.h,
                                      ),
                                      Text(
                                        controller.reportDetails!.level!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                            SizedBox(
                              height: .5.h,
                            ),
                            controller.reportDetails!.status != "Done"
                                ? const SizedBox()
                                : controller.reportDetails!.remarks.isEmpty
                                    ? SizedBox(
                                        height: 6.h,
                                        width: 100.w,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              ReportDetailsPortraitAlertDialog
                                                  .showDialogAddRemarks(
                                                      message: controller
                                                          .reportDetails!
                                                          .remarks);
                                            },
                                            child: const Text("ADD REMARKS")),
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Remarks",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    ReportDetailsPortraitAlertDialog
                                                        .showDialogAddRemarks(
                                                            message: controller
                                                                .reportDetails!
                                                                .remarks);
                                                  },
                                                  child: const Icon(Icons.edit))
                                            ],
                                          ),
                                          SizedBox(
                                            height: .5.h,
                                          ),
                                          Obx(
                                            () => Text(
                                              controller.remarksText.value,
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: 9.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 0), // changes x,y position of shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          controller.isShowContainer.value =
                              controller.isShowContainer.value ? false : true;
                        },
                        child: Icon(
                          Icons.arrow_upward_rounded,
                          color: Colors.black,
                          size: 12.sp,
                        ),
                      ),
                    ),
                  ),
          ),
          Positioned(
              top: 3.h,
              child: SizedBox(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.find<SideBarController>().currentRoute.value =
                            HistoryMainPage.id;
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Container(
                          height: 7.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 4,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 0), // changes x,y position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => controller.hasReponder.value == true
                          ? GestureDetector(
                              onTap: () async {
                                if (Get.find<ChatController>().chatListener !=
                                    null) {
                                  Get.find<ChatController>()
                                      .chatListener!
                                      .cancel();
                                }
                                await Get.find<ChatController>().getChats();
                                Get.find<SideBarController>()
                                    .currentRoute
                                    .value = ChatMainPage.id;
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 1.w),
                                child: Container(
                                  height: 7.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 4,
                                        blurRadius: 5,
                                        offset: const Offset(0,
                                            0), // changes x,y position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.message,
                                      size: 12.sp,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    )
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
