import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/home/controller/counselor_home_controller.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:sizer/sizer.dart';

class CounselorHome extends GetView<CounselorHomeController> {
  const CounselorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextNunito(
                  text: 'Selamat Datang, Konselor1!',
                  size: 14.sp,
                  fontWeight: Weightenum.BOLD,
                ),
                const SizedBox(height: 18),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Resources.color.indigo300,
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
                          child: TextNunito(
                            text: 'Notifikasi (99)',
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
    );
  }
}
