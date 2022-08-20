class NilaiAwalResponse {
  bool? status;
  List<Data>? data;

  NilaiAwalResponse({this.status, this.data});

  NilaiAwalResponse.fromJson(Map<String, dynamic> json) {
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
  String? idNilaiAwal;
  String? nip;
  String? nilai;
  String? keterangan;
  String? periode;
  String? nama;
  String? alamat;
  String? jk;
  String? idnilai;

  Data(
      {this.idNilaiAwal,
      this.nip,
      this.nilai,
      this.keterangan,
      this.periode,
      this.nama,
      this.alamat,
      this.jk,
      this.idnilai});

  Data.fromJson(Map<String, dynamic> json) {
    idNilaiAwal = json['id_nilai_awal'];
    nip = json['nip'];
    nilai = json['nilai'];
    keterangan = json['keterangan'];
    periode = json['periode'];
    nama = json['nama'];
    alamat = json['alamat'];
    jk = json['jk'];
    idnilai = json['idnilai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_nilai_awal'] = idNilaiAwal;
    data['nip'] = nip;
    data['nilai'] = nilai;
    data['keterangan'] = keterangan;
    data['periode'] = periode;
    data['nama'] = nama;
    data['alamat'] = alamat;
    data['jk'] = jk;
    data['idnilai'] = idnilai;
    return data;
  }
}
