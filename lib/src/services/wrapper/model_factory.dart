import 'package:simlk_app/src/data/model/auth/login_response.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';

abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    var strType = type.toString().replaceAll("?", "");
    if (strType == (LoginResponse).toString()) {
      return LoginResponse.fromJson(json);
    } else if (strType == (Mahasiswa).toString()) {
      return Mahasiswa.fromJson(json);
    } else if (strType == (Konselor).toString()) {
      return Konselor.fromJson(json);
    } else if (strType == (ReservationSchedule).toString()) {
      return ReservationSchedule.fromJson(json);
    }
    // if not implemented
    else {
      throw UnimplementedError('`$type` factory unimplemented.');
    }
  }
}
