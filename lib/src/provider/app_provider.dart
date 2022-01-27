import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:book_ogabek/src/model/http_result.dart';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;

class AppProvider {
  String baseUrl = "http://co82804-wordpress-1.tw1.ru/wp-json/nabooks/v1/";
  static Duration duration = const Duration(seconds: 30);

  static Future<HttpResult> _getResponse(String url) async {
    if (kDebugMode) {
      print(url);
    }

    try {
      http.Response response = await http
          .get(
            Uri.parse(url),

          )
          .timeout(duration);
      return _result(response);
    } on TimeoutException catch (_) {
      return HttpResult(
        statusCode: -1,
        isSuccess: false,
        result: "Internet error",
      );
    } on SocketException catch (_) {
      return HttpResult(
        statusCode: -1,
        isSuccess: false,
        result: "Internet Error",
      );
    }
  }

  static Future<HttpResult> _postResponse(String url, data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }


    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            body: data,

          )
          .timeout(duration);

      return _result(response);
    } on SocketException catch (_) {
      return HttpResult(
        statusCode: -1,
        isSuccess: false,
        result: "Internet Error",
      );
    } on TimeoutException catch (_) {
      return HttpResult(
        statusCode: -1,
        isSuccess: false,
        result: "Internet Error",
      );
    }
  }

  static HttpResult _result(http.Response response) {
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: true,
        result: json.decode(utf8.decode(response.bodyBytes)),
      );
    } else if (response.statusCode >= 500) {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: false,
        result: "Server error",
      );
    } else {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: false,
        result: json.decode(
          utf8.decode(
            response.bodyBytes,
          ),
        ),
      );
    }
  }










  Future<HttpResult> getBook() async {


    String url = baseUrl + "books";
    return _getResponse(url);
  }




}
