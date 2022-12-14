import 'package:badges/badges.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simlk_app/src/modules/common/controllers/counselor_view_controller.dart';
import 'package:simlk_app/src/modules/common/widgets/text/text_nunito.dart';
import 'package:simlk_app/src/res/resources.dart';
import 'package:simlk_app/src/utils/helper/constant.dart';
import 'package:simlk_app/src/utils/helper/notifications/notification_helper.dart';
import 'package:simlk_app/src/utils/routes/routes.dart';

class CounselorViewPage extends GetView<CounselorViewController> {
  const CounselorViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<CounselorViewController>(
      init: CounselorViewController(),
      initState: (_) {
        FirebaseMessaging.onMessage.listen((message) {
          debugPrint(
              'Foreground konselor Notification ${message.notification?.toMap().toString()}');
          handleIncomingMessageOnBackground(message);
          controller.updateNotifications();
          controller.updateOngoingReservations();
        });
      },
      builder: (_) {
        return Scaffold(
          body: Builder(
            builder: (_) {
              switch (controller.pageIndex.value) {
                case 0:
                  return Routes.pages[8].page();
                case 1:
                  return Routes.pages[9].page();
                case 2:
                  return Routes.pages[10].page();
                case 3:
                  return Routes.pages[11].page();
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
                icon: Badge(
                  badgeContent: TextNunito(
                    text: '${controller.badgeNumber}',
                    size: 9,
                    fontWeight: Weightenum.REGULAR,
                    maxLines: 1,
                    align: TextAlign.center,
                    color: Resources.color.neutral50,
                  ),
                  elevation: 0,
                  borderSide: BorderSide(color: Resources.color.neutral50),
                  showBadge: controller.badgeNumber.value > 0,
                  badgeColor: Resources.color.stateNegative,
                  shape: BadgeShape.circle,
                  animationType: BadgeAnimationType.scale,
                  animationDuration: const Duration(milliseconds: 250),
                  child: Icon(
                    Remix.notification_2_line,
                    color: Resources.color.neutral500,
                  ),
                ),
                activeIcon: Badge(
                  badgeContent: TextNunito(
                    text: '${controller.badgeNumber}',
                    size: 9,
                    fontWeight: Weightenum.REGULAR,
                    maxLines: 1,
                    align: TextAlign.center,
                    color: Resources.color.neutral50,
                  ),
                  borderSide: BorderSide(color: Resources.color.neutral50),
                  elevation: 0,
                  showBadge: controller.badgeNumber.value > 0,
                  badgeColor: Resources.color.stateNegative,
                  shape: BadgeShape.circle,
                  animationType: BadgeAnimationType.scale,
                  animationDuration: const Duration(milliseconds: 250),
                  child: Icon(
                    Remix.notification_2_fill,
                    color: Resources.color.indigo700,
                  ),
                ),
                label: 'Notifikasi',
                tooltip: 'Notifikasi',
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
