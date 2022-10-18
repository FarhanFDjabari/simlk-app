import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/description_text_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/outlined_textfield.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/history/controllers/counselor_reservation_history_detail_controller.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/validator.dart';
import 'package:sizer/sizer.dart';

class CounselorReservationHistoryDetailPage
    extends GetView<CounselorReservationHistoryDetailController> {
  CounselorReservationHistoryDetailPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

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
          text: 'Mahasiswa Satu',
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
        // emptyTitle: 'txt_challenge_empty_title'.tr,
        // emptySubtitle: 'txt_challenge_empty_description'.tr,
        // emptyEnabled: controller.isEmptyData,
        body: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                    TextNunito(
                      text: 'Buat Laporan Akhir',
                      size: 14,
                      fontWeight: Weightenum.REGULAR,
                      align: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    OutlinedTextfield(
                      controller: controller.reportController,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      validator: Validator().notEmpty,
                      maxLines: 8,
                      hintText: 'Tulis laporan akhir...',
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      elevation: 0,
                      label: 'Tambahkan Laporan',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      height: 45,
                      isLoading: controller.isLoading,
                      isEnabled: controller.isLoading == false,
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
