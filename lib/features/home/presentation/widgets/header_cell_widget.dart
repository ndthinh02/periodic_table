//It can be update
import 'package:flutter/material.dart';
// import 'package:peridoic_table/utils/contants.dart';

class HeaderCell extends StatelessWidget {
  final String text;

  //maybe add it later
  const HeaderCell({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

const EdgeInsets cellEdgeInsets = EdgeInsets.symmetric(vertical: 3, horizontal: 5);
const kBodyBackgroundColor = Color(0xFF03001C);
