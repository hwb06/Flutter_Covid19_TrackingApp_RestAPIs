import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesDb extends StatefulWidget {
  @override
  State<WorldStatesDb> createState() => _WorldStatesDbState();
}

class _WorldStatesDbState extends State<WorldStatesDb>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 5), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  final colorList = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            PieChart(
              dataMap: {
                "Total": 20,
                "Recovered": 15,
                "Deaths": 5,
              },
              chartRadius: MediaQuery.of(context).size.width / 3.2,
              legendOptions: LegendOptions(
                legendPosition: LegendPosition.left
              ),
              animationDuration: Duration(milliseconds: 1200),
              chartType: ChartType.ring,
              colorList: colorList,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .04),
              child: Card(
                color: Colors.black,
                child: Column(
                  children: [
                    ReuseableRow(
                        title: "Total",
                        value: "200"),
                    ReuseableRow(
                        title: "Total",
                        value: "200"),
                    ReuseableRow(
                        title: "Total",
                        value: "200"),
                    ReuseableRow(
                        title: "Total",
                        value: "200"),
                    ReuseableRow(
                        title: "Total",
                        value: "200"),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff1aa260),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text("Track Countries"),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class ReuseableRow extends StatelessWidget{
  String title, value;
  ReuseableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: TextStyle(color: Colors.white),),
              Text(value, style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
        SizedBox(height: 5,),
        Divider(),
      ],
    );
  }
}
