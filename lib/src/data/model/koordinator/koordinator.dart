import 'package:hive_flutter/hive_flutter.dart';
import 'package:simlk_app/src/data/hive/hive_types.dart';
import 'package:simlk_app/src/services/wrapper/model_factory.dart';

part 'koordinator.g.dart';

@HiveType(typeId: HiveTypes.KOORDINATOR)
class Koordinator implements ModelFactory {
  Koordinator({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.profileImageUrl,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    this.nim,
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
  int? role;
  @HiveField(5)
  String? profileImageUrl;
  @HiveField(6)
  String? fcmToken;
  @HiveField(7)
  DateTime? createdAt;
  @HiveField(8)
  DateTime? updatedAt;
  @HiveField(9)
  String? nim;

  factory Koordinator.fromJson(Map<String, dynamic> json) => Koordinator(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: json["role"],
        profileImageUrl: json["profile_image_url"],
        fcmToken: json["fcm_token"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        nim: json['nim'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "role": role,
        "profile_image_url": profileImageUrl,
        "fcm_token": fcmToken,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "nim": nim,
      };
}
