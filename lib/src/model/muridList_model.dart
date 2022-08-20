// ignore_for_file: file_names

class Santri {
  String nis;
  String nama;
  String alamat;
  String jk;
  Santri({
    required this.nis,
    required this.nama,
    required this.alamat,
    required this.jk,
  });
}

class SantriListModels {
  int idUser = 0;
  bool isloading = false;
  bool isSuccess = false;
  List<Santri> santri = <Santri>[];
}
