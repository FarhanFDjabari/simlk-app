import 'package:get/get.dart';
import 'package:simlk_app/src/modules/auth/auth_page.dart';
import 'package:simlk_app/src/modules/auth/binding/auth_binding.dart';
import 'package:simlk_app/src/modules/common/bindings/view_binding.dart';
import 'package:simlk_app/src/modules/common/view.dart';
import 'package:simlk_app/src/modules/history/bindings/counselor_reservation_history_detail_binding.dart';
import 'package:simlk_app/src/modules/history/bindings/counselor_student_history_binding.dart';
import 'package:simlk_app/src/modules/history/bindings/counselor_student_list_binding.dart';
import 'package:simlk_app/src/modules/history/bindings/student_reservation_history_binding.dart';
import 'package:simlk_app/src/modules/history/counselor_reservation_history_detail_page.dart';
import 'package:simlk_app/src/modules/history/counselor_student_history_page.dart';
import 'package:simlk_app/src/modules/history/counselor_student_list_page.dart';
import 'package:simlk_app/src/modules/history/student_reservation_history.dart';
import 'package:simlk_app/src/modules/home/bindings/counselor_home_binding.dart';
import 'package:simlk_app/src/modules/home/bindings/student_home_binding.dart';
import 'package:simlk_app/src/modules/home/counselor_home.dart';
import 'package:simlk_app/src/modules/home/student_home.dart';
import 'package:simlk_app/src/modules/notification/bindings/counselor_notification_binding.dart';
import 'package:simlk_app/src/modules/notification/bindings/student_notification_binding.dart';
import 'package:simlk_app/src/modules/notification/counselor_notification_page.dart';
import 'package:simlk_app/src/modules/notification/student_notification_page.dart';
import 'package:simlk_app/src/modules/profile/bindings/counselor_profile_binding.dart';
import 'package:simlk_app/src/modules/profile/bindings/student_profile_binding.dart';
import 'package:simlk_app/src/modules/profile/counselor_profile_page.dart';
import 'package:simlk_app/src/modules/profile/student_profile_page.dart';
import 'package:simlk_app/src/modules/reservation/bindings/counselor_reservation_binding.dart';
import 'package:simlk_app/src/modules/reservation/bindings/counselor_reservation_detail_binding.dart';
import 'package:simlk_app/src/modules/reservation/bindings/student_reservation_binding.dart';
import 'package:simlk_app/src/modules/reservation/counselor_reservation_detail_page.dart';
import 'package:simlk_app/src/modules/reservation/counselor_reservation_page.dart';
import 'package:simlk_app/src/modules/reservation/student_reservation_page.dart';
import 'package:simlk_app/src/modules/splash/bindings/splash_binding.dart';
import 'package:simlk_app/src/modules/splash/splash_page.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class Routes {
  static final pages = <GetPage<dynamic>>[
    // IMPORTANT: CAN'T EDIT THIS SECTION
    GetPage(
      name: PageName.homeStudent,
      page: () => StudentHome(),
      binding: StudentHomeBinding(),
    ),
    GetPage(
      name: PageName.reservationStudent,
      page: () => StudentReservationPage(),
      binding: StudentReservationBinding(),
    ),
    GetPage(
      name: PageName.reservationHistoryStudent,
      page: () => StudentReservationHistoryPage(),
      binding: StudentReservationHistoryBinding(),
    ),
    GetPage(
      name: PageName.profileStudent,
      page: () => StudentProfilePage(),
      binding: StudentProfileBinding(),
    ),
    // EDIT SECTION STARTS BELOW
    GetPage(
      name: PageName.homeKonselor,
      page: () => CounselorHome(),
      binding: CounselorHomeBinding(),
    ),
    GetPage(
      name: PageName.reservationKonselor,
      page: () => CounselorReservationPage(),
      binding: CounselorReservationBinding(),
    ),
    GetPage(
      name: PageName.reservationDetailKonselor,
      page: () => CounselorReservationDetailPage(),
      binding: CounselorReservationDetailBinding(),
    ),
    GetPage(
      name: PageName.counselorStudentList,
      page: () => CounselorStudentListPage(),
      binding: CounselorStudentListBinding(),
    ),
    GetPage(
      name: PageName.studentReservationHistory,
      page: () => CounselorStudentHistoryPage(),
      binding: CounselorStudentHistoryBinding(),
    ),
    GetPage(
      name: PageName.reservationHistoryDetailKonselor,
      page: () => CounselorReservationHistoryDetailPage(),
      binding: CounselorReservationHistoryDetailBinding(),
    ),
    GetPage(
      name: PageName.notificationKonselor,
      page: () => CounselorNotificationPage(),
      binding: CounselorNotificationBinding(),
    ),
    GetPage(
      name: PageName.notificationStudent,
      page: () => StudentNotificationPage(),
      binding: StudentNotificationBinding(),
    ),
    GetPage(
      name: PageName.profileKonselor,
      page: () => CounselorProfilePage(),
      binding: CounselorProfileBinding(),
    ),
    GetPage(
      name: PageName.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: PageName.root,
      page: () => ViewPage(),
      binding: ViewBinding(),
    ),
    GetPage(
      name: PageName.auth,
      page: () => AuthPage(),
      binding: AuthBinding(),
    ),
  ];
}
