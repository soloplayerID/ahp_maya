class BobotResponse {
  bool? status;
  List<Data>? data;

  BobotResponse({this.status, this.data});

  BobotResponse.fromJson(Map<String, dynamic> json) {
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
  String? bobot;
  String? nama;

  Data({this.bobot, this.nama});

  Data.fromJson(Map<String, dynamic> json) {
    bobot = json['bobot'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bobot'] = bobot;
    data['nama'] = nama;
    return data;
  }
}
