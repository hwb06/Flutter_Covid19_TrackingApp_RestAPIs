import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid19_trackingapp/Screens/countries_lists.dart';
import 'package:flutter_covid19_trackingapp/Services/states_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Model/WorldStatesModel.dart';

class WorldStatesDb extends StatefulWidget {
  @override
  State<WorldStatesDb> createState() => _WorldStatesDbState();
}

class _WorldStatesDbState extends State<WorldStatesDb> with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

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
    StatesServices statesServices = StatesServices();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Covid-19 Tracker',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FutureBuilder(
                    future: statesServices.fetchWorldStatesRecords(),
                    builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: SpinKitFadingCircle(
                            color: Colors.grey,
                            size: 50.0,
                            controller: _animationController,
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            // Top Stats Card
                            Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _buildTopStat('Infected', snapshot.data!.active.toString()),
                                  _buildDivider(),
                                  _buildTopStat('Recovered', snapshot.data!.recovered.toString()),
                                  _buildDivider(),
                                  _buildTopStat('Deaths', snapshot.data!.deaths.toString()),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
        
                            // World Reports Title
                            Text(
                              'World Reports',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 20),
        
                            // Stats Card
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  _buildStatRow('Total Cases', snapshot.data!.cases.toString()),
                                  _buildStatRow('Deaths', snapshot.data!.deaths.toString()),
                                  _buildStatRow('Recovered', snapshot.data!.recovered.toString()),
                                  _buildStatRow('Active', snapshot.data!.active.toString()),
                                  _buildStatRow('Critical', snapshot.data!.critical.toString()),
                                  _buildStatRow('Today Deaths', snapshot.data!.todayDeaths.toString()),
                                  _buildStatRow('Today Recovered', snapshot.data!.todayRecovered.toString()),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
        
                            // Track Countries Button
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CountriesList()),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    "Track Countries",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopStat(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey[300],
    );
  }

  Widget _buildStatRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}