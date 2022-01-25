// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import "package:http/http.dart" as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:textile/src/http_result/http_result.dart';
//
// class AppProvider {
//   String baseUrl = "https://textile.kasbiytalim.uz/api/v1/";
//   static Duration duration = const Duration(seconds: 30);
//
//   static Future<HttpResult> _getResponse(String url) async {
//     if (kDebugMode) {
//       print(url);
//     }
//     var header = await _header();
//     try {
//       http.Response response = await http
//           .get(
//             Uri.parse(url),
//             headers: header,
//           )
//           .timeout(duration);
//       return _result(response);
//     } on TimeoutException catch (_) {
//       return HttpResult(
//         statusCode: -1,
//         isSuccess: false,
//         result: "Internet error",
//       );
//     } on SocketException catch (_) {
//       return HttpResult(
//         statusCode: -1,
//         isSuccess: false,
//         result: "Internet Error",
//       );
//     }
//   }
//
//   static Future<HttpResult> _postResponse(String url, data) async {
//     if (kDebugMode) {
//       print(url);
//       print(data);
//     }
//
//     var header = await _header();
//     try {
//       http.Response response = await http
//           .post(
//             Uri.parse(url),
//             body: data,
//             headers: header,
//           )
//           .timeout(duration);
//
//       return _result(response);
//     } on SocketException catch (_) {
//       return HttpResult(
//         statusCode: -1,
//         isSuccess: false,
//         result: "Internet Error",
//       );
//     } on TimeoutException catch (_) {
//       return HttpResult(
//         statusCode: -1,
//         isSuccess: false,
//         result: "Internet Error",
//       );
//     }
//   }
//
//   static HttpResult _result(http.Response response) {
//     if (kDebugMode) {
//       print(response.body);
//     }
//     if (response.statusCode >= 200 && response.statusCode <= 299) {
//       return HttpResult(
//         statusCode: response.statusCode,
//         isSuccess: true,
//         result: json.decode(utf8.decode(response.bodyBytes)),
//       );
//     } else if (response.statusCode >= 500) {
//       return HttpResult(
//         statusCode: response.statusCode,
//         isSuccess: false,
//         result: "Server error",
//       );
//     } else {
//       return HttpResult(
//         statusCode: response.statusCode,
//         isSuccess: false,
//         result: json.decode(
//           utf8.decode(
//             response.bodyBytes,
//           ),
//         ),
//       );
//     }
//   }
//
//   static dynamic _header() async {
//     return null;
//   }
//
//   Future<HttpResult> getCategory() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var lan = prefs.getString("language") ?? "ru";
//     String url = baseUrl + "category?lan=$lan";
//     return _getResponse(url);
//   }
//   Future<HttpResult> getAboutUs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var lan = prefs.getString("language") ?? "ru";
//     String url = baseUrl + "about?lan=$lan";
//     return _getResponse(url);
//   }
//
//
//
//
//
//   Future<HttpResult> getSubCategory(int id, int companyId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var lan = prefs.getString("language") ?? "ru";
//     String url = baseUrl + "category?company=$companyId&parent=$id&lan=$lan";
//     return _getResponse(url);
//   }
//
//   Future<HttpResult> getCompanyCategory(int id) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var lan = prefs.getString("language") ?? "ru";
//     String url = baseUrl + "category?company=$id&lan=$lan";
//     return _getResponse(url);
//   }
//
//   Future<HttpResult> getCompany() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var lan = prefs.getString("language") ?? "ru";
//     String url = baseUrl + "company/?lan=$lan";
//     return _getResponse(url);
//   }
//
//   Future<HttpResult> getCategoryCompany(int id) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var lan = prefs.getString("language") ?? "ru";
//     String url = baseUrl + "company/$id/?lan=$lan";
//     return _getResponse(url);
//   }
//
//   Future<HttpResult> getProduct(int id, int companyId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var lan = prefs.getString("language") ?? "ru";
//     String url =
//         baseUrl + "product/?category[]=$id&lan=$lan&company=$companyId";
//     return _getResponse(url);
//   }
//
//   Future<HttpResult> getSearch(String text) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var lan = prefs.getString("language") ?? "ru";
//     String url = baseUrl + "product/?search=$text&lan=$lan";
//     return _getResponse(url);
//   }
//
//   Future<HttpResult> getSearchCompany(String text) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var lan = prefs.getString("language") ?? "ru";
//     String url = baseUrl + "company/?search=$text&lan=$lan";
//     return _getResponse(url);
//   }
//
//   Future<HttpResult> getProductCompany(int id) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var lan = prefs.getString("language") ?? "ru";
//     String url = baseUrl + "company/?product[]=$id&lan=$lan";
//     return _getResponse(url);
//   }
//
//   Future<HttpResult> sendCompany(
//     String tradeMark,
//     String number,
//     String mail,
//   ) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var lan = prefs.getString("language") ?? "ru";
//     String url = baseUrl + "company/create/?lan=$lan";
//     var data = {
//       "trademark": tradeMark,
//       "phone": number,
//       "email": mail,
//     };
//     return _postResponse(url, data);
//   }
// }
