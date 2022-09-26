// ignore_for_file: file_names, avoid_print
import 'dart:io';
import 'dart:convert';
// import 'package:ahp_maya/src/response/nama_alternatif_response.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' show Client;

// import '../response/ahp_response.dart';
import '../response/hasil_ahp_response.dart';
import '../response/kriteria_response.dart';
import '../response/rank_response.dart';

class HasilServices {
  final Client _client = Client();
  Dio dio = Dio();

  // Future<NamaAlternatifResponse> getDataNama() async {
  //   try {
  //     final response = await _client.get(Uri.parse(
  //         "https://new.tpm-logistics.com/api/ApiTest/hasilPerbandinganNama"));
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       NamaAlternatifResponse hasilResponse =
  //           NamaAlternatifResponse.fromJson(json.decode(response.body));
  //       return hasilResponse;
  //     } else {
  //       return Future.error("data kosong 🤷‍♂️");
  //     }
  //   } on SocketException {
  //     return Future.error("Yah, Internet Kamu error!😑");
  //   } on HttpException {
  //     print("Fungsi post ga nemu 😱");
  //     // return Future.error("Fungsi post ga nemu 😱");
  //     return Future.error("terjadi error");
  //   } on FormatException {
  //     print("Response format kacauu! 👎");
  //     // return Future.error("Response format kacauu! 👎");
  //     return Future.error("terjadi error");
  //   }
  // }

  // Future<AhpResponse> getDataAhp() async {
  //   try {
  //     final response = await _client.get(Uri.parse(
  //         "https://new.tpm-logistics.com/api/ApiTest/hasilPerbandinganAhp"));
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       AhpResponse hasilResponse =
  //           AhpResponse.fromJson(json.decode(response.body));
  //       return hasilResponse;
  //     } else {
  //       return Future.error("data kosong 🤷‍♂️");
  //     }
  //   } on SocketException {
  //     return Future.error("Yah, Internet Kamu error!😑");
  //   } on HttpException {
  //     print("Fungsi post ga nemu 😱");
  //     // return Future.error("Fungsi post ga nemu 😱");
  //     return Future.error("terjadi error");
  //   } on FormatException {
  //     print("Response format kacauu! 👎");
  //     // return Future.error("Response format kacauu! 👎");
  //     return Future.error("terjadi error");
  //   }
  // }

  Future<RankResponse> getDataRank() async {
    try {
      final response = await _client.get(Uri.parse(
          "https://new.tpm-logistics.com/api/ApiTest/hasilPerbandinganRank"));
      print(response.body);
      if (response.statusCode == 200) {
        RankResponse hasilResponse =
            RankResponse.fromJson(json.decode(response.body));
        return hasilResponse;
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

  Future<KriteriaResponse> getDataKriteria() async {
    try {
      final response = await _client.get(Uri.parse(
          "https://new.tpm-logistics.com/api/ApiTest/getKriterialAll"));
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

  Future<PerhitunganAhpResponse> getDataAhp() async {
    try {
      final response = await _client.get(Uri.parse(
          "https://new.tpm-logistics.com/api/ApiTest/hasilPerbandinganAhp"));
      print(response.body);
      if (response.statusCode == 200) {
        PerhitunganAhpResponse perhitunganAhpResponse =
            PerhitunganAhpResponse.fromJson(json.decode(response.body));
        return perhitunganAhpResponse;
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
