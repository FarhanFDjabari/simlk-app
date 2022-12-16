import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/modules/common/widgets/button/dashed_button_icon.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/description_text_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/outlined_textfield.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/history/controllers/supervisor/supervisor_reservation_history_detail_controller.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/extensions/date_time_extension.dart';
import 'package:simlk_app/src/utils/helper/snackbar_state_enum.dart';
import 'package:simlk_app/src/utils/helper/validator.dart';
import 'package:sizer/sizer.dart';

class SupervisorReservationHistoryDetailPage
    extends GetView<SupervisorReservationHistoryDetailController> {
  const SupervisorReservationHistoryDetailPage({Key? key}) : super(key: key);

  Future<void> checkPermission({required Function() callback}) async {
    var storagePermission = Permission.storage;
    var mediaLibraryPermission = Permission.mediaLibrary;
    if (await storagePermission.request().isGranted) {
      callback();
    } else if (await storagePermission.request().isDenied) {
      Get.showSnackbar(
        SIMLKSnackbar(
          snackbarMessage:
              'Mohon aktifkan izin aplikasi untuk mengakses penyimpanan',
          snackbarStateEnum: SnackbarStateEnum.WARNING,
        ),
      );
    } else if (await storagePermission.request().isPermanentlyDenied) {
      await openAppSettings();
    }

    if (await mediaLibraryPermission.request().isDenied) {
      Get.showSnackbar(
        SIMLKSnackbar(
          snackbarMessage:
              'Mohon aktifkan izin aplikasi untuk mengakses penyimpanan media',
          snackbarStateEnum: SnackbarStateEnum.WARNING,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupervisorReservationHistoryDetailController>(
      builder: (_) => Scaffold(
        backgroundColor: Resources.color.neutral100,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: Resources.color.gradient600to800,
            ),
          ),
          title: TextNunito(
            text: 'Riwayat Konseling',
            size: 15.sp,
            fontWeight: Weightenum.BOLD,
          ),
          foregroundColor: Resources.color.neutral50,
        ),
        body: StateHandleWidget(
          shimmerView: const LoadingOverlay(),
          loadingEnabled: controller.isLoading,
          onRetryPressed: () {
            // controller.getDashboard("", "");
          },
          // errorEnabled: controller.isError,
          // errorText: 'txt_error_general'.tr,
          emptyTitle: 'txt_empty_title'.tr,
          emptySubtitle: 'txt_empty_description'.tr,
          emptyEnabled: controller.isEmptyData,
          body: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.all(16),
              child: Container(
                width: SizerUtil.width,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextNunito(
                      text: 'Informasi Mahasiswa',
                      size: 18,
                      fontWeight: Weightenum.BOLD,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Resources.color.indigo300,
                          backgroundImage: NetworkImage(
                            controller.mData?.student?.profileImageUrl ??
                                "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextNunito(
                              text: '${controller.mData?.student?.name}',
                              size: 16,
                              fontWeight: Weightenum.REGULAR,
                              maxLines: 2,
                              align: TextAlign.center,
                            ),
                            TextNunito(
                              text: '${controller.mData?.student?.nim}',
                              size: 14,
                              fontWeight: Weightenum.REGULAR,
                              maxLines: 2,
                              align: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextNunito(
                      text: 'Dosen Pembimbing Akademik',
                      size: 14,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 5),
                    TextNunito(
                      text: '${controller.mData?.student?.dpa}',
                      size: 16,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 10),
                    TextNunito(
                      text: 'Kontak',
                      size: 14,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 5),
                    TextNunito(
                      text:
                          '${controller.mData?.student?.noHp ?? '-'}/${controller.mData?.student?.idLine ?? '-'}',
                      size: 16,
                      isSelectable: true,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 16),
                    TextNunito(
                      text: 'Informasi Konselor',
                      size: 18,
                      fontWeight: Weightenum.BOLD,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Resources.color.indigo300,
                          backgroundImage: NetworkImage(
                            controller.mData?.counselor?.profileImageUrl ??
                                "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextNunito(
                              text: '${controller.mData?.counselor?.name}',
                              size: 16,
                              fontWeight: Weightenum.REGULAR,
                              maxLines: 2,
                              align: TextAlign.center,
                            ),
                            TextNunito(
                              text: controller.mData?.counselor?.nim ?? '-',
                              size: 14,
                              fontWeight: Weightenum.REGULAR,
                              maxLines: 2,
                              align: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextNunito(
                      text: 'Email',
                      size: 14,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 5),
                    TextNunito(
                      text: controller.mData?.counselor?.email,
                      size: 16,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 10),
                    TextNunito(
                      text: 'Kontak',
                      size: 14,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 5),
                    TextNunito(
                      text:
                          '${controller.mData?.counselor?.noHp ?? '-'}/${controller.mData?.counselor?.idLine ?? '-'}',
                      size: 16,
                      isSelectable: true,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 16),
                    TextNunito(
                      text: 'Informasi Reservasi',
                      size: 18,
                      fontWeight: Weightenum.BOLD,
                    ),
                    const SizedBox(height: 5),
                    TextNunito(
                      text: 'Tipe Konsultasi',
                      size: 14,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 5),
                    TextNunito(
                      text: '${controller.mData?.type}',
                      size: 16,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 10),
                    TextNunito(
                      text: 'Tanggal Konsultasi',
                      size: 14,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 5),
                    TextNunito(
                      text: DateTimeExtension(
                              controller.mData?.reservationTime ??
                                  DateTime.now())
                          .dayFullMonthYear,
                      size: 16,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 10),
                    TextNunito(
                      text: 'Waktu Konsultasi',
                      size: 14,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 5),
                    TextNunito(
                      text: '${controller.mData?.timeHours}',
                      size: 16,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 10),
                    TextNunito(
                      text: 'Lokasi Konsultasi',
                      size: 14,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 5),
                    TextNunito(
                      text: '${controller.mData?.location}',
                      size: 16,
                      isSelectable: true,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 10),
                    TextNunito(
                      text: 'Deskripsi Singkat',
                      size: 14,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 5),
                    DescriptionTextWidget(
                      text: '${controller.mData?.description}',
                      size: 16,
                      fontWeight: Weightenum.REGULAR,
                      color: Resources.color.neutral900,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    TextNunito(
                      text: 'Laporan Akhir',
                      size: 14,
                      fontWeight: Weightenum.REGULAR,
                      align: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    DescriptionTextWidget(
                      text: controller.mData?.report ?? 'Belum tersedia',
                      size: 16,
                      fontWeight: Weightenum.REGULAR,
                      color: controller.mData?.report?.isNotEmpty == true
                          ? Resources.color.neutral900
                          : Resources.color.neutral400,
                      textAlign: TextAlign.justify,
                    ),
                    if (controller.mData?.reportFileUrl != null)
                      const SizedBox(height: 8),
                    if (controller.mData?.reportFileUrl != null)
                      Obx(
                        () => DashedButtonIcon(
                          text: controller.isDownloading.isTrue
                              ? 'Downloading...'
                              : '${controller.mData?.reportFileUrl?.split('/').last}',
                          icon: Remix.download_2_line,
                          borderRadius: 16,
                          isLoading: controller.isDownloading.value,
                          progressValue:
                              controller.fileReportDownloadProgress.value / 100,
                          callback: () async {
                            await checkPermission(callback: () {
                              controller.downloadReportFile();
                            });
                          },
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                        ),
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
