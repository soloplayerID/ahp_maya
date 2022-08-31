import 'package:flutter/material.dart';

import '../response/bobot_response.dart';

class Murid {
  String bobot;
  String nama;
  Murid({required this.bobot, required this.nama});
}

class PerhitunganAlternatifModel {
  int idUser = 0;
  bool isloading = false;
  bool isSuccess = false;
  final TextEditingController jawabanSelected = TextEditingController();
  List<Murid> murid = <Murid>[];
  BobotResponse bobotResponse = BobotResponse();
}
