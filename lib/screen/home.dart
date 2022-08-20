// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:ahp_maya/screen/fragment/utils/category_card_home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "user";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2EBE9),
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      //name
                      Text(
                        'hello,',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'user',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ],
                  ),

                  //Profile Picture
                  InkWell(
                    onTap: () async {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: const Color(0XFF4CACBC),
                          borderRadius: BorderRadius.circular(12)),
                      child: const InkWell(
                          child: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                height: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                  color: Color(0xffecedf2),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //card -> hhow do you feel?
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: const Color(0XFFFAC213),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              //animation or picture
                              Container(
                                padding: const EdgeInsets.all(12),
                                height: 100,
                                width: 100,
                                child:
                                    Lottie.asset('assets/icons/mengajar.json'),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              // how do you feel + get started button
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Selamat datang',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                      'aplikasi pengambilan keputusan siswa terbaik',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: const Color(0XFF4CACBC),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          'Mulai Perhitungan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffF9F9F9),
                                              fontSize: 14),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      //search bar
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      //   child: Container(
                      //     padding: const EdgeInsets.all(8),
                      //     decoration: BoxDecoration(
                      //       color: const Color.fromARGB(255, 203, 204, 235),
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //     child: const TextField(
                      //       decoration: InputDecoration(
                      //         prefixIcon: Icon(Icons.search),
                      //         border: InputBorder.none,
                      //         hintText: 'How can we help you?',
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            child: Column(
                              children: const [
                                CategoryCard(
                                    iconImagePath: 'assets/icons/user.png',
                                    categoryName: 'Daftar Murid',
                                    router: '/murid'),
                              ],
                            ),
                          )),

                      const SizedBox(
                        height: 25,
                      ),

                      // horizontal listview -> Category: Store, Finance etc..
                      Container(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CategoryCard(
                                iconImagePath: 'assets/icons/finance.png',
                                categoryName: 'Master Murid\n(alternatif)',
                                router: '/addMurid'),
                            CategoryCard(
                                iconImagePath: 'assets/icons/finance_2.png',
                                categoryName: 'Master\nKriteria',
                                router: '/kriteria'),
                            CategoryCard(
                                iconImagePath: 'assets/icons/tomb.png',
                                categoryName: 'Master nilai\nAwal',
                                router: '/nilaiAwal'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),

                      //doctor list
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Berita\n terbaru',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Lihat semua',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
