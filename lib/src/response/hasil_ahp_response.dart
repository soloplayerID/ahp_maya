class PerhitunganAhpResponse {
  bool? status;
  List<Data>? data;

  PerhitunganAhpResponse({this.status, this.data});

  PerhitunganAhpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? idAhp;
  String? kriteria;
  String? nama;
  String? prioritas;

  Data({this.idAhp, this.kriteria, this.nama, this.prioritas});

  Data.fromJson(Map<String, dynamic> json) {
    idAhp = json['idAhp'];
    kriteria = json['kriteria'];
    nama = json['nama'];
    prioritas = json['prioritas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idAhp'] = idAhp;
    data['kriteria'] = kriteria;
    data['nama'] = nama;
    data['prioritas'] = prioritas;
    return data;
  }
}
