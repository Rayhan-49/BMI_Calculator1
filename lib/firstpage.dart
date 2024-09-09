import 'package:bmi_calculator/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class firstPage extends StatefulWidget{
  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  var name=TextEditingController();

  var msg="";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text("Login"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body:Center(
        child: Container(
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(

                keyboardType: TextInputType.text,
                controller: name ,
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  prefixIcon: Icon(Icons.people),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: BorderSide(
                      width: 2,

                    )
                  )
                ),

              ),
              SizedBox(height: 11,),
              ElevatedButton(onPressed: (){
                if((name.text.toString())!=""){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage(name.text.toString())
                ));}
                else{
                  setState(() {
                    msg="Enter your name Please";
                  });
                }
              }, child:
              Text("Next",style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              ),
              SizedBox(height: 11,),
              Text(msg,style: TextStyle(fontSize: 15,color: Colors.red),),
            ],
          ),
        ),
      ),
    );
  }
}