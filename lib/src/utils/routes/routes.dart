import 'package:get/get.dart';
import 'package:simlk_app/src/modules/auth/auth_page.dart';
import 'package:simlk_app/src/modules/auth/binding/auth_binding.dart';
import 'package:simlk_app/src/modules/common/bindings/coordinator_view_binding.dart';
import 'package:simlk_app/src/modules/common/bindings/counselor_view_binding.dart';
import 'package:simlk_app/src/modules/common/bindings/view_binding.dart';
import 'package:simlk_app/src/modules/common/coordinator_view.dart';
import 'package:simlk_app/src/modules/common/counselor_view.dart';
import 'package:simlk_app/src/modules/common/view.dart';
import 'package:simlk_app/src/modules/history/bindings/coordinator/coordinator_reservation_history_binding.dart';
import 'package:simlk_app/src/modules/history/bindings/counselor/counselor_reservation_history_detail_binding.dart';
import 'package:simlk_app/src/modules/history/bindings/counselor/counselor_student_history_binding.dart';
import 'package:simlk_app/src/modules/history/bindings/counselor/counselor_student_list_binding.dart';
import 'package:simlk_app/src/modules/history/bindings/student/student_reservation_history_binding.dart';
import 'package:simlk_app/src/modules/history/bindings/student/student_reservation_history_detail_binding.dart';
import 'package:simlk_app/src/modules/history/bindings/supervisor/supervisor_reservation_history_binding.dart';
import 'package:simlk_app/src/modules/history/bindings/supervisor/supervisor_reservation_history_detail_binding.dart';
import 'package:simlk_app/src/modules/history/bindings/supervisor/supervisor_reservation_history_list_binding.dart';
import 'package:simlk_app/src/modules/history/view/coordinator/coordinator_reservation_history_page.dart';
import 'package:simlk_app/src/modules/history/view/counselor/counselor_reservation_history_detail_page.dart';
import 'package:simlk_app/src/modules/history/view/counselor/counselor_student_history_page.dart';
import 'package:simlk_app/src/modules/history/view/counselor/counselor_student_list_page.dart';
import 'package:simlk_app/src/modules/history/view/student/student_reservation_history.dart';
import 'package:simlk_app/src/modules/history/view/student/student_reservation_history_detail_page.dart';
import 'package:simlk_app/src/modules/history/view/supervisor/supervisor_counselor_history_list_page.dart';
import 'package:simlk_app/src/modules/history/view/supervisor/supervisor_reservation_history_detail_page.dart';
import 'package:simlk_app/src/modules/history/view/supervisor/supervisor_reservation_history_page.dart';
import 'package:simlk_app/src/modules/home/bindings/coordinator_home_binding.dart';
import 'package:simlk_app/src/modules/home/bindings/counselor_home_binding.dart';
import 'package:simlk_app/src/modules/home/bindings/student_home_binding.dart';
import 'package:simlk_app/src/modules/home/bindings/supervisor_home_binding.dart';
import 'package:simlk_app/src/modules/home/coordinator_home.dart';
import 'package:simlk_app/src/modules/home/counselor_home.dart';
import 'package:simlk_app/src/modules/home/student_home.dart';
import 'package:simlk_app/src/modules/home/supervisor_home.dart';
import 'package:simlk_app/src/modules/notification/bindings/coordinator_notification_binding.dart';
import 'package:simlk_app/src/modules/notification/bindings/counselor_notification_binding.dart';
import 'package:simlk_app/src/modules/notification/bindings/student_notification_binding.dart';
import 'package:simlk_app/src/modules/notification/bindings/supervisor_notification_binding.dart';
import 'package:simlk_app/src/modules/notification/coordinator_notification_page.dart';
import 'package:simlk_app/src/modules/notification/counselor_notification_page.dart';
import 'package:simlk_app/src/modules/notification/student_notification_page.dart';
import 'package:simlk_app/src/modules/notification/supervisor_notification_page.dart';
import 'package:simlk_app/src/modules/profile/bindings/coordinator_complete_profile_binding.dart';
import 'package:simlk_app/src/modules/profile/bindings/coordinator_profile_binding.dart';
import 'package:simlk_app/src/modules/profile/bindings/counselor_complete_profile_binding.dart';
import 'package:simlk_app/src/modules/profile/bindings/counselor_profile_binding.dart';
import 'package:simlk_app/src/modules/profile/bindings/student_complete_profile_binding.dart';
import 'package:simlk_app/src/modules/profile/bindings/student_profile_binding.dart';
import 'package:simlk_app/src/modules/profile/bindings/supervisor_profile_binding.dart';
import 'package:simlk_app/src/modules/profile/coordinator_complete_profile_page.dart';
import 'package:simlk_app/src/modules/profile/coordinator_profile_page.dart';
import 'package:simlk_app/src/modules/profile/counselor_complete_profile_page.dart';
import 'package:simlk_app/src/modules/profile/counselor_profile_page.dart';
import 'package:simlk_app/src/modules/profile/student_complete_profile_page.dart';
import 'package:simlk_app/src/modules/profile/student_profile_page.dart';
import 'package:simlk_app/src/modules/profile/supervisor_profile_page.dart';
import 'package:simlk_app/src/modules/reservation/bindings/coordinator_reservation_detail_binding.dart';
import 'package:simlk_app/src/modules/reservation/bindings/counselor_reservation_binding.dart';
import 'package:simlk_app/src/modules/reservation/bindings/counselor_reservation_detail_binding.dart';
import 'package:simlk_app/src/modules/reservation/bindings/student_reservation_binding.dart';
import 'package:simlk_app/src/modules/reservation/bindings/student_reservation_detail_binding.dart';
import 'package:simlk_app/src/modules/reservation/bindings/supervisor_new_reservation_binding.dart';
import 'package:simlk_app/src/modules/reservation/bindings/supervisor_new_reservation_detail_binding.dart';
import 'package:simlk_app/src/modules/reservation/bindings/supervisor_reservation_binding.dart';
import 'package:simlk_app/src/modules/reservation/coordinator_reservation_detail_page.dart';
import 'package:simlk_app/src/modules/reservation/counselor_reservation_detail_page.dart';
import 'package:simlk_app/src/modules/reservation/counselor_reservation_page.dart';
import 'package:simlk_app/src/modules/reservation/student_reservation_detail_page.dart';
import 'package:simlk_app/src/modules/reservation/student_reservation_page.dart';
import 'package:simlk_app/src/modules/reservation/supervisor_new_reservation_detail_page.dart';
import 'package:simlk_app/src/modules/reservation/supervisor_new_reservation_page.dart';
import 'package:simlk_app/src/modules/reservation/supervisor_reservation_page.dart';
import 'package:simlk_app/src/modules/schedule/bindings/coordinator_counselor_assign_binding.dart';
import 'package:simlk_app/src/modules/schedule/bindings/coordinator_schedule_binding.dart';
import 'package:simlk_app/src/modules/schedule/bindings/create_new_counselor_binding.dart';
import 'package:simlk_app/src/modules/schedule/bindings/supervisor_counselor_schedule_binding.dart';
import 'package:simlk_app/src/modules/schedule/coordinator_counselor_assign_page.dart';
import 'package:simlk_app/src/modules/schedule/coordinator_schedule_page.dart';
import 'package:simlk_app/src/modules/schedule/create_new_counselor_page.dart';
import 'package:simlk_app/src/modules/schedule/supervisor_counselor_schedule_page.dart';
import 'package:simlk_app/src/modules/splash/bindings/splash_binding.dart';
import 'package:simlk_app/src/modules/splash/splash_page.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class Routes {
  static final pages = <GetPage<dynamic>>[
    // IMPORTANT: CAN'T EDIT THIS SECTION
    // mahasiswa
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

    // koordinator
    GetPage(
      name: PageName.homeCoordinator,
      page: () => CoordinatorHome(),
      binding: CoordinatorHomeBinding(),
    ),
    GetPage(
      name: PageName.counselorScheduleCoordinator,
      page: () => CoordinatorSchedulePage(),
      binding: CoordinatorScheduleBinding(),
    ),
    GetPage(
      name: PageName.reservationHistoryCoordinator,
      page: () => CoordinatorReservationHistoryPage(),
      binding: CoordinatorReservationHistoryBinding(),
    ),
    GetPage(
      name: PageName.profileCoordinator,
      page: () => CoordinatorProfilePage(),
      binding: CoordinatorProfileBinding(),
    ),

    // konselor
    GetPage(
      name: PageName.homeKonselor,
      page: () => CounselorHome(),
      binding: CounselorHomeBinding(),
    ),
    GetPage(
      name: PageName.counselorStudentList,
      page: () => CounselorStudentListPage(),
      binding: CounselorStudentListBinding(),
    ),
    GetPage(
      name: PageName.notificationKonselor,
      page: () => CounselorNotificationPage(),
      binding: CounselorNotificationBinding(),
    ),
    GetPage(
      name: PageName.profileKonselor,
      page: () => CounselorProfilePage(),
      binding: CounselorProfileBinding(),
    ),

    // EDIT SECTION STARTS BELOW

    // Konselor
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
      name: PageName.reservationHistoryDetailKonselor,
      page: () => CounselorReservationHistoryDetailPage(),
      binding: CounselorReservationHistoryDetailBinding(),
    ),
    GetPage(
      name: PageName.profileCompleteCounselor,
      page: () => CounselorCompleteProfilePage(),
      binding: CounselorCompleteProfileBinding(),
    ),
    GetPage(
      name: PageName.studentReservationHistory,
      page: () => CounselorStudentHistoryPage(),
      binding: CounselorStudentHistoryBinding(),
    ),

    // Mahasiswa
    GetPage(
      name: PageName.reservationDetailStudent,
      page: () => StudentReservationDetailPage(),
      binding: StudentReservationDetailBinding(),
    ),
    GetPage(
      name: PageName.reservationHistoryDetailStudent,
      page: () => StudentReservationHistoryDetailPage(),
      binding: StudentReservationHistoryDetailBinding(),
    ),
    GetPage(
      name: PageName.notificationStudent,
      page: () => StudentNotificationPage(),
      binding: StudentNotificationBinding(),
    ),
    GetPage(
      name: PageName.profileCompleteStudent,
      page: () => StudentCompleteProfilePage(),
      binding: StudentCompleteProfileBinding(),
    ),

    // Pengawas
    GetPage(
      name: PageName.homeSupervisor,
      page: () => SupervisorHome(),
      binding: SupervisorHomeBinding(),
    ),
    GetPage(
      name: PageName.newReservationSupervisor,
      page: () => SupervisorNewReservationPage(),
      binding: SupervisorNewReservationBinding(),
    ),
    GetPage(
      name: PageName.newReservationDetailSupervisor,
      page: () => SupervisorNewReservationDetailPage(),
      binding: SupervisorNewReservationDetailBinding(),
    ),
    GetPage(
      name: PageName.reservationSupervisor,
      page: () => SupervisorReservationPage(),
      binding: SupervisorReservationBinding(),
    ),
    GetPage(
      name: PageName.reservationDetailSupervisor,
      page: () => CounselorReservationDetailPage(),
      binding: CounselorReservationDetailBinding(),
    ),
    GetPage(
      name: PageName.reservationHistorySupervisor,
      page: () => SupervisorReservationHistoryPage(),
      binding: SupervisorReservationHistoryBinding(),
    ),
    GetPage(
      name: PageName.reservationHistoryListSupervisor,
      page: () => SupervisorCounselorHistoryListPage(),
      binding: SupervisorCounselorHistoryListBinding(),
    ),
    GetPage(
      name: PageName.reservationHistoryDetailSupervisor,
      page: () => SupervisorReservationHistoryDetailPage(),
      binding: SupervisorReservationHistoryDetailBinding(),
    ),
    GetPage(
      name: PageName.profileSupervisor,
      page: () => SupervisorProfilePage(),
      binding: SupervisorProfileBinding(),
    ),
    GetPage(
      name: PageName.notificationSupervisor,
      page: () => SupervisorNotificationPage(),
      binding: SupervisorNotificationBinding(),
    ),
    GetPage(
      name: PageName.counselorScheduleSupervisor,
      page: () => SupervisorCounselorSchedulePage(),
      binding: SupervisorCounselorScheduleBinding(),
    ),

    // koordinator
    GetPage(
      name: PageName.reservationDetailCoordinator,
      page: () => CoordinatorReservationDetailPage(),
      binding: CoordinatorReservationDetailBinding(),
    ),
    GetPage(
      name: PageName.notificationCoordinator,
      page: () => CoordinatorNotificationPage(),
      binding: CoordinatorNotificationBinding(),
    ),
    GetPage(
      name: PageName.reservationHistoryListCoordinator,
      page: () => SupervisorCounselorHistoryListPage(),
      binding: SupervisorCounselorHistoryListBinding(),
    ),
    GetPage(
      name: PageName.profileCompleteCoordinator,
      page: () => CoordinatorCompleteProfilePage(),
      binding: CoordinatorCompleteProfileBinding(),
    ),
    GetPage(
      name: PageName.reservationAssignCounselorCoordinator,
      page: () => CoordinatorCounselorAssignPage(),
      binding: CoordinatorCounselorAssignBinding(),
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
      name: PageName.rootCoordinator,
      page: () => CoordinatorView(),
      binding: CoordinatorViewBinding(),
    ),
    GetPage(
      name: PageName.rootCounselor,
      page: () => CounselorViewPage(),
      binding: CounselorViewBinding(),
    ),
    GetPage(
      name: PageName.auth,
      page: () => AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: PageName.createNewCounselor,
      page: () => CreateNewCounselorPage(),
      binding: CreateNewCounselorBinding(),
    ),
  ];
}
