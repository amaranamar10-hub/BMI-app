import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return MaterialApp(title: 'BMI Calculator', home: BmiCalculator(), debugShowCheckedModeBanner: false);
  }
}
class BmiCalculator extends StatefulWidget {
  @override State createState() => _BmiCalculatorState();
}
class _BmiCalculatorState extends State<BmiCalculator> {
  double height = 170; int weight = 70; String result = "";
  void calculate() { setState(() { double bmi = weight / ((height / 100) * (height / 100)); result = "Your BMI: ${bmi.toStringAsFixed(1)}"; }); }
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("BMI Calculator")),
    body: Padding(padding: EdgeInsets.all(20),
    child: Column(children:[
      Text("Height: ${height.toInt()} cm"), Slider(value: height, min: 120, max: 220, onChanged: (v) {setState(() {height = v;});}),
      Text("Weight: $weight kg"), Slider(value: weight.toDouble(), min: 30, max: 150, onChanged: (v) {setState(() {weight = v.toInt();});}),
      ElevatedButton(onPressed: calculate, child: Text("Calculate")), SizedBox(height: 20),
      Text(result, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
    ])));
  }
}
