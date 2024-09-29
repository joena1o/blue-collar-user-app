import 'dart:convert';
import 'package:blue_collar_app/data/connection.dart';
import 'package:blue_collar_app/data/data_provider.dart';
import 'package:blue_collar_app/data/local_storage.dart';
import 'package:blue_collar_app/features/user_app_features/user_auth/data/models/user_model.dart';

class PersonalInfoRepository {
  static Future<UserModel> updateProfile(Map<String, dynamic> body) async {
    try {
      String token = await SharedPrefService.getItem("token");
      final response = await DataProvider.postRequest(
          endpoint: "$conn/user/update-profile", body: body, auth: token);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
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
}
