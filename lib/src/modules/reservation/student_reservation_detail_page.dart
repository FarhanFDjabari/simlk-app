import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/modules/common/widgets/description_text_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/reservation/controller/student_reservation_detail_controller.dart';
import 'package:simlk_app/src/modules/reservation/widgets/reservation_timeline.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class StudentReservationDetailPage
    extends GetView<StudentReservationDetailController> {
  const StudentReservationDetailPage({Key? key}) : super(key: key);

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
          text: 'Reservasi Konseling',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.neutral50,
      ),
      body: GetBuilder<StudentReservationDetailController>(
        builder: (_) {
          return StateHandleWidget(
            shimmerView: const LoadingOverlay(),
            loadingEnabled: controller.isLoading,
            body: SingleChildScrollView(
              child: Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => ReservationTimeline(
                            processes: controller.processes,
                            processIndex: controller.processIndex.value,
                          )),
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
