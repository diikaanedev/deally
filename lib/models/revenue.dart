import 'package:charts_flutter/flutter.dart' as charts;
import 'package:deally/utils/colors-by-dii.dart';

class RevenueSeries {
  final String jour;
  final double subscribers;
  final charts.Color barColor;

  RevenueSeries(
      {required this.jour, required this.subscribers, required this.barColor});
}

List<RevenueSeries> dataWeek = [
  RevenueSeries(
    jour: "orders",
    subscribers: 1000,
    barColor: charts.ColorUtil.fromDartColor(meuveFonce),
  ),
  RevenueSeries(
    jour: "In progress",
    subscribers: 250,
    barColor: charts.ColorUtil.fromDartColor(jauneVoiture),
  ),
  RevenueSeries(
    jour: "Completed",
    subscribers: 600,
    barColor: charts.ColorUtil.fromDartColor(vertFonce),
  ),
  RevenueSeries(
    jour: "Canceled",
    subscribers: 150,
    barColor: charts.ColorUtil.fromDartColor(rouge),
  ),
];

List<RevenueSeries> dataMonth = [
  RevenueSeries(
    jour: "New orders",
    subscribers: 1000000,
    barColor: charts.ColorUtil.fromDartColor(meuveFonce),
  ),
  RevenueSeries(
    jour: "In progress",
    subscribers: 250000,
    barColor: charts.ColorUtil.fromDartColor(jauneVoiture),
  ),
  RevenueSeries(
    jour: "Completed",
    subscribers: 600000,
    barColor: charts.ColorUtil.fromDartColor(vertFonce),
  ),
  RevenueSeries(
    jour: "Canceled",
    subscribers: 150000,
    barColor: charts.ColorUtil.fromDartColor(rouge),
  ),
];

List<RevenueSeries> dataYear = [
  RevenueSeries(
    jour: "New orders",
    subscribers: 10000000,
    barColor: charts.ColorUtil.fromDartColor(meuveFonce),
  ),
  RevenueSeries(
    jour: "In progress",
    subscribers: 250000,
    barColor: charts.ColorUtil.fromDartColor(jauneVoiture),
  ),
  RevenueSeries(
    jour: "Completed",
    subscribers: 600000,
    barColor: charts.ColorUtil.fromDartColor(vertFonce),
  ),
  RevenueSeries(
    jour: "Canceled",
    subscribers: 150000,
    barColor: charts.ColorUtil.fromDartColor(rouge),
  ),
];

List<charts.Series<RevenueSeries, String>> seriesWeek = [
  charts.Series(
      id: "Subscribers",
      data: dataWeek,
      domainFn: (RevenueSeries series, _) => series.jour,
      measureFn: (RevenueSeries series, _) => series.subscribers,
      labelAccessorFn: (RevenueSeries row, _) => '${row.subscribers}',
      colorFn: (RevenueSeries series, _) => series.barColor)
];

List<charts.Series<RevenueSeries, String>> seriesMonth = [
  charts.Series(
      id: "Subscribers",
      data: dataMonth,
      domainFn: (RevenueSeries series, _) => series.jour,
      measureFn: (RevenueSeries series, _) => series.subscribers,
      labelAccessorFn: (RevenueSeries row, _) => '${row.subscribers}',
      colorFn: (RevenueSeries series, _) => series.barColor)
];
List<charts.Series<RevenueSeries, String>> seriesYear = [
  charts.Series(
      id: "Subscribers",
      data: dataYear,
      domainFn: (RevenueSeries series, _) => series.jour,
      measureFn: (RevenueSeries series, _) => series.subscribers,
      labelAccessorFn: (RevenueSeries row, _) => '${row.subscribers}',
      colorFn: (RevenueSeries series, _) => series.barColor)
];

/// Create series list with multiple series
List<charts.Series<OrdinalSales, String>> seriesWeekBar() {
  final newOrders = [
    OrdinalSales('mon', 200, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('tue', 100, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('wed', 300, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('thu', 50, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('fri', 100, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('sat', 175, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('sun', 75, charts.ColorUtil.fromDartColor(meuveFonce)),
  ];

  final inProgress = [
    OrdinalSales('mon', 50, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('tue', 25, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('wed', 30, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('thu', 25, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('fri', 100, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('sat', 10, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('sun', 10, charts.ColorUtil.fromDartColor(jaune)),
  ];

  final completed = [
    OrdinalSales('mon', 200, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('tue', 25, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('wed', 150, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('thu', 75, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('fri', 50, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('sat', 25, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('sun', 75, charts.ColorUtil.fromDartColor(vertFonce)),
  ];

  final canceled = [
    OrdinalSales('mon', 5, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('tue', 25, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('wed', 50, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('thu', 20, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('fri', 10, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('sat', 15, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('sun', 25, charts.ColorUtil.fromDartColor(rouge)),
  ];

  return [
    // Blue bars with a lighter center color.
    charts.Series<OrdinalSales, String>(
      id: 'new orders',
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: newOrders,
      colorFn: (OrdinalSales sale, __) => sale.barColor,
      fillColorFn: (OrdinalSales sale, __) => sale.barColor,
    ),
    // Solid red bars. Fill color will default to the series color if no
    // fillColorFn is configured.
    charts.Series<OrdinalSales, String>(
      id: 'In progress',
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: inProgress,
      colorFn: (OrdinalSales sale, __) => sale.barColor,
      domainFn: (OrdinalSales sales, _) => sales.year,
      fillColorFn: (OrdinalSales sale, __) => sale.barColor,
    ),
    // Hollow green bars.
    charts.Series<OrdinalSales, String>(
      id: 'completed',
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: completed,
      colorFn: (OrdinalSales sale, __) => sale.barColor,
      fillColorFn: (OrdinalSales sale, __) => sale.barColor,
    ),

    charts.Series<OrdinalSales, String>(
      id: 'canceled',
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: canceled,
      colorFn: (OrdinalSales sale, __) => sale.barColor,
      fillColorFn: (OrdinalSales sale, __) => sale.barColor,
    ),
  ];
}

List<charts.Series<OrdinalSales, String>> seriesMonthBar() {
  final newOrders = [
    OrdinalSales('week 1', 200000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('week 2', 100000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('week 3', 300000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('week 4', 50000, charts.ColorUtil.fromDartColor(meuveFonce)),
  ];

  final inProgress = [
    OrdinalSales('week 1', 50000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('week 2', 25000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('week 3', 30000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('week 4', 25000, charts.ColorUtil.fromDartColor(jaune)),
  ];

  final completed = [
    OrdinalSales('week 1', 200000, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('week 2', 25000, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('week 3', 150000, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('week 4', 75000, charts.ColorUtil.fromDartColor(vertFonce)),
  ];

  final canceled = [
    OrdinalSales('week 1', 5000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('week 2', 25000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('week 3', 50000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('week 4', 20000, charts.ColorUtil.fromDartColor(rouge)),
  ];

  return [
    // Blue bars with a lighter center color.
    charts.Series<OrdinalSales, String>(
      id: 'new orders',
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: newOrders,
      colorFn: (OrdinalSales sale, __) => sale.barColor,
      fillColorFn: (OrdinalSales sale, __) => sale.barColor,
    ),
    // Solid red bars. Fill color will default to the series color if no
    // fillColorFn is configured.
    charts.Series<OrdinalSales, String>(
      id: 'In progress',
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: inProgress,
      colorFn: (OrdinalSales sale, __) => sale.barColor,
      domainFn: (OrdinalSales sales, _) => sales.year,
      fillColorFn: (OrdinalSales sale, __) => sale.barColor,
    ),
    // Hollow green bars.
    charts.Series<OrdinalSales, String>(
      id: 'completed',
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: completed,
      colorFn: (OrdinalSales sale, __) => sale.barColor,
      fillColorFn: (OrdinalSales sale, __) => sale.barColor,
    ),

    charts.Series<OrdinalSales, String>(
      id: 'canceled',
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: canceled,
      colorFn: (OrdinalSales sale, __) => sale.barColor,
      fillColorFn: (OrdinalSales sale, __) => sale.barColor,
    ),
  ];
}

List<charts.Series<OrdinalSales, String>> seriesYearBar() {
  final newOrders = [
    OrdinalSales('jan', 200000000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('feb', 100000000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('mar', 300000000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('apr', 50000000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('may', 100000000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('jun', 175000000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('jul', 300000000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('aug', 175000000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('sep', 75000000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('oct', 50000000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('nov', 100000000, charts.ColorUtil.fromDartColor(meuveFonce)),
    OrdinalSales('dec', 75000000, charts.ColorUtil.fromDartColor(meuveFonce)),
  ];

  final inProgress = [
    OrdinalSales('jan', 50000000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('feb', 25000000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('mar', 30000000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('apr', 25000000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('jun', 100000000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('jul', 10000000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('aug', 10000000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('sep', 50000000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('oct', 25000000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('nov', 30000000, charts.ColorUtil.fromDartColor(jaune)),
    OrdinalSales('dec', 25000000, charts.ColorUtil.fromDartColor(jaune)),
  ];

  final completed = [
    OrdinalSales('jan', 200000000, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('feb', 25000000, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('mar', 150000000, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('apr', 75000000, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('jun', 50000000, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('jul', 25000000, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('aug', 75000000, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('sep', 200000000, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('oct', 20000005, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('nov', 150000000, charts.ColorUtil.fromDartColor(vertFonce)),
    OrdinalSales('dec', 75000000, charts.ColorUtil.fromDartColor(vertFonce)),
  ];

  final canceled = [
    OrdinalSales('jan', 50000000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('feb', 25000000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('mar', 50000000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('apr', 20000000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('may', 10000000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('jun', 15000000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('jul', 25000000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('aug', 5000000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('sep', 25000000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('oct', 50000000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('nov', 20000000, charts.ColorUtil.fromDartColor(rouge)),
    OrdinalSales('dec', 15000000, charts.ColorUtil.fromDartColor(rouge)),
  ];

  return [
    // Blue bars with a lighter center color.
    charts.Series<OrdinalSales, String>(
      id: 'new orders',
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: newOrders,
      colorFn: (OrdinalSales sale, __) => sale.barColor,
      fillColorFn: (OrdinalSales sale, __) => sale.barColor,
    ),
    // Solid red bars. Fill color will default to the series color if no
    // fillColorFn is configured.
    charts.Series<OrdinalSales, String>(
      id: 'In progress',
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: inProgress,
      colorFn: (OrdinalSales sale, __) => sale.barColor,
      domainFn: (OrdinalSales sales, _) => sales.year,
      fillColorFn: (OrdinalSales sale, __) => sale.barColor,
    ),
    // Hollow green bars.
    charts.Series<OrdinalSales, String>(
      id: 'completed',
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: completed,
      colorFn: (OrdinalSales sale, __) => sale.barColor,
      fillColorFn: (OrdinalSales sale, __) => sale.barColor,
    ),

    charts.Series<OrdinalSales, String>(
      id: 'canceled',
      domainFn: (OrdinalSales sales, _) => sales.year,
      measureFn: (OrdinalSales sales, _) => sales.sales,
      data: canceled,
      colorFn: (OrdinalSales sale, __) => sale.barColor,
      fillColorFn: (OrdinalSales sale, __) => sale.barColor,
    ),
  ];
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;
  final charts.Color barColor;

  OrdinalSales(this.year, this.sales, this.barColor);
}
