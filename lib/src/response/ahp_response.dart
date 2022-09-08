class AhpResponse {
  bool? status;
  List<Data>? data;

  AhpResponse({this.status, this.data});

  AhpResponse.fromJson(Map<String, dynamic> json) {
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
  double? rank0;
  double? rank1;
  double? rank2;
  double? rank3;
  double? rank4;
  double? rank5;

  Data(
      {this.rank0, this.rank1, this.rank2, this.rank3, this.rank4, this.rank5});

  Data.fromJson(Map<String, dynamic> json) {
    rank0 = json['rank0'];
    rank1 = json['rank1'];
    rank2 = json['rank2'];
    rank3 = json['rank3'];
    rank4 = json['rank4'];
    rank5 = json['rank5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rank0'] = rank0;
    data['rank1'] = rank1;
    data['rank2'] = rank2;
    data['rank3'] = rank3;
    data['rank4'] = rank4;
    data['rank5'] = rank5;
    return data;
  }
}
