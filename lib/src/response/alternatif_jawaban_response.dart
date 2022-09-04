class AlternatifJawaban {
  bool? status;
  List<Data>? data;

  AlternatifJawaban({this.status, this.data});

  AlternatifJawaban.fromJson(Map<String, dynamic> json) {
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
  String? kriteriaPertama;
  late String bobot;
  String? kriteriaKedua;

  Data({this.kriteriaPertama, this.kriteriaKedua});

  Data.fromJson(Map<String, dynamic> json) {
    kriteriaPertama = json['kriteria_pertama'];
    bobot = '';
    kriteriaKedua = json['kriteria_kedua'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kriteria_pertama'] = kriteriaPertama;
    data['kriteria_kedua'] = kriteriaKedua;
    return data;
  }
}
