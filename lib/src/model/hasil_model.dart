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

class HasilModels {
  int idUser = 0;
  bool isloading = false;
  bool isSuccess = false;
  List<Rank> rank = <Rank>[];
}
