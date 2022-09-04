// ignore_for_file: file_names, avoid_print
import 'dart:io';
import 'dart:convert';
import 'package:ahp_maya/src/model/perhitungan_kriteria_model.dart';
import 'package:ahp_maya/src/response/alternatif_jawaban_response.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' show Client;

import '../response/bobot_response.dart';
import '../response/kriteria_jawaban_response.dart';

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

  Future<KriteriaJawaban> getDataJawaban() async {
    try {
      final response = await _client.get(Uri.parse(
          "https://new.tpm-logistics.com/api/ApiTest/getJawabanKriteria"));
      print(response.body);
      if (response.statusCode == 200) {
        KriteriaJawaban kriteriaJawaban =
            KriteriaJawaban.fromJson(json.decode(response.body));
        return kriteriaJawaban;
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

  Future<AlternatifJawaban> getDataJawabanAlternatif() async {
    try {
      final response = await _client.get(Uri.parse(
          "https://new.tpm-logistics.com/api/ApiTest/getJawabanAlternatif"));
      print(response.body);
      if (response.statusCode == 200) {
        AlternatifJawaban alternatifJawaban =
            AlternatifJawaban.fromJson(json.decode(response.body));
        return alternatifJawaban;
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

  Future<String> submitKriteria(
      PerhitunganKriteriaModel perhitunganKriteriaModel) async {
    try {
      var a = {
        "bobot11": perhitunganKriteriaModel.kriteriaJawaban.data![0].bobot,
        "bobot12": perhitunganKriteriaModel.kriteriaJawaban.data![1].bobot,
        "bobot13": perhitunganKriteriaModel.kriteriaJawaban.data![2].bobot,
        "bobot14": perhitunganKriteriaModel.kriteriaJawaban.data![3].bobot,
        "bobot22": perhitunganKriteriaModel.kriteriaJawaban.data![4].bobot,
        "bobot23": perhitunganKriteriaModel.kriteriaJawaban.data![5].bobot,
        "bobot24": perhitunganKriteriaModel.kriteriaJawaban.data![6].bobot,
        "bobot33": perhitunganKriteriaModel.kriteriaJawaban.data![7].bobot,
        "bobot34": perhitunganKriteriaModel.kriteriaJawaban.data![8].bobot,
        "bobot44": perhitunganKriteriaModel.kriteriaJawaban.data![9].bobot,
      };
      final d = await dio.post(
          "https://new.tpm-logistics.com/api/ApiTest/inputKriteria",
          data: FormData.fromMap(a));
      print(d.data);
      if (d.statusCode == 200) {
        return 'Berhasil Update!';
      } else {
        return 'error';
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
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
