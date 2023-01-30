import 'package:expensemanager/screens/Addexpenses.dart';
import 'package:expensemanager/screens/pinscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class setpinscreen extends StatefulWidget {
  @override
  State<setpinscreen> createState() => _setpinscreenState();
}

class _setpinscreenState extends State<setpinscreen> {
  TextEditingController _password=TextEditingController();
  TextEditingController _confirm=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 10.0,right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0,),
              Text("Set pin",style: TextStyle(
                fontSize: 20.0
              ),),
              SizedBox(height: 5.0,),
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
              SizedBox(height: 20.0,),
              Text("Confirm pin",style: TextStyle(
                  fontSize: 20.0
              ),),
              SizedBox(height: 5.0,),

              TextFormField(decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Enter Pin",
                  fillColor: Colors.white70),
                controller: _confirm,
                keyboardType:TextInputType.number,
                obscureText: true,
              ),
              SizedBox(height: 20.0,),
              Center(
                child: ElevatedButton(onPressed: ()async{
                  var password=_password.text.toString();
                  var confirm=_confirm.text.toString();
                  if(password==confirm){
                    SharedPreferences prefs= await SharedPreferences.getInstance();
                    prefs.setString("password",password);
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>pinscreen())
                    );
                  }
                  else{
                    print("Enter Same Pin");
                  }
                },
                    child: Text("Submit")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
