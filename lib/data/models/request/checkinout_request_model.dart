import 'dart:convert';

class CheckinOutRequestModel {
  final String? latitude;
  final String? longitude;

  CheckinOutRequestModel({
    this.latitude,
    this.longitude,
  });

  factory CheckinOutRequestModel.fromJson(String str) =>
      CheckinOutRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckinOutRequestModel.fromMap(Map<String, dynamic> json) =>
      CheckinOutRequestModel(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
