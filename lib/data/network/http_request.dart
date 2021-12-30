import 'dart:convert';

import 'package:http/http.dart' as http;

class ServerData {
  Future<HttpResponse> getData({
    String? path,
  }) async {
    try {
      var response = await http
          .get(Uri.parse(path!), headers: {"Content-Type": "application/json"});

      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return HttpData(data);
      } else {
        return HttpData(data);
      }
    } catch (e) {
      return HttpException('something wrong happened');
    }
  }

  Future<HttpResponse> postData({required String path, List<Map>? body}) async {
    try {
      var response = await http.post(Uri.parse(path),
          body: body != null ? json.encode(body) : null,
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return HttpData(data);
      } else {
        return HttpData(data);
      }
    } catch (e) {
      return HttpException(
          {"message": 'something wrong happened', "error": true});
    }
  }
}

abstract class HttpResponse {
  dynamic data;
}

class HttpException extends HttpResponse {
  final data;

  HttpException(this.data);
}

class HttpData extends HttpResponse {
  final data;

  HttpData(this.data);
}
