// ignore_for_file: file_names

class NilaiAwal {
  String idNilaiAwal;
  String nama;
  String keterangan;
  String periode;
  String nilai;
  NilaiAwal({
    required this.idNilaiAwal,
    required this.nama,
    required this.keterangan,
    required this.periode,
    required this.nilai,
  });
}

class NilaiAwalListModels {
  int idUser = 0;
  bool isloading = false;
  bool isSuccess = false;
  List<NilaiAwal> nilaiAwal = <NilaiAwal>[];
}
