import 'package:hive_flutter/hive_flutter.dart';
import 'package:simlk_app/src/data/hive/hive_types.dart';
import 'package:simlk_app/src/services/wrapper/model_factory.dart';

part 'konselor.g.dart';

@HiveType(typeId: HiveTypes.KONSELOR)
class Konselor implements ModelFactory {
  Konselor({
    this.id,
    this.email,
    this.password,
    this.name,
    this.major,
    this.role,
    this.profileImageUrl,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    this.isAvailable,
    this.jadwal,
    this.nim,
    this.noHp,
    this.idLine,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? name;
  @HiveField(4)
  String? major;
  @HiveField(5)
  int? role;
  @HiveField(6)
  String? profileImageUrl;
  @HiveField(7)
  String? fcmToken;
  @HiveField(8)
  DateTime? createdAt;
  @HiveField(9)
  DateTime? updatedAt;
  @HiveField(10)
  String? nim;
  @HiveField(11)
  String? noHp;
  @HiveField(12)
  String? idLine;
  @HiveField(13)
  int? isAvailable;
  @HiveField(14)
  String? jadwal;

  factory Konselor.fromJson(Map<String, dynamic> json) => Konselor(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        major: json["major"],
        role: json["role"],
        profileImageUrl: json["profile_image_url"],
        fcmToken: json["fcm_token"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        isAvailable: json['is_available'],
        jadwal: json['jadwal'],
        nim: json['nim'],
        noHp: json['no_hp'],
        idLine: json['id_line'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "major": major,
        "role": role,
        "profile_image_url": profileImageUrl,
        "fcm_token": fcmToken,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        'is_available': isAvailable,
        'jadwal': jadwal,
        'nim': nim,
        'no_hp': noHp,
        'id_line': idLine,
      };
}
