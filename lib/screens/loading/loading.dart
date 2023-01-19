// ignore: file_names
import 'dart:async';

import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 3),
        () => Navigator.popAndPushNamed(context, "/"));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            color: meuveClair,
            child: Center(
                child: Container(
                    height: constraints.maxHeight * .1,
                    width: constraints.maxWidth * .8,
                    child: Image.asset("assets/images/LOGO-FINAL.png"))));
      },
    );
  }
}
