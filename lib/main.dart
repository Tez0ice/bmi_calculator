import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _widthSliverValue = 100;
  double _heightsSliderValue = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text("Bmi Calculator"),backgroundColor:Colors.red,),
        body:Center(
          child: Column(
            children: [
              Text("Bmi Calculator", style:TextStyle(color: Colors.red, fontSize: 32),),
              SizedBox(height: 8,),
              Text("We Care About Your Health"),
              SizedBox(height: 8,),
              Image.network("https://www.bajajfinservmarkets.in/content/dam/bajajfinserv/calculators/bmi/bmi-result-p.png"),
              SizedBox(height: 8,),
              Text("Height (${_heightsSliderValue.round()} cm)", style: TextStyle(fontSize: 20),),
              Slider(value: _heightsSliderValue, min: 0,max: 100, onChanged: (double value){
                setState(() {
                  _heightsSliderValue = value;
                });
              }),
              SizedBox(height: 8,),
              Text("Width (${_widthSliverValue.round()} kg)", style: TextStyle(fontSize: 20),),
              Slider(value: _widthSliverValue, min: 0,max: 100, onChanged: (double value){
                setState(() {
                  _widthSliverValue = value;
                });
              }),
              SizedBox(height: 8,),
              TextButton.icon(onPressed:(){
                var tempBmi = _widthSliverValue/pow((_heightsSliderValue/100),2);
              }, icon:Icon(Icons.favorite) , label:Text("Calculate") )
            ],
          ),
        )
    );
  }
}

