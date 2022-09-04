import 'package:flutter/material.dart';

import '../response/alternatif_jawaban_response.dart';
import '../response/bobot_response.dart';

class Murid {
  String bobot;
  String nama;
  Murid({required this.bobot, required this.nama});
}

class PerhitunganAlternatifModel {
  int idUser = 0;
  int currentIndex = 0;
  bool isloading = false;
  bool isSuccess = false;
  bool kumpulkan = false;
  final TextEditingController jawabanSelected = TextEditingController();
  List<Murid> murid = <Murid>[];
  BobotResponse bobotResponse = BobotResponse();
  AlternatifJawaban alternatifJawaban = AlternatifJawaban();
}
