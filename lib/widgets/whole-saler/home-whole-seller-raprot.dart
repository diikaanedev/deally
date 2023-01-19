import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/fournisseur-bloc.dart';
import 'package:deally/models/revenue.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class HomeWholeSalerRapport extends StatelessWidget {
  const HomeWholeSalerRapport({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var applicationBloc = context.watch<ApplicationBloc>();
    var fournisseurBloc = context.watch<FournisseurBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rapports'),
        elevation: .0,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.mail_solid),
            onPressed: () => null,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * .01,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => fournisseurBloc.setDiagramSelect(1),
                child: Container(
                    width: size.width * .25,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                        // border: Border.all(color: noir.withOpacity(.4)),
                        borderRadius: BorderRadius.circular(24),
                        color: fournisseurBloc.diagramSelect == 1
                            ? noir
                            : Colors.transparent),
                    child: Center(
                      child: Text(
                        'Weekly',
                        style: TextStyle(
                            color: fournisseurBloc.diagramSelect == 1
                                ? blanc
                                : noir.withOpacity(.4)),
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () => fournisseurBloc.setDiagramSelect(2),
                child: Container(
                    width: size.width * .25,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                      // border: Border.all(color: noir.withOpacity(.4)),
                      borderRadius: BorderRadius.circular(24),
                      color: fournisseurBloc.diagramSelect == 2
                          ? noir
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        'Monthly',
                        style: TextStyle(
                            color: fournisseurBloc.diagramSelect == 2
                                ? blanc
                                : noir.withOpacity(.4)),
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () => fournisseurBloc.setDiagramSelect(3),
                child: Container(
                    width: size.width * .25,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                      // border: Border.all(color: noir.withOpacity(.4)),
                      borderRadius: BorderRadius.circular(24),
                      color: fournisseurBloc.diagramSelect == 3
                          ? noir
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        'Yearly',
                        style: TextStyle(
                            color: fournisseurBloc.diagramSelect == 3
                                ? blanc
                                : noir.withOpacity(.4)),
                      ),
                    )),
              ),
            ],
          )),
          SizedBox(
            height: size.height * .01,
          ),
          Expanded(
              flex: 7,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: charts.PieChart(
                          fournisseurBloc.diagramSelect == 1
                              ? seriesWeek
                              : fournisseurBloc.diagramSelect == 1
                                  ? seriesMonth
                                  : seriesYear,
                          defaultRenderer: charts.ArcRendererConfig(
                              arcWidth: 60,
                              arcRendererDecorators: [
                                charts.ArcLabelDecorator()
                              ]),
                          behaviors: [
                            charts.DatumLegend(
                              position: charts.BehaviorPosition.bottom,
                              entryTextStyle: const charts.TextStyleSpec(
                                  color: charts.MaterialPalette.black,
                                  fontSize: 11),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: size.height * .02,
          ),
          Expanded(
              flex: 7,
              child: Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .01,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 20,
                                offset: Offset(5, 5),
                                color: blanc)
                          ]),
                          child: charts.BarChart(
                            fournisseurBloc.diagramSelect == 1
                                ? seriesWeekBar()
                                : fournisseurBloc.diagramSelect == 2
                                    ? seriesMonthBar()
                                    : seriesYearBar(),
                            animate: true,
                            defaultRenderer: charts.BarRendererConfig(
                                groupingType: charts.BarGroupingType.grouped,
                                strokeWidthPx: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * .01,
                      ),
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: size.height * .02,
          ),
        ],
      ),
    );
  }
}
