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
  int bmi = 0;
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:const Text("Bmi Calculator"),backgroundColor:Colors.red,),
        body:Center(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              const Text("Bmi Calculator", style:TextStyle(color: Colors.red, fontSize: 32),),
              const SizedBox(height: 8,),
              const Text("We Care About Your Health"),
              const SizedBox(height: 8,),
              Image.network("https://www.bajajfinservmarkets.in/content/dam/bajajfinserv/calculators/bmi/bmi-result-p.png"),
              const SizedBox(height: 12,),
              Text("Height (${_heightsSliderValue.round()} cm)", style: const TextStyle(fontSize: 20),),
              Slider(value: _heightsSliderValue, min: 100,max: 200, onChanged: (double value){
                setState(() {
                  _heightsSliderValue = value;
                });
              }),
              const SizedBox(height: 8,),
              Text("Width (${_widthSliverValue.round()} kg)", style: const TextStyle(fontSize: 20),),
              Slider(value: _widthSliverValue, min: 40,max: 150, onChanged: (double value){
                setState(() {
                  _widthSliverValue = value;
                });
              }),
              const SizedBox(height: 8,),
              bmi != 0 ? Text("Your BMI is $bmi and  $message") : const SizedBox(height: 2,),
              TextButton.icon(onPressed: (){
                var tempBmi = _widthSliverValue/pow((_heightsSliderValue/100),2);
                print("BMI ${tempBmi.round()}");

                //bmi = tempBmi.round();

                var messageTemp = "";
                if (tempBmi <18){
                  messageTemp = "You are Underweight";
                }
                else if (tempBmi < 25){
                  messageTemp = "You are normal";
                }
                else if (tempBmi < 30){
                  messageTemp = "You are overweight";
                }
                else{
                  messageTemp = "You are Obese";
                }

                setState((){
                  bmi = tempBmi.round();
                  message = messageTemp;
                });

              }, icon:const Icon(Icons.favorite) , label:const Text("Calculate") )
            ],
          ),
        )
    );
  }
}