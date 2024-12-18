import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountriesList extends StatefulWidget {
  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Countries List"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 50,
          width: 180,
          decoration: BoxDecoration(
              color: Color(0xff1aa260),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "Countries List",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
