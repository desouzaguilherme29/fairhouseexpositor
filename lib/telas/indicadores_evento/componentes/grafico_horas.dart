import 'package:fairhouseexpositor/models/VisitantesHora.dart';
import 'package:fairhouseexpositor/stores/visitantes_hora_evento.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

VisitantesHoraEvento _visitantesHoraEvento = GetIt.I<VisitantesHoraEvento>();

class GraficoHora extends StatelessWidget {
  List<VisitantesHora> data = _visitantesHoraEvento.visitanteListHora;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(
        text: 'Visitante por Hora',
        textStyle: TextStyle(
          fontFamily: "WorkSansMedium",
        ),
      ),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries<VisitantesHora, String>>[
        LineSeries<VisitantesHora, String>(
          dataSource: _visitantesHoraEvento.visitanteListHora,
          xValueMapper: (VisitantesHora sales, _) => sales.hora_entrada,
          yValueMapper: (VisitantesHora sales, _) => sales.qtde,
          name: 'Hora',
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}
