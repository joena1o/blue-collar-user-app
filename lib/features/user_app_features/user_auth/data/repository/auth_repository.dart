import 'dart:convert';
import 'package:blue_collar_app/data/connection.dart';
import 'package:blue_collar_app/data/data_provider.dart';
import 'package:blue_collar_app/data/local_storage.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/data/models/otp_request_model.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/data/models/user_model.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/data/models/verified_response_model.dart';
import 'package:blue_collar_app/helper/success_handler.dart';

class AuthRepository {
  Future<UserModel> signUpManually(Map<String, dynamic> body) async {
    try {
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/sign-up", body: body, auth: null);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = json.decode(response.body);
        SharedPrefService.saveItem("token", result['token']);
        UserModel? userModel = UserModel.fromJson(result['data']);
        return userModel;
      } else if (response.statusCode >= 400 && response.statusCode <= 500) {
        final result = json.decode(response.body);
        throw result['error'];
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signIn(Map<String, dynamic> body) async {
    try {
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/login", body: body, auth: null);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        SharedPrefService.saveItem("token", result['token']);
        UserModel? userModel = UserModel.fromJson(result['data']);
        return userModel;
      } else if (response.statusCode >= 400 && response.statusCode <= 500) {
        final result = json.decode(response.body);
        throw result['error'];
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<MessageResponse> requestEmailOtp(Map<String, dynamic> body) async {
    try {
      String token = await SharedPrefService.getItem("token");
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/request-otp", body: body, auth: token);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        MessageResponse successModel = MessageResponse.fromJson(result);
        return successModel;
      } else if (response.statusCode >= 400 && response.statusCode <= 500) {
        final result = json.decode(response.body);
        throw result['error'];
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<MessageResponse> verifyEmailOtp(Map<String, dynamic> body) async {
    try {
      String token = await SharedPrefService.getItem("token");
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/verify-email", body: body, auth: token);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        MessageResponse successModel = MessageResponse.fromJson(result);
        return successModel;
      } else if (response.statusCode >= 400 && response.statusCode <= 500) {
        final result = json.decode(response.body);
        throw result['error'];
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<OtpRequestModel> requestPhoneOtp(Map<String, dynamic> body) async {
    try {
      String token = await SharedPrefService.getItem("token");
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/request-sms-otp", body: body, auth: token);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        OtpRequestModel successModel = OtpRequestModel.fromJson(result);
        return successModel;
      } else if (response.statusCode >= 400 && response.statusCode <= 500) {
        final result = json.decode(response.body);
        throw result['error'];
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<VerifiedResponseModel> verifyPhoneOtp(
      Map<String, dynamic> body) async {
    try {
      String token = await SharedPrefService.getItem("token");
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/verify-phone", body: body, auth: token);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        VerifiedResponseModel successModel =
            VerifiedResponseModel.fromJson(result);
        return successModel;
      } else if (response.statusCode >= 400 && response.statusCode <= 500) {
        final result = json.decode(response.body);
        throw result['error'];
      } else {
        throw "Error authorizing user";
      }
    } catch (e) {
      rethrow;
    }
  }
}
