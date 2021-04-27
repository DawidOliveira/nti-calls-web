import 'package:flutter/material.dart';
import 'package:nti_calls_web/app/core/core.dart';

class TableInfoWidget extends StatelessWidget {
  const TableInfoWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: FixedColumnWidth(size.width * .5),
      },
      border: TableBorder(
        verticalInside: BorderSide(width: 1),
        horizontalInside: BorderSide(),
        bottom: BorderSide(),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: AppColors.TILE_COLOR,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Descrição do problema",
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "Local",
              textAlign: TextAlign.center,
            ),
            Text(
              "Usuário",
              textAlign: TextAlign.center,
            ),
            Text(
              "Data da solicitação",
              textAlign: TextAlign.center,
            ),
            Container(),
          ],
        )
      ],
    );
  }
}
