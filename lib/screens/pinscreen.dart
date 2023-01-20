import 'package:expensemanager/screens/Addexpenses.dart';
import 'package:expensemanager/screens/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pinscreen extends StatefulWidget {

  @override
  State<pinscreen> createState() => _pinscreenState();
}

class _pinscreenState extends State<pinscreen> {
  TextEditingController _password= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 250.0,),
                      Text("This is Pinscreen"),
                      SizedBox(height: 30.0,),
                      TextFormField(decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Enter Pin",
                          fillColor: Colors.white70),
                        controller: _password,
                        keyboardType:TextInputType.number,
                        obscureText: true,
                      ),
                      ElevatedButton(
                          onPressed: ()async{
                            var pas =_password.text.toString();
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        if(prefs.containsKey("password")){
                          if(prefs.getString("password").toString()==pas)
                            {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>Addexpenses())
                              );
                            }
                            else
                              {
                                AlertDialog(
                                  title: Text("Error!"),
                                  content: Text("Please enter a correct password"),
                                  actions: [
                                    ElevatedButton(onPressed: () async{
                                      Navigator.of(context).pop();

                                    }, child: Text("Retry")),
                                    ElevatedButton(onPressed: (){
                                      Navigator.of(context).pop();
                                    }, child: Text("Cancle")),
                                  ],
                                );
                              }
                        }
                        else {
                          AlertDialog(
                            title: Text("Error!"),
                            content: Text("Please enter a correct password"),
                            actions: [
                              ElevatedButton(onPressed: () async{
                                Navigator.of(context).pop();

                              }, child: Text("Retry")),
                              ElevatedButton(onPressed: (){
                                Navigator.of(context).pop();
                              }, child: Text("Cancle")),
                            ],
                          );
                        }
                      },
                      child:Text("Submit"),
                )
    ]
    )),
    ),
          )
      )
    );
  }
}
