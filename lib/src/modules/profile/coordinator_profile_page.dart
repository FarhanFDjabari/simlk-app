import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_dialog.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/profile/controllers/coordinator_profile_controller.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class CoordinatorProfilePage extends GetView<CoordinatorProfileController> {
  const CoordinatorProfilePage({Key? key}) : super(key: key);

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
          text: 'Profil',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: GetBuilder<CoordinatorProfileController>(
        builder: (_) => StateHandleWidget(
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Resources.color.indigo300,
                    backgroundImage: NetworkImage(
                      controller.mData?.profileImageUrl ??
                          "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextNunito(
                    text: '${controller.mData?.name}',
                    size: 16.sp,
                    fontWeight: Weightenum.BOLD,
                    align: TextAlign.center,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 2),
                  TextNunito(
                    // text: '${controller.mData?.email}',
                    text: '195150xxxxxxx',
                    size: 14.sp,
                    fontWeight: Weightenum.REGULAR,
                    align: TextAlign.center,
                  ),
                  const SizedBox(height: 2),
                  TextNunito(
                    text: '${controller.mData?.email}',
                    size: 14.sp,
                    fontWeight: Weightenum.REGULAR,
                    align: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    elevation: 0,
                    height: 45,
                    isLoading: controller.isLoading,
                    label: 'Ubah Informasi Detail',
                    onPressed: () {
                      controller.goToCompleteProfile();
                    },
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(
                    elevation: 0,
                    height: 45,
                    isLoading: controller.isLoading,
                    label: 'Ubah Foto Profil',
                    onPressed: () {
                      controller.showPhotoProfileBottomSheet();
                    },
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(
                    elevation: 0,
                    height: 45,
                    isLoading: controller.isLoading,
                    label: 'Keluar',
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
        ),
      ),
    );
  }
}
