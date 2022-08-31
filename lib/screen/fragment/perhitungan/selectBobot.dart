// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state, avoid_print

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../src/response/bobot_response.dart';

class SelectBobot extends StatefulWidget {
  final BobotResponse bobotResponse;

  const SelectBobot({Key? key, required this.bobotResponse}) : super(key: key);
  @override
  _SelectBobotState createState() => _SelectBobotState(bobotResponse);
}

class _SelectBobotState extends State<SelectBobot> {
  // ignore: unused_field
  late BobotResponse _bobot;
  _SelectBobotState(BobotResponse bobotResponse) {
    _bobot = bobotResponse;
    print(bobotResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Kriteria"),
      ),
      body: ListView.builder(
        itemCount: _bobot.data!.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 20, right: 20),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: const Icon(Ionicons.school),
            title: Text("${_bobot.data![index].nama}"),
            onTap: (() {
              Navigator.pop(context, index);
            }),
          );
        },
      ),
    );
  }
}
