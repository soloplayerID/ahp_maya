import 'package:ahp_maya/src/response/bobot_response.dart';
import 'package:flutter/material.dart';

class Bobot {
  String bobot;
  String nama;
  Bobot({required this.bobot, required this.nama});
}

class PerhitunganKriteriaModel {
  int idUser = 0;
  bool isloading = false;
  bool isSuccess = false;
  final TextEditingController jawabanSelected = TextEditingController();
  List<Bobot> bobot = <Bobot>[];
  BobotResponse bobotResponse = BobotResponse();
}
