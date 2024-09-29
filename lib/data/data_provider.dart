import 'dart:convert';
import 'dart:io';
import 'package:blue_collar_app/data/connection.dart';
import 'package:blue_collar_app/data/local_storage.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  static Future<http.Response> getRequest(
      {required String endpoint, final auth}) async {
    try {
      final headers = auth == null
          ? {
              "Accept": "application/json",
              "Content-Type": "application/json",
            }
          : {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Authorization": auth.toString()
            };
      final response = await http.get(Uri.parse(endpoint), headers: headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<http.Response> postRequest(
      {required String endpoint,
      required Map<String, dynamic> body,
      final auth}) async {
    try {
      final headers = auth == null
          ? {
              "Accept": "application/json",
              "Content-Type": "application/json",
            }
          : {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Authorization": auth.toString()
            };
      final response = await http.post(Uri.parse(endpoint),
          body: json.encode(body), headers: headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<http.Response> deleteRequest(
      {required String endpoint, final auth}) async {
    try {
      final headers = auth == null
          ? {
              "Accept": "application/json",
              "Content-Type": "application/json",
            }
          : {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Authorization": auth.toString()
            };
      final response = await http.delete(Uri.parse(endpoint), headers: headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<http.Response> updateRequest(
      {required String endpoint,
      required Map<String, dynamic> body,
      final auth}) async {
    try {
      final headers = auth == null
          ? {
              "Accept": "application/json",
              "Content-Type": "application/json",
            }
          : {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Authorization": auth.toString()
            };
      final response = await http.put(Uri.parse(endpoint),
          body: json.encode(body), headers: headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> uploadImages(List<File> images) async {
    try {
      final url = Uri.parse('$conn/upload-images');
      String token = await SharedPrefService.getItem("token");
      http.MultipartRequest request = http.MultipartRequest(
        'POST',
        url,
      );
      request.headers['Authorization'] = token;
      for (final image in images) {
        final multipartFile = await http.MultipartFile.fromPath(
          "image",
          image.path,
        );
        request.files.add(multipartFile);
      }
      final result = await request.send();
      if (result.statusCode == 200) {
        final responseString = await result.stream.bytesToString();
        final connValue = jsonDecode(responseString);
        return connValue['data'];
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> uploadImage(File? image) async {
    try {
      final url = Uri.parse('$conn/image/upload-image');
      String token = await SharedPrefService.getItem("token");
      http.MultipartRequest request = http.MultipartRequest(
        'POST',
        url,
      );
      request.headers['Authorization'] = token;
      final multipartFile = await http.MultipartFile.fromPath(
        "image",
        image!.path,
      );
      request.files.add(multipartFile);
      final result = await request.send();
      if (result.statusCode == 200) {
        final responseString = await result.stream.bytesToString();
        final connValue = jsonDecode(responseString);
        return connValue['data'];
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
