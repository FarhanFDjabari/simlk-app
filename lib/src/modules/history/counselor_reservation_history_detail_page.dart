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
          // text: '${controller.mData?.mahasiswa?.name}',
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
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
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
                          '${controller.mData?.student?.noHp}/${controller.mData?.student?.idLine}',
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
                      text: '${controller.mData?.reservationTime}',
                      size: 16,
                      fontWeight: Weightenum.REGULAR,
                    ),
                    const SizedBox(height: 10),
                    TextNunito(
                      text: 'Waktu Konsultasi',
                      size: 16,
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
                      size: 16,
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
                        if (_formKey.currentState!.validate()) {
                          controller.setReservationReport(
                              id: controller.mData?.id ?? 0);
                        }
                      },
                      height: 45,
                      isLoading: controller.isLoading,
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
