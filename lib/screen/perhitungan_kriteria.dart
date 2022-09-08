// ignore_for_file: unnecessary_string_interpolations, sort_child_properties_last

import 'package:ahp_maya/src/model/perhitungan_kriteria_model.dart';
import 'package:ahp_maya/src/presenter/perhitungan_kriteria_presenter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';

import '../src/state/perhitungan_Kriteria_state.dart';
import 'fragment/loading.dart';
import 'fragment/perhitungan/selectBobot.dart';

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

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('kamu yakin?'),
            content: const Text('kamu mau meninggalkan halaman?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: _perhitunganKriteriaModel.isloading == true ||
                  _perhitunganKriteriaModel.kriteriaJawaban.data == null
              ? const Loading()
              : Container(
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
                              onTap: () async {
                                // await showDialog(
                                //   context: context,
                                //   builder: (context) => AlertDialog(
                                //     title: const Text('kamu yakin?'),
                                //     content: const Text(
                                //         'kamu mau meninggalkan halaman?'),
                                //     actions: <Widget>[
                                //       FlatButton(
                                //         onPressed: () =>
                                //             Navigator.of(context).pop(false),
                                //         child: const Text('No'),
                                //       ),
                                //       // ignore: deprecated_member_use
                                //       FlatButton(
                                //         onPressed: () {
                                //           Navigator.of(context).pop(true);
                                //         },
                                //         child: const Text('Yes'),
                                //       ),
                                //     ],
                                //   ),
                                // );
                                Navigator.of(context).pop(true);
                              },
                              child: const Icon(LineIcons.arrowLeft,
                                  color: Colors.white, size: 30),
                            ),
                            Text(
                              'Analisa Kriteria ${_perhitunganKriteriaModel.currentIndex + 1}/${_perhitunganKriteriaModel.kriteriaJawaban.data!.length}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                                      "Kriteria Pertama",
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
                                        color:
                                            Color.fromARGB(255, 185, 187, 186),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                      child: Text(
                                        "${_perhitunganKriteriaModel.kriteriaJawaban.data![_perhitunganKriteriaModel.currentIndex].kriteriaPertama.toString()}",
                                        style: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25.0,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.2,
                                    height: 30,
                                    margin: const EdgeInsets.only(
                                        top: 4, left: 16, bottom: 1, right: 16),
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Color(0xff2D8EFF)),
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
                                          hintText: "pilih kriteria",
                                          border: InputBorder.none,
                                          errorStyle: TextStyle(
                                              color: Colors.red, fontSize: 9),
                                          fillColor: Colors.grey,
                                          hintStyle: TextStyle(
                                              color: Color(0xff2D8EFF),
                                              fontSize: 12)),
                                      onTap: (() => {selectJawaban()}),
                                      controller: _perhitunganKriteriaModel
                                          .jawabanSelected,
                                      readOnly: true,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 15.0),
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
                                        color:
                                            Color.fromARGB(255, 185, 187, 186),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                      child: Text(
                                        "${_perhitunganKriteriaModel.kriteriaJawaban.data![_perhitunganKriteriaModel.currentIndex].kriteriaKedua}",
                                        style: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  _perhitunganKriteriaModel.kumpulkan == false
                                      ? InkWell(
                                          splashColor: const Color(0xff7474BF),
                                          onTap: () {
                                            if (_perhitunganKriteriaModel
                                                    .kriteriaJawaban
                                                    .data![
                                                        _perhitunganKriteriaModel
                                                            .currentIndex]
                                                    .bobot !=
                                                '') {
                                              _perhitunganKriteriaPresenter
                                                  .jawab(1);
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: 'pilih dulu bobot!',
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 2,
                                                  backgroundColor: Colors.amber,
                                                  textColor: Colors.white,
                                                  fontSize: 15);
                                            }
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 50.0),
                                            height: 43,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            decoration: const BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(0, 28),
                                                      blurRadius: 40,
                                                      spreadRadius: -12)
                                                ],
                                                color: Color.fromARGB(
                                                    255, 39, 122, 199),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: const Center(
                                              child: Text(
                                                "Next",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          splashColor: const Color(0xff7474BF),
                                          onTap: () {
                                            if (_perhitunganKriteriaModel
                                                    .kriteriaJawaban
                                                    .data![
                                                        _perhitunganKriteriaModel
                                                            .currentIndex]
                                                    .bobot !=
                                                '') {
                                              _perhitunganKriteriaPresenter
                                                  .submit();
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: 'pilih dulu bobot!',
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  backgroundColor: Colors.amber,
                                                  textColor: Colors.white,
                                                  fontSize: 15);
                                            }
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 50.0),
                                            height: 43,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            decoration: const BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(0, 28),
                                                      blurRadius: 40,
                                                      spreadRadius: -12)
                                                ],
                                                color: Color.fromARGB(
                                                    255, 39, 199, 124),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: const Center(
                                              child: Text(
                                                "Submit",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
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
        ),
        onWillPop: _onWillPop);
  }

  @override
  // ignore: override_on_non_overriding_member
  void selectJawaban() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectBobot(
            key: const Key("1"),
            bobotResponse: _perhitunganKriteriaModel.bobotResponse,
          ),
        )).then((value) {
      if (value != null) {
        setState(() {
          _perhitunganKriteriaModel.jawabanSelected.text =
              _perhitunganKriteriaModel.bobotResponse.data![value].nama
                  .toString();
          _perhitunganKriteriaModel.kriteriaJawaban
                  .data![_perhitunganKriteriaModel.currentIndex].bobot =
              _perhitunganKriteriaModel.bobotResponse.data![value].bobot
                  .toString();
          Fluttertoast.showToast(
              msg: 'jawaban tersimpan',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: const Color.fromARGB(255, 94, 160, 155),
              textColor: Colors.white,
              fontSize: 15);
          // _perhitunganKriteriaPresenter.jawab(1);
        });
      }
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
  void onFinish(String success) {
    Fluttertoast.showToast(
        msg: success,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 15);
    Navigator.of(context).pop(true);
  }

  @override
  void refreshData(PerhitunganKriteriaModel perhitunganKriteriaModel) {
    setState(() {
      _perhitunganKriteriaModel = perhitunganKriteriaModel;
    });
  }
}
