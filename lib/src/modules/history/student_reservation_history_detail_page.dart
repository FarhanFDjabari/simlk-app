import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/description_text_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/history/controllers/student_reservation_history_detail_controller.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/extensions/date_time_extension.dart';
import 'package:sizer/sizer.dart';

class StudentReservationHistoryDetailPage
    extends GetView<StudentReservationHistoryDetailController> {
  const StudentReservationHistoryDetailPage({Key? key}) : super(key: key);

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
          text: 'Riwayat Konseling',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: GetBuilder<StudentReservationHistoryDetailController>(
        builder: (_) => StateHandleWidget(
          shimmerView: const LoadingOverlay(),
          loadingEnabled: controller.isLoading,
          body: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: SizerUtil.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextNunito(
                        text: 'Tipe Konsultasi',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                      ),
                      const SizedBox(height: 5),
                      TextNunito(
                        text: '${controller.mData?.type}',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
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
                        text: '${controller.mData?.timeHours}',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
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
                        size: 18,
                        isSelectable: true,
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
                        text: '${controller.mData?.description}',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
                        color: Resources.color.neutral900,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 16),
                      TextNunito(
                        text: 'Laporan Akhir',
                        size: 14,
                        fontWeight: Weightenum.REGULAR,
                        align: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      DescriptionTextWidget(
                        text: '${controller.mData?.report}',
                        size: 18,
                        fontWeight: Weightenum.BOLD,
                        color: Resources.color.neutral900,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
