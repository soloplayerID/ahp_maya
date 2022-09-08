class RankResponse {
  bool? status;
  List<Data>? data;

  RankResponse({this.status, this.data});

  RankResponse.fromJson(Map<String, dynamic> json) {
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
  String? nama;
  String? nilai;
  int? ranking;

  Data({this.nama, this.nilai, this.ranking});

  Data.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    nilai = json['nilai'].toString();
    ranking = json['ranking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['nilai'] = nilai;
    data['ranking'] = ranking;
    return data;
  }
}
