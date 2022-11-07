import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final dataMap = <String, double>{
    "8:30": 5,
    "10:15": 2,
    "12:45": 1,
  };

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.yellowAccent,
  ];

  String selectedValue = "Medieningenieur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auswertung"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Wann muss ich da sein?",
            style: TextStyle(fontSize: 24),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: PieChart(
              dataMap: dataMap,
              chartType: ChartType.ring,
              baseChartColor: Colors.grey[300]!,
              colorList: colorList,
            ),
          ),
        ],
      ),
    );
  }
}
