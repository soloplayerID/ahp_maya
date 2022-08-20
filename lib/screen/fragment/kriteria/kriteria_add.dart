// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:get/get.dart';

import '../../../src/model/add_kriteria.dart';
import '../../../src/presenter/add_kriteria_presenter.dart';
import '../../../src/state/add_kriteria_state.dart';
import '../loading.dart';
import '../utils/roundedinputfield.dart';

class AddKriteriaScreen extends StatefulWidget {
  const AddKriteriaScreen({Key? key}) : super(key: key);

  @override
  State<AddKriteriaScreen> createState() => _AddKriteriaScreenState();
}

class _AddKriteriaScreenState extends State<AddKriteriaScreen>
    implements AddKriteriaState {
  late AddKriteriaModel _addKriteriaModel;
  late AddKriteriaPresenter _addKriteriaPresenter;

  TextInputType namas = TextInputType.text;
  TextInputType ket = TextInputType.text;

  final _formkey = GlobalKey<FormState>();

  _AddKriteriaScreenState() {
    _addKriteriaPresenter = AddKriteriaPresenter();
  }

  @override
  void initState() {
    super.initState();
    _addKriteriaPresenter.view = this;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _addKriteriaModel.isloading
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
                        RoundedInputField(
                          hintText: "Nama",
                          onValidate: namas,
                          onChanged: (nvalue) async {
                            setState(() {
                              _addKriteriaModel.nama = nvalue;
                              refreshData(_addKriteriaModel);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundedInputField(
                          hintText: "keterangan",
                          onValidate: ket,
                          onChanged: (nvalue) async {
                            setState(() {
                              _addKriteriaModel.ket = nvalue;
                              refreshData(_addKriteriaModel);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          splashColor: const Color(0xff7474BF),
                          onTap: () {
                            if (_addKriteriaModel.nama == "" && _addKriteriaModel.ket == "") {
                              Get.snackbar(
                                  'Error', "nama belum di isi");
                            } else {
                              _addKriteriaPresenter.save(_addKriteriaModel.nama, _addKriteriaModel.ket);
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
  void refreshData(AddKriteriaModel editModel) {
    setState(() {
      _addKriteriaModel = editModel;
    });
  }
}
