// ignore_for_file: file_names, avoid_print
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' show Client;

import '../response/murid_response.dart';

class MuridServices {
  final Client _client = Client();
  Dio dio = Dio();

  Future<String> updateProfile(
      String nis, String nama, String alamat, String jk) async {
    try {
      var a = {'nis': nis, 'nama': nama, 'alamat': alamat, 'jk': jk};
      final d = await dio.post(
          "https://new.tpm-logistics.com/api/ApiTest/addMurid",
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

  Future<String> deleteProfile(String nis) async {
    try {
      var a = {'nis': nis};
      final d = await dio.post(
          "https://new.tpm-logistics.com/api/ApiTest/deleteMurid",
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

  Future<MuridResponse> getData() async {
    try {
      final response = await _client.get(
          Uri.parse("https://new.tpm-logistics.com/api/ApiTest/getDataMurid"));
      print(response.body);
      if (response.statusCode == 200) {
        MuridResponse muridResponse =
            MuridResponse.fromJson(json.decode(response.body));
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
