import 'package:flutter/material.dart';
import 'package:mobile_application/views/screens/widget/activityList_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow, // Orange bgColor: rgb(348,169,81)
      body: ActivityListView(),
    );
  }
}
