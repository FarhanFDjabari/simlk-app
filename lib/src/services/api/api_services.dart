import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:simlk_app/src/data/model/auth/login_response.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/model/koordinator/koordinator.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/data/model/notification/notification.dart';
import 'package:simlk_app/src/data/model/pengawas/pengawas.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/data/storage/secure_storage_manager.dart';
import 'package:simlk_app/src/services/environment.dart';
import 'package:simlk_app/src/services/interceptor/dio.dart';
import 'package:simlk_app/src/services/wrapper/api_response.dart';

import 'package:http_parser/http_parser.dart';

part 'api_services.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static Future<RestClient> create({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    final defHeader = Map<String, dynamic>.from(headers);
    defHeader["Accept"] = "application/json";

    String? token = await SecureStorageManager().getToken();
    if (token != null) defHeader["Authorization"] = "Bearer $token";

    return RestClient(
      await AppDio().getDIO(
        headers: defHeader,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      ),
      baseUrl: ConfigEnvironments.getEnvironments().toString(),
    );
  }

  @POST('/auth/login-siam')
  Future<ApiResponse<LoginResponse>> loginMahasiswa(
    @Field("nim") String? nim,
    @Field("password") String? password,
    @Field("fcm_token") String? fcmToken,
  );

  @POST('/auth/login-default')
  Future<ApiResponse<LoginResponse>> loginKonselor(
    @Field("email") String? email,
    @Field("password") String? password,
    @Field("fcm_token") String? fcmToken,
    @Field("role") int? role,
  );

  @POST('/auth/register-conselour')
  Future<ApiResponse<LoginResponse>> registerKonselor(
    @Field("email") String? email,
    @Field("password") String? password,
    @Field("name") String? name,
    @Field("major") String? prodi,
    @Field("nim") String? nim,
    @Field("no_hp") String? nohp,
    @Field("id_line") String? lineId,
  );

  @POST('/auth/register-koordinator')
  Future<ApiResponse<dynamic>> registerKoordinator(
    @Field("email") String? email,
    @Field("password") String? password,
  );

  @GET('/auth/logout')
  Future<ApiResponse<dynamic>> logout();

  @GET('/mahasiswa/profile')
  Future<ApiResponse<Mahasiswa>> fetchMahasiswaProfile();

  @MultiPart()
  @PUT('/mahasiswa/profile')
  Future<ApiResponse<dynamic>> updateMahasiswaProfile({
    @Part(name: "dpa") String? dosenPa,
    @Part(name: "id_line") String? idLine,
    @Part(name: "no_hp") String? noHp,
    @Part(name: "email") String? email,
    @Part(name: "avatar", contentType: "image/png") File? imageProfile,
  });

  @POST('/reservation-schedules')
  Future<ApiResponse<dynamic>> createMahasiswaReservation({
    @Field("reservation_time") String? reservationTime,
    @Field("time_hours") String? timeHours,
    @Field("description") String? description,
    @Field("type") String? counselingType,
  });

  @GET('/reservation-schedules/reservation-date/{date}')
  Future<ApiResponses<ReservationSchedule>> fetchReservationTimeByDate({
    @Path("date") String? date,
  });

  @GET('/reservation-schedules/{id}')
  Future<ApiResponse<ReservationSchedule>> fetchMahasiswaReservationDetail({
    @Path("id") int? id,
  });

  @PUT('/reservation-schedules/{id}')
  @MultiPart()
  Future<ApiResponse<dynamic>> updateMahasiswaReservationReport({
    @Path("id") int? id,
    @Part(name: "report") String? report,
    @Part(name: "file_report") File? fileReport,
  });

  @GET('/konselor/profile')
  Future<ApiResponse<Konselor>> fetchKonselorProfile();

  @GET('/konselor/history-completed')
  Future<ApiResponses<Mahasiswa>> fetchKonselorReservationHistory();

  @GET('/konselor/history-uncompleted')
  Future<ApiResponses<ReservationSchedule>> fetchKonselorOngoingReservation();

  @GET('/mahasiswa/history-uncompleted')
  Future<ApiResponses<ReservationSchedule>> fetchMahasiswaOngoingReservation();

  @MultiPart()
  @PUT('/konselor/profile')
  Future<ApiResponse<dynamic>> updateKonselorProfile({
    @Part(name: "avatar", contentType: "image/png") File? imageProfile,
    @Part(name: "nim") String? nim,
    @Part(name: "id_line") String? idLine,
    @Part(name: "no_hp") String? noHp,
    @Part(name: "is_available") int? status,
  });

  @GET('/reservation-status')
  Future<ApiResponse<dynamic>> updateReservationStatus({
    @Query("status") int? status,
    @Query("id") int? reservationId,
    @Query("location") String? location,
  });

  @GET('/reservation-history/{nim}')
  Future<ApiResponses<ReservationSchedule>> fetchReservationScheduleByNim({
    @Path("nim") String? nim,
  });

  @GET('/konselor/history/{id}')
  Future<ApiResponses<ReservationSchedule>>
      fetchReservationHistoryByKonselorId({
    @Path("id") int? konselorId,
  });

  @GET('/notifications')
  Future<ApiResponses<Notification>> fetchAllNotifications();

  @POST('/notifications/{id}')
  Future<ApiResponse<dynamic>> markNotificationById({
    @Path("id") required int notificationId,
    @Field("is_read") int? isRead = 1,
  });

  @PUT('/notifications')
  Future<ApiResponse<dynamic>> markAllNotifications();

  @PUT('/koordinator/jadwal/konselor')
  Future<ApiResponse<dynamic>> setKonselorSchedule({
    @Field("jadwal") String? jadwal,
    @Field("id_konselor") int? idKonselor,
  });

  @GET('/konselor/ketersediaan/{is_available}')
  Future<ApiResponses<Notification>> updateKonselorStatus({
    @Path("is_available") required int isAvailable,
  });

  @GET('/pengawas/profile')
  Future<ApiResponse<Pengawas>> fetchPengawasProfile();

  @GET('/pengawas/take/{id}')
  Future<ApiResponse<dynamic>> setReservationSupervisorHandle({
    @Path("id") required int reservationId,
  });

  @GET('/pengawas/approved/{id}')
  Future<ApiResponse<dynamic>> assignReservationToPeerCounselor({
    @Path("id") required int reservationId,
  });

  @GET('/pengawas/reservation-uncompleted')
  Future<ApiResponses<ReservationSchedule>> fetchPengawasOngoingReservation();

  @GET('/pengawas/reservation-completed')
  Future<ApiResponses<ReservationSchedule>> fetchPengawasReservationHistory();

  @GET('/pengawas/notapproved')
  Future<ApiResponses<ReservationSchedule>> fetchPengawasNewReservation();

  @GET('/koordinator/profile')
  Future<ApiResponse<Koordinator>> fetchKoordinatorProfile();

  @GET('/koordinator/reservasi-diajukan')
  Future<ApiResponses<ReservationSchedule>>
      fetchKoordinatorOngoingReservation();

  @GET('/koordinator/conselor-tersedia/reservasi/{reservationId}')
  Future<ApiResponses<Konselor>> fetchKonselorAvailable({
    @Path("reservationId") required int reservationId,
  });

  @GET('/koordinator/reservation/{reservationId}/konselor/{konselorId}')
  Future<ApiResponse<dynamic>> assignKonselorToReservation({
    @Path("reservationId") required int reservationId,
    @Path("konselorId") required int konselorId,
  });

  @GET('/konselor/ketersediaan-hari/{hari}')
  Future<ApiResponses<Konselor>> fetchKonselorOnDay({
    @Path("hari") required int day,
  });

  @GET('/konselor/reservation/{id}')
  Future<ApiResponses<ReservationSchedule>> fetchReservationByKonselorId({
    @Path("id") int? konselorId,
  });

  @MultiPart()
  @PUT('/pengawas/profile')
  Future<ApiResponse<dynamic>> updateSupervisorProfile({
    @Part(name: "avatar", contentType: "image/png") File? imageProfile,
  });

  @MultiPart()
  @PUT('/koordinator/profile')
  Future<ApiResponse<dynamic>> updateKoordinatorProfile({
    @Part(name: "avatar", contentType: "image/png") File? imageProfile,
    @Part(name: "nim") String? nim,
    @Part(name: "name") String? name,
  });

  @GET('/konselor/mahasiswa-history')
  Future<ApiResponses<Mahasiswa>> fetchReservationHistoryStudentList();

  @GET('/konselor/mahasiswa-reservasi-history/{nim}')
  Future<ApiResponses<ReservationSchedule>>
      fetchMahasiswaReservationHistoryByNim({
    @Path("nim") required String nim,
  });

  @GET('/konselor/mahasiswa-reservasi-uncompleted/{nim}')
  Future<ApiResponses<ReservationSchedule>>
      fetchMahasiswaReservationRequestByNim({
    @Path("nim") required String nim,
  });

  @GET('/pengawas/update')
  Future<ApiResponse<dynamic>> updatePengawasReservationStatus({
    @Query("status") required int status,
    @Query("id") required int reservationId,
    @Query("location") required String location,
  });

  @DELETE('/reservation-schedules/{id}')
  Future<ApiResponse<dynamic>> deleteMahasiswaReservation({
    @Path("id") int? id,
  });
}

const client = RestClient.create;
