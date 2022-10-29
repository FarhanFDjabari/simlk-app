import 'package:hive_flutter/hive_flutter.dart';
import 'package:simlk_app/src/data/hive/hive_types.dart';
import 'package:simlk_app/src/services/wrapper/model_factory.dart';

import '../reservation/reservation_schedule.dart';

part 'mahasiswa.g.dart';

@HiveType(typeId: HiveTypes.MAHASISWA)
class Mahasiswa implements ModelFactory {
  Mahasiswa({
    this.nim,
    this.email,
    this.name,
    this.major,
    this.role,
    this.profileImageUrl,
    this.noHp,
    this.idLine,
    this.dpa,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    this.reservations,
  });

  @HiveField(0)
  String? nim;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? major;
  @HiveField(3)
  int? role;
  @HiveField(4)
  String? profileImageUrl;
  @HiveField(5)
  String? noHp;
  @HiveField(6)
  String? idLine;
  @HiveField(7)
  String? dpa;
  @HiveField(8)
  String? fcmToken;
  @HiveField(9)
  DateTime? createdAt;
  @HiveField(10)
  DateTime? updatedAt;
  @HiveField(11)
  String? email;
  @HiveField(12)
  List<ReservationSchedule>? reservations;

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        nim: json["nim"],
        name: json["name"],
        major: json["major"],
        role: json["role"],
        email: json["email"],
        profileImageUrl: json["profile_image_url"],
        noHp: json["no_hp"],
        idLine: json["id_line"],
        dpa: json["dpa"],
        fcmToken: json["fcm_token"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        reservations: json["reservations"] == null
            ? null
            : List<ReservationSchedule>.from(json["reservations"]
                .map((e) => ReservationSchedule.fromJson(e))),
      );

  Map<String, dynamic> toJson() => {
        "nim": nim,
        "email": email,
        "name": name,
        "major": major,
        "role": role,
        "profile_image_url": profileImageUrl,
        "no_hp": noHp,
        "id_line": idLine,
        "dpa": dpa,
        "fcm_token": fcmToken,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "reservations": List<ReservationSchedule>.from(
            reservations!.map((e) => e.toJson())),
      };
}
