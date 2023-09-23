

import 'package:flutter/material.dart';


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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var textFieldWeight = TextEditingController();
  var textFieldFeet = TextEditingController();
  var textFieldInch = TextEditingController();
  
  var bgColor = Colors.deepPurple.shade100;
  var result = "";
  var result2 = "";


  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("HOME")),
      ),
      body: Container(
        color: bgColor,
        child:  Center(
          child:  SizedBox(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 TextField(
                  controller: textFieldWeight,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.monitor_weight),
                    label: Text("Mention weight in kilo gram.",style: TextStyle(fontStyle: FontStyle.italic),)
                  ),
                  keyboardType: TextInputType.number,
                  
                ),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: textFieldFeet,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.height),
                          label: Text("feet",style: TextStyle(fontStyle: FontStyle.italic),)
                        ),
                        keyboardType: TextInputType.number,
                      )
                    ),
                    const SizedBox(
                      width: 20,
                      child: Center(
                        child: Text(":",
                          style: TextStyle(fontSize: 25,color: Colors.grey,fontWeight: FontWeight.w600),
                        )
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: textFieldInch,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.height_rounded),
                          label: Text("inch",style: TextStyle(fontStyle: FontStyle.italic),)
                        ),
                        keyboardType: TextInputType.number,
                        
                      )
                    ),
                  ],
                ),

                const SizedBox(height: 12,),
                ElevatedButton(
                  onPressed: () {

                    String weight = textFieldWeight.text;
                    String feet = textFieldFeet.text;
                    String inch = textFieldInch.text;

                    if(weight.isEmpty || feet.isEmpty || inch.isEmpty) {
                      setState(() {
                        // bgColor = Colors.red;
                        result = "All fields need to be filled ";
                      });
                      return;
                    }

                    double wt = double.parse(weight);
                    int ft = int.parse(feet);
                    int inc = int.parse(inch);

                    int heightInInch = (ft*12) + inc;
                    var heightInMeter = heightInInch*(0.0254);

                    var bmi = wt/(heightInMeter * heightInMeter);

                    if(bmi < 18) {
                      bgColor = Colors.amber.shade200;
                      result2 = "You're UNDER WEIGHT.";
                    }
                    else if(bmi > 25) {
                      bgColor = Colors.red.shade200;
                      result2 = "You're OVER WEIGHT.";
                    }
                    else {
                      bgColor = Colors.green.shade200;
                      result2 = "You're FIT.";
                    }

                    setState(() {
                      result = "Your bmi is ${bmi.toStringAsFixed(3)} \n$result2";
                    });
                    
                  }, 
                  child: const Text("Calculate", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),)
                ),
                const SizedBox(height: 30,),

                Center(child: Text(result, style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                
              ],
            ),
          ),
        ),
      ),
    );
  
  }

  

}
