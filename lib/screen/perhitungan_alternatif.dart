import 'package:ahp_maya/screen/fragment/loading.dart';
import 'package:ahp_maya/src/model/perhitungan_alternatif_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';

import '../src/presenter/perhitungan_alternatif_presenter.dart';
import '../src/state/perhitungan_alternatif_state.dart';
import 'fragment/perhitungan/selectBobot.dart';

class PerhitunganAlternatifScreen extends StatefulWidget {
  const PerhitunganAlternatifScreen({Key? key}) : super(key: key);

  @override
  State<PerhitunganAlternatifScreen> createState() =>
      _PerhitunganAlternatifScreenState();
}

class _PerhitunganAlternatifScreenState
    extends State<PerhitunganAlternatifScreen>
    implements PerhitunganAlternatifState {
  late PerhitunganAlternatifModel _perhitunganAlternatifModel;
  late PerhitunganAlternatifPresenter _perhitunganAlternatifPresenter;

  _PerhitunganAlternatifScreenState() {
    _perhitunganAlternatifPresenter = PerhitunganAlternatifPresenter();
  }

  @override
  void initState() {
    _perhitunganAlternatifPresenter.view = this;
    super.initState();
    _perhitunganAlternatifPresenter.getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _perhitunganAlternatifModel.isloading == true
        ? const Loading()
        : Scaffold(
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
                          'Analisa Alternatif',
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
                                  "Alternatif Pertama",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
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
                                    "SUYANI",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: 30,
                                margin: const EdgeInsets.only(
                                    top: 4, left: 16, bottom: 1, right: 16),
                                decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Color(0xff2D8EFF)),
                                    )),
                                child: TextFormField(
                                  // initialValue: new DateFormat("d, MMMM - y").format(this._signUpModel.tanggalLahir.toLocal()).toString(),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Ionicons.map,
                                        color: Color(0xff2D8EFF),
                                        size: 18,
                                      ),
                                      hintText: "pilih Penilaian",
                                      border: InputBorder.none,
                                      errorStyle: TextStyle(
                                          color: Colors.red, fontSize: 9),
                                      fillColor: Colors.grey,
                                      hintStyle: TextStyle(
                                          color: Color(0xff2D8EFF),
                                          fontSize: 12)),
                                  onTap: (() => {selectJawaban()}),
                                  controller: _perhitunganAlternatifModel
                                      .jawabanSelected,
                                  readOnly: true,
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
                                    "PUSPA",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: const Color(0xff7474BF),
                                onTap: () {
                                  Navigator.pushNamed(context, '');
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 50.0),
                                  height: 43,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 28),
                                            blurRadius: 40,
                                            spreadRadius: -12)
                                      ],
                                      color: Color.fromARGB(255, 39, 199, 124),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const Center(
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
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
          );
  }

  @override
  // ignore: override_on_non_overriding_member
  void selectJawaban() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectBobot(
            key: const Key("1"),
            bobotResponse: _perhitunganAlternatifModel.bobotResponse,
          ),
        )).then((value) {
      setState(() {
        _perhitunganAlternatifModel.jawabanSelected.text =
            _perhitunganAlternatifModel.bobotResponse.data![value].nama
                .toString();
      });
    });
  }

  @override
  void onError(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 15);
  }

  @override
  void onSuccess(String success) {
    Fluttertoast.showToast(
        msg: success,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 15);
  }

  @override
  void refreshData(PerhitunganAlternatifModel perhitunganAlternatifModel) {
    setState(() {
      _perhitunganAlternatifModel = perhitunganAlternatifModel;
    });
  }
}
