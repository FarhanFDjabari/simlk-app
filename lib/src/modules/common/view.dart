import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/modules/common/controllers/view_controller.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/notifications/notification_helper.dart';
import 'package:simlk_app/src/utils/routes/routes.dart';

class ViewPage extends GetView<ViewController> {
  const ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ViewController>(
      init: ViewController(),
      initState: (_) {
        FirebaseMessaging.onMessage.listen((message) {
          debugPrint(
              'Foreground Student Notification ${message.notification?.toMap().toString()}');
          handleIncomingMessageOnBackground(message);
          controller.updateNotifications();
          if (message.notification?.title?.contains("Selesai") == true) {
            controller.updateReservationHistories();
          } else {
            controller.updateOngoingReservations();
          }
        });
      },
      builder: (_) {
        return Scaffold(
          body: Builder(
            builder: (_) {
              switch (controller.pageIndex.value) {
                case 0:
                  return Routes.pages[0].page();
                case 1:
                  return Routes.pages[1].page();
                case 2:
                  return Routes.pages[2].page();
                case 3:
                  return Routes.pages[3].page();
                default:
                  return Container();
              }
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.pageIndex.value,
            onTap: (index) {
              controller.pageIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: Resources.color.indigo700,
            ),
            unselectedLabelStyle: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Remix.home_2_line,
                  color: Resources.color.neutral500,
                ),
                activeIcon: Icon(
                  Remix.home_2_fill,
                  color: Resources.color.indigo700,
                ),
                label: 'Home',
                tooltip: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Remix.calendar_line,
                  color: Resources.color.neutral500,
                ),
                activeIcon: Icon(
                  Remix.calendar_fill,
                  color: Resources.color.indigo700,
                ),
                label: 'Reservasi',
                tooltip: 'Reservasi',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Remix.history_line,
                  color: Resources.color.neutral500,
                ),
                activeIcon: Icon(
                  Remix.history_fill,
                  color: Resources.color.indigo700,
                ),
                label: 'Riwayat',
                tooltip: 'Riwayat',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Remix.user_3_line,
                  color: Resources.color.neutral500,
                ),
                activeIcon: Icon(
                  Remix.user_3_fill,
                  color: Resources.color.indigo700,
                ),
                label: 'Profil',
                tooltip: 'Profil',
              ),
            ],
          ),
        );
      },
    );
  }
}
