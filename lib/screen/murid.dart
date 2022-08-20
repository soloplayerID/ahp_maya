// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:ahp_maya/src/model/muridList_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ahp_maya/screen/fragment/loading.dart';

import '../src/presenter/murid_list_presenter.dart';
import '../src/state/murid_list_state.dart';

class MuridListScreen extends StatefulWidget {
  const MuridListScreen({Key? key}) : super(key: key);

  @override
  State<MuridListScreen> createState() => _MuridListScreenState();
}

class _MuridListScreenState extends State<MuridListScreen>
    implements SantriListState {
  late SantriListModels _santriListModel;
  late MuridListPresenter _santriListPresenter;

  _MuridListScreenState() {
    _santriListPresenter = MuridListPresenter();
  }

  @override
  void initState() {
    // Session.getId().then((value) {
    //   setState(() {
    //     _santriListModel.idUser = int.parse(value!);
    //   });
    // });
    _santriListPresenter.view = this;
    super.initState();
    _santriListPresenter.getData();
  }

  @override
  void dispose() {
    super.dispose();
    _santriListModel.santri.clear();
  }

  @override
  Widget build(BuildContext context) {
    return _santriListModel.isloading
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
                              Navigator.pushNamed(context, '/addKriteria');
                            },
                            child: const Icon(LineIcons.plus,
                                color: Colors.white, size: 30),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: _santriListModel.santri.isEmpty
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
                                      child: _santriListModel.isloading
                                          ? Container(
                                              child: const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            )
                                          : ListView.builder(
                                              itemCount: _santriListModel
                                                  .santri.length,
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
                                                              _santriListModel
                                                                  .santri[
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
                                                            // Row(
                                                            //   mainAxisAlignment:
                                                            //       MainAxisAlignment
                                                            //           .start,
                                                            //   children: [
                                                            //     Row(
                                                            //       children: [
                                                            //         Text(
                                                            //           '${_santriListModel
                                                            //                   .santri[itemIndex]
                                                            //                   .nis}',
                                                            //           style: GoogleFonts
                                                            //               .poppins(
                                                            //             textStyle: const TextStyle(
                                                            //                 fontSize:
                                                            //                     14,
                                                            //                 color:
                                                            //                     Color(0xff2b2b2b)),
                                                            //           ),
                                                            //         )
                                                            //       ],
                                                            //     )
                                                            //   ],
                                                            // )
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
                    ),
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
  void refreshData(SantriListModels santriListModel) {
    setState(() {
      _santriListModel = santriListModel;
    });
  }
}
