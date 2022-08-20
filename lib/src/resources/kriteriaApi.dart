// ignore_for_file: file_names, avoid_print
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' show Client;

import '../response/kriteria_response.dart';

class KriteriaServices {
  final Client _client = Client();
  Dio dio = Dio();

  Future<String> updateProfile(
      String nama, String ket) async {
    try {
      var a = {'nama': nama, 'ket': ket};
      final d = await dio.post(
          "https://new.tpm-logistics.com/api/ApiTest/addKriteria",
          data: FormData.fromMap(a));
      print(d.data);
      if (d.statusCode == 200) {
        return 'Berhasil Update!';
      } else {
        return 'error';
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<KriteriaResponse> getData() async {
    try {
      final response = await _client.get(
          Uri.parse("https://new.tpm-logistics.com/api/ApiTest/getKriterialAll"));
      print(response.body);
      if (response.statusCode == 200) {
        KriteriaResponse kriteriaResponse =
            KriteriaResponse.fromJson(json.decode(response.body));
        return kriteriaResponse;
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
