import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'app_bar.dart';

class ResultPage extends StatelessWidget {
  final String modifiedImageBase64;

  const ResultPage({Key? key, required this.modifiedImageBase64})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isHomePage = false;
    // print('I am in results page');
    Uint8List uint8List = base64Decode(modifiedImageBase64);
    // print(uint8List);
    return Scaffold(
      appBar: AppBarDesign(showBackArrow: !isHomePage),
      body: Center(
        child: Image.memory(uint8List),
      ),
    );
  }
}
