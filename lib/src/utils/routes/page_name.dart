class PageName {
  static const splash = '/splash';
  static const auth = '/auth';
  static const root = '/';
  static const rootCoordinator = '/coordinator/';
  static const rootCounselor = '/konselor/';
  static const homeStudent = '/mahasiswa/home';
  static const homeKonselor = '/konselor/home';
  static const homeSupervisor = '/supervisor/home';
  static const homeCoordinator = '/coordinator/home';
  static const reservationStudent = '/mahasiswa/reservation';
  static const reservationKonselor = '/konselor/reservation';
  static const reservationSupervisor = '/supervisor/reservation';
  static const newReservationSupervisor = '/supervisor/reservation-request';
  static const newReservationDetailSupervisor =
      '/supervisor/reservation-request/:id';
  static const reservationDetailStudent = '/mahasiswa/reservation/:id';
  static const reservationDetailKonselor = '/konselor/reservation/:id';
  static const reservationDetailSupervisor = '/supervisor/reservation/:id';
  static const reservationDetailCoordinator = '/coordinator/reservation/:id';
  static const reservationAssignCounselorCoordinator =
      '/coordinator/reservation/:id/assign-counselor';
  static const studentReservationHistory = '/reservation/:nim';
  static const counselorStudentList = '/konselor/list-mahasiswa';
  static const reservationHistoryStudent = '/mahasiswa/history';
  static const reservationHistorySupervisor = '/supervisor/history';
  static const reservationHistoryCoordinator = '/coordinator/history';
  static const reservationHistoryListSupervisor =
      '/supervisor/history/counselor/:id';
  static const reservationHistoryListCoordinator =
      '/coordinator/history/counselor/:id';
  static const reservationHistoryDetailStudent = '/mahasiswa/history/:id';
  static const reservationHistoryDetailKonselor = '/konselor/history/:id';
  static const reservationHistoryDetailSupervisor = '/supervisor/history/:id';
  static const reservationHistoryDetailCoordinator = '/coordinator/history/:id';
  static const counselorScheduleSupervisor = '/supervisor/counselor-schedule';
  static const counselorScheduleCoordinator = '/coordinator/counselor-schedule';
  static const createNewCounselor = '/create-counselor';
  static const profileStudent = '/mahasiswa/profile';
  static const profileCompleteStudent = '/mahasiswa/profile/complete';
  static const profileCompleteCoordinator = '/coordinator/profile/complete';
  static const profileCompleteCounselor = '/counselor/profile/complete';
  static const profileKonselor = '/konselor/profile';
  static const profileSupervisor = '/supervisor/profile';
  static const profileCoordinator = '/coordinator/profile';
  static const notificationKonselor = '/konselor/notification';
  static const notificationStudent = '/mahasiswa/notification';
  static const notificationSupervisor = '/supervisor/notification';
  static const notificationCoordinator = '/coordinator/notification';
}
