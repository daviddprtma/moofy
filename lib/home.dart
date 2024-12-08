import 'package:flutter/material.dart';
import 'package:moofy/widgets/drawer.dart';
import 'package:moofy/widgets/navbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomNavbar(),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
