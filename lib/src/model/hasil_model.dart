class Rank {
  String nama;
  String nilai;
  String ranking;
  Rank({
    required this.nama,
    required this.nilai,
    required this.ranking,
  });
}

class KriteriaHasil {
  String idKriteria;
  String nama;
  String ket;
  KriteriaHasil({
    required this.idKriteria,
    required this.nama,
    required this.ket,
  });
}

class AhpModel {
  int id;
  String namaHasil;
  String prioritas;
  String kriteria;
  AhpModel({
    required this.id,
    required this.namaHasil,
    required this.prioritas,
    required this.kriteria,
  });
}

class HasilModels {
  int idUser = 0;
  bool isloading = false;
  bool isSuccess = false;
  List<Rank> rank = <Rank>[];
  List<KriteriaHasil> kriteriaHasil = [];
  List<AhpModel> ahpModel = [];
}
