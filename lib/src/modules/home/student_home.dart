import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/outlined_dropdown_textfield.dart';
import 'package:simlk_app/src/modules/common/widgets/outlined_textfield.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/home/controller/student_home_controller.dart';
import 'package:simlk_app/src/modules/home/widgets/simlk_calendar.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/validator.dart';
import 'package:sizer/sizer.dart';

class StudentHome extends GetView<StudentHomeController> {
  StudentHome({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.neutral100,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextNunito(
          text:
              'Selamat Datang, ${controller.localUserData.name?.split(' ').first}!',
          maxLines: 1,
          size: 14.sp,
          fontWeight: Weightenum.BOLD,
        ),
        foregroundColor: Resources.color.indigo700,
        actions: [
          GetX<StudentHomeController>(
            init: StudentHomeController(),
            initState: (_) {},
            builder: (_) {
              return IconButton(
                onPressed: () {
                  controller.goToNotification();
                },
                icon: Badge(
                  badgeContent: TextNunito(
                    text: '${controller.notificationCount}',
                    size: 9,
                    fontWeight: Weightenum.REGULAR,
                    maxLines: 1,
                    align: TextAlign.center,
                    color: Resources.color.neutral50,
                  ),
                  elevation: 0,
                  showBadge: controller.notificationCount.value > 0,
                  badgeColor: Resources.color.stateNegative,
                  shape: BadgeShape.circle,
                  animationType: BadgeAnimationType.scale,
                  animationDuration: const Duration(milliseconds: 250),
                  child: Icon(
                    controller.notificationCount.value > 0
                        ? Remix.notification_2_fill
                        : Remix.notification_2_line,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: GetBuilder<StudentHomeController>(
        init: StudentHomeController(),
        initState: (_) {},
        builder: (_) {
          return StateHandleWidget(
            shimmerView: const LoadingOverlay(),
            loadingEnabled: controller.isLoading,
            onRetryPressed: () {
              // controller.getDashboard("", "");
            },
            body: SmartRefresher(
              controller: controller.refreshController,
              enablePullDown: true,
              enablePullUp: false,
              onRefresh: controller.refreshPage,
              onLoading: controller.loadNextPage,
              header: MaterialClassicHeader(
                color: Resources.color.indigo700,
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (controller.localUserData.dpa?.isEmpty == true ||
                              controller.localUserData.email?.isEmpty == true ||
                              controller.localUserData.noHp?.isEmpty == true ||
                              controller.localUserData.idLine?.isEmpty == true)
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: Resources.color.indigo50,
                                border: Border.all(
                                  color: Resources.color.indigo700,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: ListTile(
                                onTap: () {
                                  controller.goToCompleteProfile();
                                },
                                title: TextNunito(
                                  text: 'Profilmu belum lengkap',
                                  size: 16,
                                  fontWeight: Weightenum.BOLD,
                                ),
                                subtitle: TextNunito(
                                  text:
                                      'Lengkapi profilmu untuk memudahkan kami dalam melakukan pendataan',
                                  maxLines: 3,
                                  size: 16,
                                  fontWeight: Weightenum.REGULAR,
                                ),
                              ),
                            ),
                          if (controller.localUserData.dpa?.isEmpty == true ||
                              controller.localUserData.email?.isEmpty == true ||
                              controller.localUserData.noHp?.isEmpty == true ||
                              controller.localUserData.idLine?.isEmpty == true)
                            const SizedBox(height: 10),
                          TextNunito(
                            text: 'Tanggal',
                            size: 13.sp,
                            fontWeight: Weightenum.REGULAR,
                          ),
                          GetX<StudentHomeController>(
                            builder: (_) {
                              return SIMLKCalendar(
                                focusedDay: controller.focusedDay.value,
                                selectedDay: controller.selectedDay.value,
                                reservations: controller.dataList,
                                onDaySelected: (selectedDay, focusedDay) {
                                  controller.selectedDay(selectedDay);
                                  controller.focusedDay(focusedDay);
                                  controller.getReservationTimeInDate(
                                    date: selectedDay.toLocal().toString(),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          OutlinedDropdownTextfield<Time>(
                            label: TextNunito(
                              text: 'Waktu',
                              size: 13.sp,
                              fontWeight: Weightenum.REGULAR,
                            ),
                            hintText: 'Pilih waktu konseling',
                            items: [
                              DropdownMenuItem(
                                value: const Time(13),
                                enabled: !controller.reservationTimeAvailable
                                    .contains('13:00'),
                                child: TextNunito(
                                  text: '13:00',
                                  size: 12.sp,
                                  fontWeight: Weightenum.REGULAR,
                                  color: controller.reservationTimeAvailable
                                          .contains('13:00')
                                      ? Resources.color.neutral500
                                      : null,
                                  textDecoration: controller
                                          .reservationTimeAvailable
                                          .contains('13:00')
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              DropdownMenuItem(
                                value: const Time(14),
                                enabled: !controller.reservationTimeAvailable
                                    .contains('14:00'),
                                child: TextNunito(
                                  text: '14:00',
                                  size: 12.sp,
                                  fontWeight: Weightenum.REGULAR,
                                  color: controller.reservationTimeAvailable
                                          .contains('14:00')
                                      ? Resources.color.neutral500
                                      : null,
                                  textDecoration: controller
                                          .reservationTimeAvailable
                                          .contains('14:00')
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              DropdownMenuItem(
                                value: const Time(15),
                                enabled: !controller.reservationTimeAvailable
                                    .contains('15:00'),
                                child: TextNunito(
                                  text: '15:00',
                                  size: 12.sp,
                                  fontWeight: Weightenum.REGULAR,
                                  color: controller.reservationTimeAvailable
                                          .contains('15:00')
                                      ? Resources.color.neutral500
                                      : null,
                                  textDecoration: controller
                                          .reservationTimeAvailable
                                          .contains('15:00')
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              controller.timeHour('${value?.hour}:00');
                              final reservationTime = DateTime(
                                controller.selectedDay.value.year,
                                controller.selectedDay.value.month,
                                controller.selectedDay.value.day,
                                value?.hour ?? 0,
                              );
                              print(reservationTime.toLocal().toString());
                              controller.selectedDay(reservationTime);
                            },
                          ),
                          const SizedBox(height: 10),
                          OutlinedDropdownTextfield<String>(
                            label: TextNunito(
                              text: 'Tipe Konseling',
                              size: 13.sp,
                              fontWeight: Weightenum.REGULAR,
                            ),
                            hintText:
                                'Pilih tipe konseling sesuai preferensimu',
                            items: [
                              DropdownMenuItem(
                                value: 'Luring',
                                child: TextNunito(
                                  text: 'Luring',
                                  size: 12.sp,
                                  fontWeight: Weightenum.REGULAR,
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Daring',
                                child: TextNunito(
                                  text: 'Daring',
                                  size: 12.sp,
                                  fontWeight: Weightenum.REGULAR,
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              print(value);
                              controller.counselingType(value);
                            },
                          ),
                          const SizedBox(height: 10),
                          OutlinedTextfield(
                            controller: controller.descriptionController,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            validator: Validator().notEmpty,
                            label: TextNunito(
                              text: 'Deskripsi Singkat',
                              size: 13.sp,
                              fontWeight: Weightenum.REGULAR,
                            ),
                            maxLines: 8,
                            hintText:
                                'Tuliskan deskripsi singkat terkait masalahmu...',
                          ),
                          const SizedBox(height: 16),
                          PrimaryButton(
                            elevation: 0,
                            label: 'Buat Reservasi',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.createNewReservation();
                              }
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
        },
      ),
    );
  }
}
