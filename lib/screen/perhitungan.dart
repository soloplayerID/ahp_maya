// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

// import 'fragment/loading.dart';

class MulaiPerhitunganScreen extends StatefulWidget {
  const MulaiPerhitunganScreen({Key? key}) : super(key: key);

  @override
  State<MulaiPerhitunganScreen> createState() => _MulaiPerhitunganScreenState();
}

class _MulaiPerhitunganScreenState extends State<MulaiPerhitunganScreen> {
  @override
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
              child:
                  // _santriListModel.santri.isEmpty
                  //     ? Container(
                  //         padding: const EdgeInsets.only(top: 25.0),
                  //         child: Center(
                  //           child: Text('Belum Ada data',
                  //               style: GoogleFonts.poppins(
                  //                 fontStyle: FontStyle.italic,
                  //                 textStyle: const TextStyle(
                  //                     fontSize: 14,
                  //                     color: Color(0xff1f1f1f)),
                  //               )),
                  //         ))
                  //     :
                  Expanded(
                      child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                color: const Color(0xffecedf2),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      InkWell(
                        splashColor: const Color(0xff7474BF),
                        onTap: () {
                          Navigator.pushNamed(context, '/perhitunganKriteria');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 50.0),
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
                              color: Color.fromARGB(255, 39, 199, 124),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                            child: Text(
                              "Perhitungan Kriteria",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: const Color(0xff7474BF),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/perhitunganAlternatif');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 50.0),
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
                              color: Color.fromARGB(255, 39, 199, 124),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                            child: Text(
                              "Perhitungan Alternatif",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      // InkWell(
                      //   splashColor: const Color(0xff7474BF),
                      //   onTap: () {
                      //     Navigator.pushNamed(context, '');
                      //   },
                      //   child: Container(
                      //     margin: const EdgeInsets.only(top: 50.0),
                      //     height: 43,
                      //     width: MediaQuery.of(context).size.width / 1.2,
                      //     decoration: const BoxDecoration(
                      //         boxShadow: [
                      //           BoxShadow(
                      //               color: Colors.black26,
                      //               offset: Offset(0, 28),
                      //               blurRadius: 40,
                      //               spreadRadius: -12)
                      //         ],
                      //         color: Color.fromARGB(255, 39, 199, 124),
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(10))),
                      //     child: const Center(
                      //       child: Text(
                      //         "Hasil Perhitungan Kriteria",
                      //         style: TextStyle(
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      InkWell(
                        splashColor: const Color(0xff7474BF),
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "sedang dikerjakan",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.amber,
                              textColor: Colors.white,
                              fontSize: 15);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 50.0),
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
                              color: Color.fromARGB(255, 39, 199, 124),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                            child: Text(
                              "Hasil",
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
              )),
            ),
          ],
        ),
      ),
    );
  }
}
