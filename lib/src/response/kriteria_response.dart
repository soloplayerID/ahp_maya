class KriteriaResponse {
  bool? status;
  List<Data>? data;

  KriteriaResponse({this.status, this.data});

  KriteriaResponse.fromJson(Map<String, dynamic> json) {
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
  String? idKriteria;
  String? nama;
  String? ket;

  Data({this.idKriteria, this.nama, this.ket});

  Data.fromJson(Map<String, dynamic> json) {
    idKriteria = json['id_kriteria'];
    nama = json['nama'];
    ket = json['ket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_kriteria'] = idKriteria;
    data['nama'] = nama;
    data['ket'] = ket;
    return data;
  }
}
