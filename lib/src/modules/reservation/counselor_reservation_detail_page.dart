import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/description_text_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/reservation/controller/counselor_reservation_detail_controller.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class CounselorReservationDetailPage
    extends GetView<CounselorReservationDetailController> {
  const CounselorReservationDetailPage({Key? key}) : super(key: key);

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
          text: 'Detail Reservasi Konseling',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: GetBuilder<CounselorReservationDetailController>(
        init: CounselorReservationDetailController(),
        initState: (_) {},
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
              child: Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Resources.color.indigo300,
                      ),
                      const SizedBox(height: 10),
                      TextNunito(
                        text: 'Mahasiswa Satu',
                        size: 16,
                        fontWeight: Weightenum.REGULAR,
                        maxLines: 2,
                        align: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      TextNunito(
                        text: '195150xxxxxxx',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                        maxLines: 2,
                        align: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      TextNunito(
                        text: 'Tanggal Konsultasi',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 5),
                      TextNunito(
                        text: '14 Oktober 2022',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
                      ),
                      const SizedBox(height: 10),
                      TextNunito(
                        text: 'Waktu Konsultasi',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 5),
                      TextNunito(
                        text: '14.00',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
                      ),
                      const SizedBox(height: 10),
                      TextNunito(
                        text: 'Deskripsi Singkat',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 5),
                      DescriptionTextWidget(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean varius turpis eget ante pharetra sodales. Vestibulum et commodo ex. Ut ut velit purus. Donec id lacus pharetra turpis aliquam cursus. Nulla sed nunc porta, hendrerit ante molestie, pellentesque justo. Nam sit amet dolor tempus dui luctus elementum tempor rutrum felis. Donec volutpat metus lacus, sed congue augue congue non.',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
                        color: Resources.color.neutral900,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 16),
                      PrimaryButton(
                        elevation: 0,
                        height: 45,
                        label: 'Dalam Proses',
                        isLoading: controller.isLoading,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 8),
                      PrimaryButton(
                        elevation: 0,
                        height: 45,
                        label: 'Penanganan',
                        isLoading: controller.isLoading,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 8),
                      PrimaryButton(
                        elevation: 0,
                        height: 45,
                        label: 'Selesai',
                        isLoading: controller.isLoading,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
