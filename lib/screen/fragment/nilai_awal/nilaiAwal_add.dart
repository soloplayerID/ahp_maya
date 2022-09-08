// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:get/get.dart';

import '../../../src/model/add_nilaiAwal_model.dart';
import '../../../src/model/muridList_model.dart';
import '../../../src/presenter/add_nilaiAwal_presenter.dart';
import '../../../src/state/add_nilaiAwal_state.dart';
import '../loading.dart';
import '../utils/roundedinputnumberfield.dart';

class AddNilaiAwalScreen extends StatefulWidget {
  const AddNilaiAwalScreen({Key? key}) : super(key: key);

  @override
  State<AddNilaiAwalScreen> createState() => _AddNilaiAwalScreenState();
}

class _AddNilaiAwalScreenState extends State<AddNilaiAwalScreen>
    implements AddNilaiAwalState {
  late AddNilaiAwalModel _addNilaiAwalModel;
  late AddNilaiAwalPresenter _addNilaiAwalPresenter;

  final int _selectedYear = 99;
  TextInputType namas = TextInputType.text;
  TextInputType ket = TextInputType.text;

  final _formkey = GlobalKey<FormState>();

  _AddNilaiAwalScreenState() {
    _addNilaiAwalPresenter = AddNilaiAwalPresenter();
  }

  @override
  void initState() {
    super.initState();
    _addNilaiAwalPresenter.view = this;
    _addNilaiAwalPresenter.getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _addNilaiAwalModel.isloading
          ? const Loading()
          : SafeArea(
              child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              child: Form(
                  key: _formkey,
                  child: Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(top: 50, bottom: 20),
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.topLeft,
                            child: InkWell(
                                onTap: (() =>
                                    {Navigator.of(context).pop(true)}),
                                child: const Icon(
                                  LineIcons.arrowLeft,
                                  color: Color(0xff212121),
                                  size: 30,
                                ))),
                        Text("tambah Kriteria",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 30,
                                  color: Color(0xff212121),
                                  fontWeight: FontWeight.bold),
                            )),
                        // Text("Lengkapi data dirimu di bawah ini, ya",
                        //     style: GoogleFonts.poppins(
                        //       textStyle:
                        //           TextStyle(fontSize: 12, color: Color(0xff383838)),
                        //     )),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          child: DropdownSearch<Santri>(
                            mode: Mode.DIALOG,
                            showSearchBox: true,
                            onFind: (text) async {
                              if (_addNilaiAwalModel.santri.isEmpty) {
                                return [];
                              }
                              return _addNilaiAwalModel.santri;
                            },
                            popupItemBuilder: (context, item, isSelected) =>
                                ListTile(
                              title: Text(item.nama),
                            ),
                            onChanged: (value) {
                              _addNilaiAwalPresenter
                                  .addNisSiswa(value!.nis.toString());
                            },
                            dropdownBuilder: (context, selectedItem) => Text(
                                selectedItem?.nama ?? "Silahkan Pilih Siswa"),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundedInputNumberField(
                          hintText: "Penampilan",
                          onValidate: namas,
                          onChanged: (nvalue) async {
                            setState(() {
                              _addNilaiAwalModel.nama = nvalue;
                              refreshData(_addNilaiAwalModel);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundedInputNumberField(
                          hintText: "sikap",
                          onValidate: ket,
                          onChanged: (nvalue) async {
                            setState(() {
                              _addNilaiAwalModel.sikap = nvalue;
                              refreshData(_addNilaiAwalModel);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundedInputNumberField(
                          hintText: "nilai kehadiran",
                          onValidate: namas,
                          onChanged: (nvalue) async {
                            setState(() {
                              _addNilaiAwalModel.nilaiKehadiran = nvalue;
                              refreshData(_addNilaiAwalModel);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundedInputNumberField(
                          hintText: "Keterampilan",
                          onValidate: namas,
                          onChanged: (nvalue) async {
                            setState(() {
                              _addNilaiAwalModel.keterampilan = nvalue;
                              refreshData(_addNilaiAwalModel);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundedInputNumberField(
                          hintText: "Interaksi dengan guru",
                          onValidate: namas,
                          onChanged: (nvalue) async {
                            setState(() {
                              _addNilaiAwalModel.interaksiGuru = nvalue;
                              refreshData(_addNilaiAwalModel);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          splashColor: const Color(0xff7474BF),
                          onTap: () {
                            if (_addNilaiAwalModel.nama == "") {
                              Get.snackbar('Error', "nama belum di isi");
                            } else {
                              // _addNilaiAwalPresenter.save(_addNilaiAwalModel.nama,
                              //     _addNilaiAwalModel.ket);
                            }
                          },
                          child: Container(
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
                                color: Color(0xff1d63dc),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Center(
                              child: Text(
                                "Tambah",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  )),
            )),
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
    Navigator.of(context).pop(true);
  }

  @override
  void refreshData(AddNilaiAwalModel editModel) {
    setState(() {
      _addNilaiAwalModel = editModel;
    });
  }
}
