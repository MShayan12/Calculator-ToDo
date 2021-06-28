import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:practise/ToDo.dart';

class Home extends StatefulWidget {
 
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var result = "";

  Widget btn(var textt){
  return ElevatedButton(onPressed: (){
    setState(() {
      result = result + textt;

    });
  }, child: Text(textt));
}

  clearr(){
    setState(() {
      result = "";
    });
  }

  output(){
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        
      
      drawer: DrawerHeader(child: DrawerHeader(child: GestureDetector(onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Todo()));
      },child: TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Todo()));}, child: Text("Click For ToDo",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),))),
      ),
      ),
      
      
      
      body:  Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text(result,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            btn("7"),
            btn("8"),
            btn("9"),
            btn("/"),
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            btn("4"),
            btn("5"),
            btn("6"),
            btn("*"),
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            btn("1"),
            btn("2"),
            btn("3"),
            btn("-"),
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            btn("0"),
            ElevatedButton(onPressed: clearr, child: Text("clear")),
            btn("+"),
            ElevatedButton(onPressed: output, child: Text("=")),
          ],),
          
        ],
      )
      
    );
  }
}

