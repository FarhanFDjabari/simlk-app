import 'package:simlk_app/src/services/wrapper/model_factory.dart';

class Notification implements ModelFactory {
  Notification({
    this.id,
    this.nim,
    this.title,
    this.body,
    this.data,
    this.isRead,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? nim;
  String? title;
  String? body;
  dynamic data;
  int? isRead;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        nim: json["nim"],
        title: json["title"],
        body: json["body"],
        data: json["data"],
        isRead: json["is_read"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nim": nim,
        "title": title,
        "body": body,
        "data": data,
        "is_read": isRead,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
