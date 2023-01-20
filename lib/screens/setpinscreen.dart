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
      body: Center(
        child: Column(
          children: [
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
            ElevatedButton(onPressed: ()async{
              var password=_password.text.toString();
              var confirm=_confirm.text.toString();
              if(password==confirm){
                SharedPreferences prefs= await SharedPreferences.getInstance();
                prefs.setString("password",password);
              }

            },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
