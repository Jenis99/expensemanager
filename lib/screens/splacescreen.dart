import 'package:expensemanager/screens/pinscreen.dart';
import 'package:expensemanager/screens/setpinscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splacescreen extends StatefulWidget {
  @override
  State<splacescreen> createState() => _splacescreenState();

}

class _splacescreenState extends State<splacescreen> {

  checkpin(){
    Future.delayed(const Duration(seconds: 3), ()async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("password")){
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>pinscreen())
      );
    }
    else{
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>setpinscreen())
      );
    }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkpin();
  }
  TextEditingController _password= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("img/wallet.png"),
      ),
    );
  }
}
