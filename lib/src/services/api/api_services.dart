import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:simlk_app/src/data/model/auth/login_response.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/data/model/notification/notification.dart';
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
          receiveTimeout: receiveTimeout),
      baseUrl: ConfigEnvironments.getEnvironments().toString(),
    );
  }

  @POST('/auth/login-siam')
  Future<ApiResponse<LoginResponse>> loginMahasiswa(
    @Field("nim") String? nim,
    @Field("password") String? password,
    @Field("fcm_token") String? fcmToken,
  );

  @POST('/auth/login-konselor')
  Future<ApiResponse<LoginResponse>> loginKonselor(
    @Field("email") String? email,
    @Field("password") String? password,
    @Field("fcm_token") String? fcmToken,
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

  @GET('/reservation-schedules')
  Future<ApiResponses<ReservationSchedule>> fetchCalendarReservations();

  @GET('/reservation-schedules/reservation-date/{date}')
  Future<ApiResponses<ReservationSchedule>> fetchReservationTimeByDate({
    @Path("date") String? date,
  });

  @GET('/reservation-schedules/{id}')
  Future<ApiResponse<ReservationSchedule>> fetchMahasiswaReservationDetail({
    @Path("id") int? id,
  });

  @PUT('/reservation-schedules/{id}')
  Future<ApiResponse<dynamic>> updateMahasiswaReservationReport({
    @Path("id") int? id,
    @Field("report") String? report,
  });

  @GET('/konselor/profile')
  Future<ApiResponse<Konselor>> fetchKonselorProfile();

  @GET('/konselor/history-completed')
  Future<ApiResponses<Mahasiswa>> fetchKonselorReservationHistory();

  @GET('/mahasiswa/history-completed')
  Future<ApiResponse<Mahasiswa>> fetchMahasiswaReservationHistory();

  @GET('/konselor/history-uncompleted')
  Future<ApiResponses<ReservationSchedule>> fetchKonselorOngoingReservation();

  @GET('/mahasiswa/history-uncompleted')
  Future<ApiResponses<ReservationSchedule>> fetchMahasiswaOngoingReservation();

  @MultiPart()
  @PUT('/konselor/profile')
  Future<ApiResponse<dynamic>> updateKonselorProfile({
    @Part(name: "avatar", contentType: "image/png") File? imageProfile,
  });

  @GET('/reservation-status')
  Future<ApiResponse<dynamic>> updateReservationStatus({
    @Query("status") int? status,
    @Query("id") int? reservationId,
    @Query("location") String? location,
  });

  // @GET('/reservation-history')
  // Future<ApiResponses<Mahasiswa>> fetchMahasiswaReservationList();

  @GET('/reservation-history/{nim}')
  Future<ApiResponses<ReservationSchedule>> fetchReservationScheduleByNim({
    @Path("nim") String? nim,
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
}

const client = RestClient.create;
