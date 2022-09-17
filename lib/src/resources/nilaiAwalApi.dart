// ignore_for_file: file_names, avoid_print
import 'dart:io';
import 'dart:convert';
import 'package:ahp_maya/src/model/add_nilaiAwal_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' show Client;

import '../response/murid_response.dart';
import '../response/nilai_awal_response.dart';

class NilaiAwalServices {
  final Client _client = Client();
  Dio dio = Dio();

  Future<String> tambahNilai(AddNilaiAwalModel addNilaiAwalModel) async {
    try {
      var a = {
        'nip': addNilaiAwalModel.nip,
        'nilai0': addNilaiAwalModel.nama,
        'nilai1': addNilaiAwalModel.sikap,
        'nilai2': addNilaiAwalModel.nilaiKehadiran,
        'nilai3': addNilaiAwalModel.keterampilan,
        'nilai4': addNilaiAwalModel.interaksiGuru,
      };
      print(a);
      final d = await dio.post(
          "https://new.tpm-logistics.com/api/ApiTest/tambahNilai",
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

  Future<NilaiAwalResponse> getData() async {
    try {
      final response = await _client.get(Uri.parse(
          "https://new.tpm-logistics.com/api/ApiTest/getDataPesertaNilaiAwal"));
      print(response.body);
      if (response.statusCode == 200) {
        NilaiAwalResponse nilaiAwalResponse =
            NilaiAwalResponse.fromJson(json.decode(response.body));
        return nilaiAwalResponse;
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

  Future<MuridResponse> getDataMurid() async {
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
