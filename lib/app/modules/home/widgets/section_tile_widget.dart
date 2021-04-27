import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nti_calls_web/app/core/core.dart';
import 'package:nti_calls_web/app/modules/home/home_controller.dart';
import 'package:nti_calls_web/app/modules/home/widgets/table_info_widget.dart';
import 'package:nti_calls_web/app/modules/home/widgets/table_row_widget.dart';
import 'package:nti_calls_web/app/shared/models/task.dart';

class SectionTileWidget extends StatefulWidget {
  SectionTileWidget({
    Key? key,
    required this.size,
    required this.controller,
    required this.status,
    this.initiallyExpanded = false,
  })  : assert(['pending', 'in_progress', 'done'].contains(status)),
        super(key: key);

  final Size size;
  final HomeController controller;
  final String status;
  final bool initiallyExpanded;

  @override
  _SectionTileWidgetState createState() => _SectionTileWidgetState();
}

class _SectionTileWidgetState extends State<SectionTileWidget> {
  final configLabel = <String, String>{
    "pending": "Pendente",
    "in_progress": "Em andamento",
    "done": "Concluídos",
  };

  final configStatus = <String, TaskStatus>{
    'pending': TaskStatus.pending,
    'in_progress': TaskStatus.in_progress,
    'done': TaskStatus.done,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        border: Border.fromBorderSide(BorderSide.none),
      ),
      child: ExpansionTile(
        maintainState: true,
        initiallyExpanded: widget.initiallyExpanded,
        children: [
          Obx(
            () => Column(
              children: [
                TableInfoWidget(size: MediaQuery.of(context).size),
                Table(
                  columnWidths: {
                    0: FixedColumnWidth(widget.size.width * .5),
                  },
                  border: TableBorder(
                    verticalInside: BorderSide(color: AppColors.GREY),
                    horizontalInside: BorderSide(color: AppColors.GREY),
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: widget.controller.filteredTasks
                      .where((e) =>
                          e.status == configStatus[widget.status] &&
                          e.setor == widget.controller.selectedValue)
                      .toList()
                      .map(
                        (e) => TableRow(
                          children: [
                            TableRowWidget(
                              item: Text(
                                e.desc,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TableRowWidget(
                              item: Text(
                                e.place,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TableRowWidget(
                              item: Text(
                                e.username,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TableRowWidget(
                              item: Text(
                                DateFormat("dd/MM/yyyy").format(e.createdAt),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TableRowWidget(
                              item: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward),
                                    tooltip: "Próximo passo",
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete,
                                        color: AppColors.RED),
                                    tooltip: 'Deletar chamado',
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: AppColors.TILE_COLOR,
        title: Text.rich(
          TextSpan(text: "${configLabel[widget.status]}", children: [
            TextSpan(
                text:
                    " (${widget.controller.filteredTasks.where((e) => e.status == (configStatus[widget.status])).length})"),
          ]),
        ),
        collapsedBackgroundColor: AppColors.TILE_COLOR,
      ),
    );
  }
}
