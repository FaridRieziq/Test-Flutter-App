import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_app_pp/core/constants/variables.dart';
import 'package:flutter_app_pp/data/datasources/auth_local_datasource.dart';
import 'package:flutter_app_pp/data/models/response/company_response_model.dart';
import 'package:flutter_app_pp/data/models/response/checkinout_response_model.dart';
import 'package:flutter_app_pp/data/models/request/checkinout_request_model.dart';
import 'package:http/http.dart' as http;

class AttendanceRemoteDatasource {
  Future<Either<String, CompanyResponseModel>> getCompanyProfile() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/company');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right(CompanyResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to get company profile');
    }
  }

  Future<Either<String, bool>> isCheckedin() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/is-checkin');
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return Right(responseData['checkedin'] as bool);
    } else {
      return const Left('Failed to get checkedin status');
    }
  }

  Future<Either<String, CheckinOutResponseModel>> checkin(
      CheckinOutRequestModel data) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/checkin');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
      body: data.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(CheckinOutResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to checkin');
    }
  }

  Future<Either<String, CheckinOutResponseModel>> checkout(
      CheckinOutRequestModel data) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/checkout');
    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
      body: data.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(CheckinOutResponseModel.fromJson(response.body));
    } else {
      return const Left('Failed to checkin');
    }
  }
}
