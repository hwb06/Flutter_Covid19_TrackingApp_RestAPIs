

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldStatesDb extends StatefulWidget{

  @override
  State<WorldStatesDb> createState() => _WorldStatesDbState();
}

class _WorldStatesDbState extends State<WorldStatesDb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("World State Dashboard")),
    );
  }
}