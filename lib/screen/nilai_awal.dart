// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ahp_maya/screen/fragment/loading.dart';

import '../src/model/nilai_awal.dart';
import '../src/presenter/nilai_awal_list_presenter.dart';
import '../src/resources/session.dart';
import '../src/state/nilai_awal_list_state.dart';

class NilaiAwalListScreen extends StatefulWidget {
  const NilaiAwalListScreen({Key? key}) : super(key: key);

  @override
  State<NilaiAwalListScreen> createState() => _NilaiAwalListScreenState();
}

class _NilaiAwalListScreenState extends State<NilaiAwalListScreen>
    implements NilaiAwalListState {
  late NilaiAwalListModels _nilaiAwalListModel;
  late NilaiAwalListPresenter _nilaiAwalListPresenter;

  _NilaiAwalListScreenState() {
    _nilaiAwalListPresenter = NilaiAwalListPresenter();
  }

  @override
  void initState() {
    Session.getId().then((value) {
      setState(() {
        _nilaiAwalListModel.idUser = int.parse(value!);
      });
    });
    _nilaiAwalListPresenter.view = this;
    super.initState();
    _nilaiAwalListPresenter.getData();
  }

  @override
  void dispose() {
    super.dispose();
    _nilaiAwalListModel.nilaiAwal.clear();
  }

  @override
  Widget build(BuildContext context) {
    return _nilaiAwalListModel.isloading
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
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/addNilaiAwal');
                            },
                            child: const Icon(LineIcons.plus,
                                color: Colors.white, size: 30),
                          ),
                        ],
                      ),
                    ),
                    _nilaiAwalListModel.nilaiAwal.isEmpty
                        ? Container(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Center(
                              child: Text('Belum Ada data',
                                  style: GoogleFonts.poppins(
                                    fontStyle: FontStyle.italic,
                                    textStyle: const TextStyle(
                                        fontSize: 14, color: Color(0xff1f1f1f)),
                                  )),
                            ))
                        : Expanded(
                            child: Container(
                            padding: const EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width,
                            height: double.infinity,
                            color: const Color(0xffecedf2),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: _nilaiAwalListModel.isloading
                                        ? Container(
                                            child: const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                          )
                                        : ListView.builder(
                                            itemCount: _nilaiAwalListModel
                                                .nilaiAwal.length,
                                            scrollDirection: Axis.vertical,
                                            primary: false,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context,
                                                    int itemIndex) =>
                                                InkWell(
                                              onTap: () {},
                                              child: Container(
                                                height: 120,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0),
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 50,
                                                      width: 50,
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: Image.asset(
                                                              'assets/icons/user.png')),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          AutoSizeText(
                                                            _nilaiAwalListModel
                                                                .nilaiAwal[
                                                                    itemIndex]
                                                                .nama,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle: const TextStyle(
                                                                  fontSize: 18,
                                                                  color: Color(
                                                                      0xff1f1f1f)),
                                                            ),
                                                            maxLines: 3,
                                                          ),
                                                          const SizedBox(
                                                            height: 4,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    'Nilai: ${_nilaiAwalListModel.nilaiAwal[itemIndex].nilai},\nketerangan: ${_nilaiAwalListModel.nilaiAwal[itemIndex].keterangan}',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Color(0xff2b2b2b)),
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                  ],
                ),
              ),
            ),
          );
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
  void refreshData(NilaiAwalListModels nilaiAwalListModels) {
    setState(() {
      _nilaiAwalListModel = nilaiAwalListModels;
    });
  }
}
