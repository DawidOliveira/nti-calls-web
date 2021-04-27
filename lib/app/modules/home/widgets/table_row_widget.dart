import 'package:flutter/material.dart';

class TableRowWidget extends StatelessWidget {
  const TableRowWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Widget item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      child: item,
    );
  }
}
