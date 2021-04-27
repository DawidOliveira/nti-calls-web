import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nti_calls_web/app/core/core.dart';
import 'package:nti_calls_web/app/modules/home/home_controller.dart';
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      child: DataTable(
                        headingTextStyle: AppTextStyles.headingTable,
                        columns: [
                          DataColumn(
                            label: Text('Descrição do problema'),
                          ),
                          DataColumn(
                            label: Text('Local'),
                          ),
                          DataColumn(
                            label: Text('Usuário'),
                          ),
                          DataColumn(
                            label: Text('Data da solicitação'),
                          ),
                          DataColumn(
                            label: Container(),
                          ),
                        ],
                        rows: widget.controller.filteredTasks
                            .where((e) =>
                                e.status == configStatus[widget.status] &&
                                e.setor == widget.controller.selectedValue)
                            .toList()
                            .map(
                              (e) => DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      e.desc,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      e.place,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      e.username,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      DateFormat("dd/MM/yyyy HH:mm")
                                          .format(e.createdAt),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                  )
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
        backgroundColor: AppColors.TILE_COLOR,
        title: Obx(
          () => Text.rich(
            TextSpan(text: "${configLabel[widget.status]}", children: [
              TextSpan(
                  text:
                      " (${widget.controller.filteredTasks.where((e) => e.status == (configStatus[widget.status])).length})"),
            ]),
          ),
        ),
        collapsedBackgroundColor: AppColors.TILE_COLOR,
      ),
    );
  }
}
