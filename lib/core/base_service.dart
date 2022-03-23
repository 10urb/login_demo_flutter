import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../constants/strings/toastr_strings.dart';
import '../helper/environment.dart';
import '../utilities/toastr.dart';
import 'i_base_model.dart';

class BaseService<T> {
  static Future<dynamic> get<T extends IBaseModel>({
    required IBaseModel modelData,
    required String path,
    int? id,
  }) async {
    String uri = Environment.baseUri + path + id.toString();
    String uri1 = Environment.baseUri + path;

    var response = await http.get(Uri.parse(id == null ? uri1 : uri),
        headers: Environment.apiHeader);
    switch (response.statusCode) {
      case HttpStatus.ok:
        var result = jsonBodyParser<T>(modelData, response.body);
        return result;

      case HttpStatus.badRequest:
        Toastr.buildErrorToast(
            ToastrStrings.PROBLEM + response.statusCode.toString());
        return response;
      case HttpStatus.badGateway:
        Toastr.buildErrorToast(
            ToastrStrings.PROBLEM + response.statusCode.toString());
        return response;

      default:
        Toastr.buildErrorToast(
            ToastrStrings.PROBLEM + response.statusCode.toString());
        return response;
    }
  }

  static Future<bool> post<T extends IBaseModel>(
      {required String path, required IBaseModel model}) async {
    String uri = Environment.baseUri + path;

    var toJson = jsonEncode(model.toJson());

    var response = await http.post(Uri.parse(uri),
        body: toJson, headers: Environment.apiHeader);
    switch (response.statusCode) {
      case HttpStatus.ok:
        Toastr.buildSuccessToast("✔");
        return true;

      case HttpStatus.badRequest:
        Toastr.buildErrorToast(
            ToastrStrings.PROBLEM + response.statusCode.toString());
        return false;
      case HttpStatus.badGateway:
        Toastr.buildErrorToast(
            ToastrStrings.PROBLEM + response.statusCode.toString());
        return false;

      default:
        Toastr.buildErrorToast(
            ToastrStrings.PROBLEM + response.statusCode.toString());
        return false;
    }
  }

  static dynamic jsonBodyParser<T>(IBaseModel model, String body) {
    var jsonBody = jsonDecode(body);

    if (jsonBody is List) {
      return jsonBody.map((e) => model.fromJson(e)).toList().cast<T>();
    } else if (jsonBody is Map<String, dynamic>) {
      return model.fromJson(jsonBody);
    } else {
      return jsonBody;
    }
  }
}
