import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_dialog.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/profile/controllers/student_profile_controller.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class StudentProfilePage extends GetView<StudentProfileController> {
  const StudentProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.neutral100,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Resources.color.gradient600to800,
          ),
        ),
        title: TextNunito(
          text: 'Profil Saya',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: GetBuilder<StudentProfileController>(
        builder: (_) {
          return StateHandleWidget(
            shimmerView: const LoadingOverlay(),
            loadingEnabled: controller.isLoading,
            onRetryPressed: () {
              // controller.getDashboard("", "");
            },
            // errorEnabled: controller.isError,
            // errorText: 'txt_error_general'.tr,
            // emptyTitle: 'txt_challenge_empty_title'.tr,
            // emptySubtitle: 'txt_challenge_empty_description'.tr,
            // emptyEnabled: controller.isEmptyData,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Resources.color.indigo300,
                          backgroundImage: NetworkImage(
                            controller.mData?.profileImageUrl ??
                                "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextNunito(
                              text: '${controller.mData?.name}',
                              size: 14.sp,
                              fontWeight: Weightenum.BOLD,
                            ),
                            TextNunito(
                              text: '${controller.mData?.nim}',
                              size: 12.sp,
                              fontWeight: Weightenum.REGULAR,
                            ),
                            TextNunito(
                              text: '${controller.mData?.email}',
                              size: 12.sp,
                              fontWeight: Weightenum.REGULAR,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.sp),
                    PrimaryButton(
                      height: 45,
                      elevation: 0,
                      label: 'Lengkapi Profil',
                      onPressed: () {
                        controller.goToCompleteProfile();
                      },
                    ),
                    const SizedBox(height: 5),
                    PrimaryButton(
                      height: 45,
                      elevation: 0,
                      label: 'Ubah Foto Profil',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 5),
                    PrimaryButton(
                      height: 45,
                      elevation: 0,
                      label: 'Keluar',
                      isLoading: controller.isLoading,
                      onPressed: () {
                        Get.dialog(
                          SIMLKDialog(
                            title: 'Keluar Akun',
                            description:
                                'Apakah Anda yakin ingin keluar dari akun?',
                            successButtonLabel: 'IYA',
                            cancelButtonLabel: 'BATAL',
                            onCancelPressed: () {
                              Get.back();
                            },
                            onSuccessPressed: () {
                              Get.back();
                              controller.logout();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
