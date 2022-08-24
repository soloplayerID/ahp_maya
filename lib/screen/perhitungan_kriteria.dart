import 'package:ahp_maya/src/model/perhitungan_kriteria_model.dart';
import 'package:ahp_maya/src/presenter/perhitungan_kriteria_presenter.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';

import '../src/state/perhitungan_Kriteria_state.dart';
import 'fragment/loading.dart';

class PerhitunganKriteriaScreen extends StatefulWidget {
  const PerhitunganKriteriaScreen({Key? key}) : super(key: key);

  @override
  State<PerhitunganKriteriaScreen> createState() =>
      PerhitunganKriteriaScreenState();
}

class PerhitunganKriteriaScreenState extends State<PerhitunganKriteriaScreen>
    implements PerhitunganKriteriaState {
  late PerhitunganKriteriaModel _perhitunganKriteriaModel;
  late PerhitunganKriteriaPresenter _perhitunganKriteriaPresenter;

  PerhitunganKriteriaScreenState() {
    _perhitunganKriteriaPresenter = PerhitunganKriteriaPresenter();
  }

  @override
  void initState() {
    _perhitunganKriteriaPresenter.view = this;
    super.initState();
    _perhitunganKriteriaPresenter.getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _perhitunganKriteriaModel.isloading
        ? const Loading()
        : SafeArea(
            child: Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              child: Column(
                children: [
                  Container(
                    color: const Color(0XFFA0D995),
                    padding:
                        const EdgeInsets.only(top: 30, left: 20, right: 20),
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Icon(LineIcons.arrowLeft,
                              color: Colors.white, size: 30),
                        ),
                        const Text(
                          'Pilih perhitungan',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        height: double.infinity,
                        color: const Color(0xffecedf2),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              const Center(
                                child: Text(
                                  "Kriteria Pertamma",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 15.0),
                                height: 43,
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 28),
                                          blurRadius: 40,
                                          spreadRadius: -12)
                                    ],
                                    color: Color.fromARGB(255, 185, 187, 186),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Center(
                                  child: Text(
                                    "Sikap",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              const Center(
                                child: Text(
                                  "Penilaian",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: 30,
                                margin: EdgeInsets.only(
                                    top: 4, left: 16, bottom: 1, right: 16),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Color(0xff2D8EFF)),
                                    )),
                                child: TextFormField(
                                  // initialValue: new DateFormat("d, MMMM - y").format(this._signUpModel.tanggalLahir.toLocal()).toString(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Ionicons.map,
                                        color: Color(0xff2D8EFF),
                                        size: 18,
                                      ),
                                      hintText: "Provinsi",
                                      border: InputBorder.none,
                                      errorStyle: TextStyle(
                                          color: Colors.red, fontSize: 9),
                                      fillColor: Colors.grey,
                                      hintStyle: TextStyle(
                                          color: Color(0xff2D8EFF),
                                          fontSize: 12)),
                                  onTap: (() => {selectJawaban()}),
                                  controller:
                                      _perhitunganKriteriaModel.jawabanSelected,
                                  readOnly: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
  }

  @override
  // ignore: override_on_non_overriding_member
  void selectJawaban() async {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => SelectProvinsi(
    //         key: Key("1"),
    //         provinsiResponse: this._selectSekolahModel.provinsi,
    //       ),
    //     )).then((value) {
    //   print(this._selectSekolahModel.provinsi.data[value].id);
    //   setState(() {
    //     this._selectSekolahModel.idProv =
    //         this._selectSekolahModel.provinsi.data[value].id;
    //     this._selectSekolahModel.namaProv =
    //         this._selectSekolahModel.provinsi.data[value].name;
    //     this._selectSekolahModel.provinsiController.text =
    //         this._selectSekolahModel.provinsi.data[value].name;
    //     this
    //         ._selectSekolahPresenter
    //         .getArea(this._selectSekolahModel.provinsi.data[value].id);
    //   });
    //   this.refreshData(this._selectSekolahModel);
    //   // Navigator.of(context).pop();
    // });
  }

  @override
  void onError(String error) {}

  @override
  void onSuccess(String success) {}

  @override
  void refreshData(PerhitunganKriteriaModel perhitunganKriteriaModel) {
    _perhitunganKriteriaModel = perhitunganKriteriaModel;
  }
}
