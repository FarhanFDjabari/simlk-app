import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/modules/common/widgets/button/primary_button.dart';
import 'package:simlk_app/src/modules/common/widgets/loading_overlay.dart';
import 'package:simlk_app/src/modules/common/widgets/outlined_textfield.dart';
import 'package:simlk_app/src/modules/common/widgets/state_handle_widget.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/modules/home/controller/student_home_controller.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/validator.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

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
          text: 'Selamat Datang, Mahasiswa Satu!',
          maxLines: 2,
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
            // errorEnabled: controller.isError,
            // errorText: 'txt_error_general'.tr,
            // emptyTitle: 'txt_challenge_empty_title'.tr,
            // emptySubtitle: 'txt_challenge_empty_description'.tr,
            // emptyEnabled: controller.isEmptyData,
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
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: Resources.color.indigo300,
                          ),
                          const SizedBox(height: 10),
                          TextNunito(
                            text: 'Tanggal',
                            size: 13.sp,
                            fontWeight: Weightenum.REGULAR,
                          ),
                          GetX<StudentHomeController>(
                            builder: (_) {
                              return TableCalendar(
                                headerStyle: const HeaderStyle(
                                  formatButtonVisible: false,
                                  titleCentered: true,
                                ),
                                focusedDay: controller.focusedDay.value,
                                firstDay: DateTime.now(),
                                lastDay: DateTime.utc(2050),
                                calendarFormat: CalendarFormat.month,
                                calendarBuilders: CalendarBuilders(
                                  markerBuilder: (context, day, day2) {
                                    for (var i = 0;
                                        i < controller.dummyDateData.length;
                                        i++) {
                                      var listDate =
                                          controller.dummyDateData[i];
                                      if (DateTime(day.year, day.month, day.day)
                                          .isAtSameMomentAs(DateTime(
                                              listDate.year,
                                              listDate.month,
                                              listDate.day))) {
                                        return Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Resources
                                                    .color.stateWarning),
                                          ),
                                        );
                                      }
                                    }
                                    return null;
                                  },
                                ),
                                enabledDayPredicate: (date) {
                                  return date.weekday != DateTime.saturday &&
                                      date.weekday != DateTime.sunday;
                                },
                                selectedDayPredicate: (day) {
                                  return isSameDay(
                                      controller.selectedDay.value, day);
                                },
                                onDaySelected: (selectedDay, focusedDay) {
                                  controller.selectedDay(selectedDay);
                                  controller.focusedDay(focusedDay);
                                },
                                calendarStyle: CalendarStyle(
                                  isTodayHighlighted: false,
                                  defaultTextStyle: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.normal,
                                  ),
                                  selectedTextStyle: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.normal,
                                    color: Resources.color.neutral50,
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          TextNunito(
                            text: 'Waktu',
                            size: 13.sp,
                            fontWeight: Weightenum.REGULAR,
                          ),
                          const SizedBox(height: 5),
                          DropdownButtonFormField<Time>(
                            iconDisabledColor: Resources.color.neutral300,
                            validator: (value) {
                              if (value == null) {
                                return 'txt_valid_notEmpty'.tr;
                              }
                              return null;
                            },
                            hint: TextNunito(
                              text: '13.00',
                              size: 12.sp,
                              fontWeight: Weightenum.REGULAR,
                            ),
                            items: [
                              DropdownMenuItem(
                                child: TextNunito(
                                  text: '13.00',
                                  size: 12.sp,
                                  fontWeight: Weightenum.REGULAR,
                                ),
                                value: Time(13),
                                enabled: false,
                              ),
                              DropdownMenuItem(
                                child: TextNunito(
                                  text: '14.00',
                                  size: 12.sp,
                                  fontWeight: Weightenum.REGULAR,
                                ),
                                value: Time(14),
                              ),
                              DropdownMenuItem(
                                child: TextNunito(
                                  text: '15.00',
                                  size: 12.sp,
                                  fontWeight: Weightenum.REGULAR,
                                ),
                                value: Time(15),
                              ),
                            ],
                            onChanged: (value) {
                              print(value?.hour);
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              isDense: true,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextNunito(
                            text: 'Deskripsi Singkat',
                            size: 13.sp,
                            fontWeight: Weightenum.REGULAR,
                          ),
                          const SizedBox(height: 5),
                          OutlinedTextfield(
                            controller: controller.descriptionController,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            validator: Validator().notEmpty,
                            maxLines: 8,
                            hintText:
                                'Tuliskan deskripsi singkat terkait masalahmu...',
                          ),
                          const SizedBox(height: 16),
                          PrimaryButton(
                            elevation: 0,
                            label: 'Buat Reservasi',
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
        },
      ),
    );
  }
}
