import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:travel_blog/core/base/model/base_model.dart';
import 'package:travel_blog/core/base/model/error_model.dart';
import 'package:travel_blog/ui/profile_page/model/user_model.dart';

Future<dynamic> httpGet<T extends BaseModel>(String path, T model) async {
  try {
    final response = await http.get(path);
    if (response is http.Response) {
      switch (response.statusCode) {
        case HttpStatus.ok:
          return _bodyParser<T>(response.body, model);
        default:
          throw ErrorModel(response.body);
      }
    }
  } catch (e) {
    return ErrorModel("HttpError");
  }
}

dynamic _bodyParser<T extends BaseModel>(String body, BaseModel model) {
  final jsonBody = jsonDecode(body);

  if (jsonBody is List) {
    return jsonBody.map((e) => model.fromJson(e)).cast<T>().toList();
  } else if (jsonBody is Map) {
    if (jsonBody.values.length == Profile.INFO_LENGTH.getInfoLength())
      return ProfileUserModel.fromJson(jsonBody);
    else
      return jsonBody.values.map((e) => model.fromJson(e)).cast<T>().toList();
  } else {
    return jsonBody;
  }
}

enum Profile { INFO_LENGTH }

extension ProfileInfo on Profile {
  int getInfoLength() {
    if (this.index == 0) return 7;
  }
}
