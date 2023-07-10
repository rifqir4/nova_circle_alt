import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nova_circle_alt/core/config/dependency_injection.dart';
import 'package:nova_circle_alt/core/config/flavor_config.dart';
import 'package:nova_circle_alt/core/utils/app_log.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ApiClient {
  late FlavorConfig _flavorConfig;

  ApiClient(FlavorConfig? flavorConfig, http.Client? client) {
    _flavorConfig = flavorConfig ?? di<FlavorConfig>();
  }

  String get _baseUrl => _flavorConfig.webUrl;
  Duration get _timeout => const Duration(seconds: 20);

  Future<Map<String, String>> _requestHeaders() async {
    final Map<String, String> requestHeaders = {};

    //Version and build
    final packageInfo = await PackageInfo.fromPlatform();
    final appBuildNumber = packageInfo.buildNumber;
    final appVersion = packageInfo.version;

    requestHeaders.addAll({
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Platform": Uri.encodeComponent(Platform.operatingSystem),
      "Version": Uri.encodeComponent(appVersion),
      "Build": Uri.encodeComponent(appBuildNumber),
    });

    //AUTH HEADER
    requestHeaders.addAll({
      "Authorization": "Bearer ",
    });

    return requestHeaders;
  }

  Future<http.Response> get(
    String url, {
    Map<String, dynamic>? queryParameter,
  }) async {
    final uri = Uri.parse(_baseUrl + url.toString());
    final requestHeaders = await _requestHeaders();

    try {
      final request = http.get(uri, headers: requestHeaders);
      http.Response response = await request.timeout(_timeout);

      //Handle Token Expired
      if (response.statusCode == 401) {
        bool isTokenRefreshed = true;

        if (isTokenRefreshed) {
          response = await request.timeout(_timeout);
          return response;
        }
      }

      return response;
    } on SocketException {
      throw Exception("No Internet Connection");
    } on TimeoutException {
      throw Exception("Cannot Reach Server");
    }
  }

  Future<http.Response> post(
    Uri url, {
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse(_baseUrl + url.toString());
    final requestHeaders = await _requestHeaders();
    final requestBody = convert.jsonEncode(body);

    try {
      final request = http.post(
        uri,
        headers: requestHeaders,
        body: requestBody,
      );

      http.Response response = await request.timeout(_timeout);

      //Handle Token Expired
      if (response.statusCode == 401) {
        bool isTokenRefreshed = true;

        if (isTokenRefreshed) {
          response = await request.timeout(_timeout);
          return response;
        }
      }

      return response;
    } on SocketException {
      throw Exception("No Internet Connection");
    } on TimeoutException {
      throw Exception("Cannot Reach Server");
    }
  }

  Future<http.Response> patch(
    Uri url, {
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse(_baseUrl + url.toString());
    final requestHeaders = await _requestHeaders();
    final requestBody = convert.jsonEncode(body);

    try {
      final request = http.patch(
        uri,
        headers: requestHeaders,
        body: requestBody,
      );

      http.Response response = await request.timeout(_timeout);

      //Handle Token Expired
      if (response.statusCode == 401) {
        bool isTokenRefreshed = true;

        if (isTokenRefreshed) {
          response = await request.timeout(_timeout);
          return response;
        }
      }

      return response;
    } on SocketException {
      throw Exception("No Internet Connection");
    } on TimeoutException {
      throw Exception("Cannot Reach Server");
    }
  }

  Future<http.Response> put(
    Uri url, {
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse(_baseUrl + url.toString());
    final requestHeaders = await _requestHeaders();
    final requestBody = convert.jsonEncode(body);

    try {
      final request = http.put(
        uri,
        headers: requestHeaders,
        body: requestBody,
      );

      http.Response response = await request.timeout(_timeout);

      //Handle Token Expired
      if (response.statusCode == 401) {
        bool isTokenRefreshed = true;

        if (isTokenRefreshed) {
          response = await request.timeout(_timeout);
          return response;
        }
      }

      return response;
    } on SocketException {
      throw Exception("No Internet Connection");
    } on TimeoutException {
      throw Exception("Cannot Reach Server");
    }
  }

  Future<http.Response> delete(Uri url) async {
    final uri = Uri.parse(_baseUrl + url.toString());
    final requestHeaders = await _requestHeaders();

    try {
      final request = http.delete(uri, headers: requestHeaders);

      http.Response response = await request.timeout(_timeout);

      //Handle Token Expired
      if (response.statusCode == 401) {
        bool isTokenRefreshed = true;

        if (isTokenRefreshed) {
          response = await request.timeout(_timeout);
          return response;
        }
      }

      return response;
    } on SocketException {
      throw Exception("No Internet Connection");
    } on TimeoutException {
      throw Exception("Cannot Reach Server");
    }
  }

  Future<bool> refreshToken() async {
    const token = "";
    final uri = Uri.parse('${_baseUrl}refresh');

    final response = await post(uri);
    if (response.statusCode == 200) {
      logg.d("Token Refresh");
      return true;
    }

    return false;
  }
}
