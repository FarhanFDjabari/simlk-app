import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/home/controller/supervisor_home_controller.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class SupervisorHome extends GetView<SupervisorHomeController> {
  const SupervisorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SupervisorHomeController>(
        builder: (_) => StateHandleWidget(
          shimmerView: const LoadingOverlay(),
          loadingEnabled: controller.isLoading,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextNunito(
                      text:
                          'Selamat Datang, ${controller.localUserData.name?.split(" ").first}!',
                      size: 14.sp,
                      fontWeight: Weightenum.BOLD,
                    ),
                    const SizedBox(height: 18),
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Resources.color.indigo300,
                        backgroundImage: NetworkImage(
                          controller.localUserData.profileImageUrl ??
                              "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
                        ),
                      ),
                    ),
                    const SizedBox(height: 26),
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.sp,
                        mainAxisSpacing: 16.sp,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.goToNewReservasi();
                          },
                          child: Container(
                            width: 100.sp,
                            height: 100.sp,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Resources.color.indigo500,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: TextNunito(
                                text: 'Permintaan Baru',
                                maxLines: 3,
                                align: TextAlign.center,
                                size: 16.sp,
                                fontWeight: Weightenum.BOLD,
                                color: Resources.color.neutral50,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.goToReservasi();
                          },
                          child: Container(
                            width: 100.sp,
                            height: 100.sp,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Resources.color.indigo500,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: TextNunito(
                                text: 'Reservasi Konseling',
                                maxLines: 2,
                                align: TextAlign.center,
                                size: 16.sp,
                                fontWeight: Weightenum.BOLD,
                                color: Resources.color.neutral50,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.goToHistory();
                          },
                          child: Container(
                            width: 100.sp,
                            height: 100.sp,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Resources.color.indigo500,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: TextNunito(
                                text: 'Riwayat Konseling',
                                maxLines: 2,
                                align: TextAlign.center,
                                size: 16.sp,
                                fontWeight: Weightenum.BOLD,
                                color: Resources.color.neutral50,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.goToSchedule();
                          },
                          child: Container(
                            width: 100.sp,
                            height: 100.sp,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Resources.color.indigo500,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: TextNunito(
                                text: 'Jadwal Konselor',
                                maxLines: 2,
                                align: TextAlign.center,
                                size: 16.sp,
                                fontWeight: Weightenum.BOLD,
                                color: Resources.color.neutral50,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.goToNofication();
                          },
                          child: Container(
                            width: 100.sp,
                            height: 100.sp,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Resources.color.indigo500,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Obx(() => TextNunito(
                                    text:
                                        'Notifikasi (${controller.badgeNumber})',
                                    maxLines: 2,
                                    align: TextAlign.center,
                                    size: 16.sp,
                                    fontWeight: Weightenum.BOLD,
                                    color: Resources.color.neutral50,
                                  )),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.goToProfile();
                          },
                          child: Container(
                            width: 100.sp,
                            height: 100.sp,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Resources.color.indigo500,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: TextNunito(
                                text: 'Profil',
                                maxLines: 2,
                                align: TextAlign.center,
                                size: 16.sp,
                                fontWeight: Weightenum.BOLD,
                                color: Resources.color.neutral50,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
