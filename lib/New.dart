import 'package:flutter/material.dart';
import 'package:practise/ToDo.dart';
import 'package:practise/home.dart';



class New extends StatefulWidget {
  

  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(title: Text("Calculator App"),
      bottom: TabBar(
        labelColor: Colors.red,
        indicatorColor: Colors.red,
        unselectedLabelColor: Colors.grey,
        tabs: [
        
        Tab(child: Text("Calculator"),),
        Tab(child: Text("Todo")),
      ]),
      ),
      body: TabBarView(children: [
        Home(),
        Todo(),
      ]),
    ),
    );
  }
}