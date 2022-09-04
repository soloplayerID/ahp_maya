import 'package:ahp_maya/src/response/bobot_response.dart';
import 'package:flutter/material.dart';

import '../response/kriteria_jawaban_response.dart';

class Bobot {
  String bobot;
  String nama;
  Bobot({required this.bobot, required this.nama});
}

class PerhitunganKriteriaModel {
  int idUser = 0;
  int currentIndex = 0;
  bool isloading = false;
  bool isSuccess = false;
  bool kumpulkan = false;
  final TextEditingController jawabanSelected = TextEditingController();
  List<Bobot> bobot = <Bobot>[];
  BobotResponse bobotResponse = BobotResponse();
  KriteriaJawaban kriteriaJawaban = KriteriaJawaban();
}
