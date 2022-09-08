class NamaAlternatifResponse {
  bool? status;
  List<Data>? data;

  NamaAlternatifResponse({this.status, this.data});

  NamaAlternatifResponse.fromJson(Map<String, dynamic> json) {
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
  String? nip;
  String? nama;
  String? alamat;
  String? jk;

  Data({this.nip, this.nama, this.alamat, this.jk});

  Data.fromJson(Map<String, dynamic> json) {
    nip = json['nip'];
    nama = json['nama'];
    alamat = json['alamat'];
    jk = json['jk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nip'] = nip;
    data['nama'] = nama;
    data['alamat'] = alamat;
    data['jk'] = jk;
    return data;
  }
}
