// ignore_for_file: file_names

class Kriteria {
  String idKriteria;
  String nama;
  String ket;
  Kriteria({
    required this.idKriteria,
    required this.nama,
    required this.ket,
  });
}

class KriteriaListModels {
  int idUser = 0;
  bool isloading = false;
  bool isSuccess = false;
  List<Kriteria> kriteria = <Kriteria>[];
}
