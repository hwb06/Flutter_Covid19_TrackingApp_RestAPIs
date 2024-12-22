import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid19_trackingapp/Screens/world_states_db.dart';

class DetailsScreen extends StatefulWidget {
  final String image;
  final String name;
  final int totalCases;
  final int totalDeaths;
  final int totalRecovered;
  final int active;
  final int critical; // Added final
  final int todayRecovered;
  final int test;

  DetailsScreen({
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test, });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detailed List"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * .06),
                          ReuseableRow(
                              title: "Name",
                              value: widget.name.toString()),
                          ReuseableRow(
                              title: "Cases",
                              value: widget.totalCases.toString()),
                          ReuseableRow(
                              title: "Recovered",
                              value: widget.totalRecovered.toString()),
                          ReuseableRow(
                              title: "Deaths",
                              value: widget.totalDeaths.toString()),
                          ReuseableRow(
                              title: "Critical",
                              value: widget.critical.toString()),
                          ReuseableRow(
                              title: "Tests",
                              value: widget.test.toString()),


                        ],
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.image),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
