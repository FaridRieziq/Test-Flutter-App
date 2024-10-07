import 'dart:convert';

class CheckinOutResponseModel {
  final String? message;
  final Attendance? attendance;

  CheckinOutResponseModel({
    this.message,
    this.attendance,
  });

  factory CheckinOutResponseModel.fromJson(String str) =>
      CheckinOutResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckinOutResponseModel.fromMap(Map<String, dynamic> json) =>
      CheckinOutResponseModel(
        message: json["message"],
        attendance: json["attendance"] == null
            ? null
            : Attendance.fromMap(json["attendance"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "attendance": attendance?.toMap(),
      };
}

class Attendance {
  final int? userId;
  final DateTime? date;
  final String? timeIn;
  final String? latlonIn;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Attendance({
    this.userId,
    this.date,
    this.timeIn,
    this.latlonIn,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Attendance.fromJson(String str) =>
      Attendance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attendance.fromMap(Map<String, dynamic> json) => Attendance(
        userId: json["user_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        timeIn: json["time_in"],
        latlonIn: json["latlon_in"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time_in": timeIn,
        "latlon_in": latlonIn,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
