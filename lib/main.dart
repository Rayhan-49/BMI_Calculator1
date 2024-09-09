import 'package:bmi_calculator/firstpage.dart';
import 'package:bmi_calculator/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primarySwatch: Colors.blue,
     ),
     home: Splash(),
   );
  }

}
class MyHomePage extends StatefulWidget{
  var nameFrom;
  MyHomePage(this.nameFrom);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var weight=TextEditingController();
  var height=TextEditingController();
  var result="";
  var colors=Colors.red;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text('BMI CALCULATOR APP'),
        titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 21,),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(

                controller: weight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(

                  prefixIcon: Icon(Icons.line_weight),
                  hintText: "Enter Weight in Kg",
                  hintStyle: TextStyle(fontSize: 11),
                  labelText: "Weight",
                  labelStyle: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1,color: Colors.black,),
                      borderRadius: BorderRadius.circular(21),

                    ),
                   focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )
                  )
                ),

              ),
              SizedBox(height: 11,),
              TextField(

                controller: height,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    hintText: "Enter height in feet",
                    hintStyle: TextStyle(fontSize: 11),
                    label: Text("height"),
                    labelStyle: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1,color: Colors.black,),
                      borderRadius: BorderRadius.circular(21),

                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )
                    )
                ),

              ),
              SizedBox(height: 11,),
              ElevatedButton(
                onPressed: () {
                  var wwt = weight.text.toString();
                  var hht = height.text.toString();
                  if (wwt != "" && hht != "") {
                    var wt = int.parse(wwt);
                    var ht = double.parse(hht);
                    var mht = ((ht) * (0.305));
                    var out = (wt) / (mht * mht);
                    var msg = "";
                    if (out < 18.5) {
                      msg = "You are underweight.";
                      colors = Colors.blue;
                    } else if (out >= 18.5 && out <= 25) {
                      msg = "You are healthy.";
                      colors = Colors.green;
                    } else {
                      msg = "You are overweight.";
                      colors = Colors.red;
                    }
                    setState(() {
                      result = "Hello ${widget.nameFrom} , $msg \nYour BMI is ${out.toStringAsFixed(3)}";
                    });
                  } else {
                    setState(() {
                      result = "Fill up the required information";
                    });
                  }
                },
                child: Text("Result"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  foregroundColor: Colors.white,
                ),
              ),

              SizedBox(height: 11,),
              Text(result,style: TextStyle(color: colors,fontWeight: FontWeight.bold,fontSize: 16),),
            ],
          ),
        ),
      )
    );

  }
}
