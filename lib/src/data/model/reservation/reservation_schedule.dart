import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/model/mahasiswa/mahasiswa.dart';
import 'package:simlk_app/src/services/wrapper/model_factory.dart';

class ReservationSchedule implements ModelFactory {
  ReservationSchedule({
    this.id,
    this.nim,
    this.reservationTime,
    this.timeHours,
    this.status,
    this.type,
    this.location,
    this.description,
    this.report,
    this.reportFileUrl,
    this.createdAt,
    this.updatedAt,
    this.student,
    this.counselor,
    this.model,
  });

  int? id;
  String? nim;
  DateTime? reservationTime;
  String? timeHours;
  int? status;
  String? description;
  String? report;
  String? reportFileUrl;
  String? type;
  String? location;
  DateTime? createdAt;
  DateTime? updatedAt;
  Mahasiswa? student;
  Konselor? counselor;
  int? model;

  factory ReservationSchedule.fromJson(Map<String, dynamic> json) =>
      ReservationSchedule(
        id: json["id"],
        nim: json["nim"],
        reservationTime: json["reservation_time"] == null
            ? null
            : DateTime.parse(json["reservation_time"]),
        timeHours: json["time_hours"],
        status: json["status"],
        type: json["type"],
        location: json["location"],
        description: json["description"],
        report: json["report"],
        reportFileUrl: json["file_report"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        student: json["student"] == null
            ? null
            : Mahasiswa.fromJson(json['student']),
        counselor: json["konselor"] == null
            ? null
            : Konselor.fromJson(json['konselor']),
        model: json['model'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nim": nim,
        "reservation_time": reservationTime?.toIso8601String(),
        "time_hours": timeHours,
        "status": status,
        "type": type,
        "location": location,
        "description": description,
        "report": report,
        "file_report": reportFileUrl,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "student": student?.toJson(),
        "konselor": counselor?.toJson(),
        "model": model,
      };
}
