// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:get/get.dart';

import '../../../src/model/add_murid_model.dart';
import '../../../src/presenter/add_murid_presenter.dart';
import '../../../src/state/add_murid_state.dart';
import '../loading.dart';
import '../utils/roundeddropdown.dart';
import '../utils/roundedinputfield.dart';
import '../utils/roundedinputnumberfield.dart';

class EditeProfileScreen extends StatefulWidget {
  const EditeProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditeProfileScreen> createState() => _EditeProfileScreenState();
}

class _EditeProfileScreenState extends State<EditeProfileScreen>
    implements AddMuridState {
  late AddMuridModel _editModel;
  late AddMuridPresenter _editPresenter;

  int _selectedGender = 99;
  TextInputType namas = TextInputType.text;
  TextInputType nis = TextInputType.text;
  TextInputType alamat = TextInputType.text;

  final _formkey = GlobalKey<FormState>();

  _EditeProfileScreenState() {
    _editPresenter = AddMuridPresenter();
  }

  @override
  void initState() {
    super.initState();
    _editPresenter.view = this;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _editModel.isloading
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
                        Text("tambah siswa",
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
                        RoundedInputField(
                          hintText: "Nama",
                          onValidate: namas,
                          onChanged: (nvalue) async {
                            setState(() {
                              _editModel.nama = nvalue;
                              refreshData(_editModel);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundedInputField(
                          hintText: "Alamat",
                          onValidate: alamat,
                          onChanged: (nvalue) async {
                            setState(() {
                              _editModel.alamat = nvalue;
                              refreshData(_editModel);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundedInputNumberField(
                          hintText: "NIS",
                          onValidate: nis,
                          onChanged: (nvalue) async {
                            setState(() {
                              _editModel.nis = nvalue;
                              refreshData(_editModel);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundedDropdown(
                          value: _selectedGender,
                          icon: Icons.gesture_rounded,
                          hintText: "Jenis Kelamin",
                          items: [
                            const DropdownMenuItem(
                              value: 99,
                              child: Text("pilih"),
                            ),
                            const DropdownMenuItem(
                              value: 1,
                              child: Text("Pria"),
                            ),
                            const DropdownMenuItem(
                              value: 0,
                              child: Text("Wanita"),
                            ),
                          ],
                          onChanged: (gvalue) {
                            switch (gvalue) {
                              case 99:
                                setState(() {
                                  _selectedGender = 99;
                                  _editModel.jk = '99';
                                });
                                break;
                              case 1:
                                setState(() {
                                  _editModel.jk = 'L';
                                  _selectedGender = 1;
                                });
                                break;
                              case 0:
                                setState(() {
                                  _editModel.jk = 'P';
                                  _selectedGender = 0;
                                });
                                break;
                              default:
                                setState(() {
                                  _editModel.jk = 'L';
                                  _selectedGender = 1;
                                });
                                break;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          splashColor: const Color(0xff7474BF),
                          onTap: () {
                            if (_editModel.nama == "" &&
                                _editModel.jk == '99' &&
                                _editModel.alamat == "" &&
                                _editModel.nis == "") {
                              Get.snackbar('Error', "nama belum di isi");
                            } else {
                              _editPresenter.save(
                                  _editModel.nama,
                                  _editModel.nis,
                                  _editModel.alamat,
                                  _editModel.jk);
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
                                "Ubah",
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
        backgroundColor: Colors.red,
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
  void refreshData(AddMuridModel editModel) {
    setState(() {
      _editModel = editModel;
    });
  }
}
