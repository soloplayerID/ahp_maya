// ignore_for_file: file_names, avoid_print
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' show Client;

import '../response/bobot_response.dart';

class AnalisaServices {
  final Client _client = Client();
  Dio dio = Dio();

  Future<BobotResponse> getDataBobot() async {
    try {
      final response = await _client
          .get(Uri.parse("https://new.tpm-logistics.com/api/ApiTest/getBobot"));
      print(response.body);
      if (response.statusCode == 200) {
        BobotResponse muridResponse =
            BobotResponse.fromJson(json.decode(response.body));
        return muridResponse;
      } else {
        return Future.error("data kosong 🤷‍♂️");
      }
    } on SocketException {
      return Future.error("Yah, Internet Kamu error!😑");
    } on HttpException {
      print("Fungsi post ga nemu 😱");
      // return Future.error("Fungsi post ga nemu 😱");
      return Future.error("terjadi error");
    } on FormatException {
      print("Response format kacauu! 👎");
      // return Future.error("Response format kacauu! 👎");
      return Future.error("terjadi error");
    }
  }
}
