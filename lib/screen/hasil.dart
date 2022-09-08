// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:ahp_maya/src/model/hasil_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../src/presenter/hasil_presenter.dart';
import '../src/state/hasil_state.dart';

// import 'fragment/loading.dart';

class HasilScreen extends StatefulWidget {
  const HasilScreen({Key? key}) : super(key: key);

  @override
  State<HasilScreen> createState() => _HasilScreenState();
}

class _HasilScreenState extends State<HasilScreen> implements HasilState {
  @override
  late HasilModels _hasilModels;
  late HasilPresenter _hasilPresenter;

  _HasilScreenState() {
    _hasilPresenter = HasilPresenter();
  }

  @override
  void initState() {
    _hasilPresenter.view = this;
    super.initState();
    _hasilPresenter.getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              color: const Color(0XFFA0D995),
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
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
              child: _hasilModels.rank.isEmpty
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
                            const Center(
                              child: Text(
                                "Hasil Ranking Metode",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: _hasilModels.isloading
                                  ? Container(
                                      child: const Center(
                                          child: CircularProgressIndicator()),
                                    )
                                  : ListView.builder(
                                      itemCount: _hasilModels.rank.length,
                                      scrollDirection: Axis.vertical,
                                      primary: false,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (BuildContext context,
                                              int itemIndex) =>
                                          Container(
                                        height: 120,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                                height: 50,
                                                width: 50,
                                                child: Center(
                                                  child: Text(
                                                    _hasilModels.rank[itemIndex]
                                                        .ranking,
                                                    style: const TextStyle(
                                                        fontSize: 24),
                                                  ),
                                                )),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    _hasilModels
                                                        .rank[itemIndex].nama,
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
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
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Nilai: ${_hasilModels.rank[itemIndex].nilai}',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle: const TextStyle(
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xff2b2b2b)),
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
                          ],
                        ),
                      ),
                    )),
            ),
          ],
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
  void refreshData(HasilModels hasilModels) {
    setState(() {
      _hasilModels = hasilModels;
    });
  }
}
