class BaseResponse {
  int status;
  String message;

  BaseResponse({
    required this.status,
    required this.message,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        status: json["status_code"],
        message: json["message"],
      );

  Map<dynamic, dynamic> toJson() => <String, dynamic>{
        'status_code': status,
        'message': message,
      };
}
