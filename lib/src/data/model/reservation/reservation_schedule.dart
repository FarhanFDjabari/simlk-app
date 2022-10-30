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
    this.createdAt,
    this.updatedAt,
    this.student,
  });

  int? id;
  String? nim;
  DateTime? reservationTime;
  String? timeHours;
  int? status;
  String? description;
  String? report;
  String? type;
  String? location;
  DateTime? createdAt;
  DateTime? updatedAt;
  Mahasiswa? student;

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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        student: json["student"] == null
            ? null
            : Mahasiswa.fromJson(json['student']),
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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "student": student?.toJson(),
      };
}
