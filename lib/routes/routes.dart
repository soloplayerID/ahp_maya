import 'package:ahp_maya/screen/hasil.dart';
import 'package:ahp_maya/screen/home.dart';
import 'package:ahp_maya/screen/kriteria.dart';
import 'package:ahp_maya/screen/nilai_awal.dart';
import 'package:flutter/material.dart';

import '../screen/fragment/kriteria/kriteria_add.dart';
import '../screen/fragment/murid/murid_add.dart';
import '../screen/fragment/nilai_awal/nilaiAwal_add.dart';
import '../screen/login.dart';
import '../screen/murid.dart';
import '../screen/perhitungan.dart';
import '../screen/perhitungan_alternatif.dart';
import '../screen/perhitungan_kriteria.dart';

final routes = {
  '/': (BuildContext context) => const Login(),
  '/home': (BuildContext context) => const HomePage(),
  '/murid': (BuildContext context) => const MuridListScreen(),
  '/addMurid': (BuildContext context) => const EditeProfileScreen(),
  '/kriteria': (BuildContext context) => const KriteriaListScreen(),
  '/addKriteria': (BuildContext context) => const AddKriteriaScreen(),
  '/nilaiAwal': (BuildContext context) => const NilaiAwalListScreen(),
  '/addNilaiAwal': (BuildContext context) => const AddNilaiAwalScreen(),
  '/perhitungan': (BuildContext context) => const MulaiPerhitunganScreen(),
  '/perhitunganKriteria': (BuildContext context) =>
      const PerhitunganKriteriaScreen(),
  '/perhitunganAlternatif': (BuildContext context) =>
      const PerhitunganAlternatifScreen(),
  '/hasil': (BuildContext context) => const HasilScreen(),
};
