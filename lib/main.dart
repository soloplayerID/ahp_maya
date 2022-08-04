// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ahp_maya/parent/provider.dart';
import 'package:ahp_maya/routes/routes.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var appState = AppState(0);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      data: appState,
      child: MaterialApp(
        title: 'Aplikasi AHP Maya',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SFProDisplay',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: routes,
      ),
    );
  }
}

class AppState extends ValueNotifier {
  AppState(value) : super(value);
}
