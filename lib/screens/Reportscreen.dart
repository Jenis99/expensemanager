import 'package:expensemanager/screens/Expence.dart';
import 'package:expensemanager/screens/Income.dart';
import 'package:flutter/material.dart';

import '../helper/Databasehelper.dart';

class Reportscreen extends StatefulWidget {
  @override
  State<Reportscreen> createState() => _ReportscreenState();
}

class _ReportscreenState extends State<Reportscreen> {

  var expence=0;
  var income=0;
  var balance=0;
 get_expense(type)async{
    Databasehelper obj=Databasehelper();
    if(type=="Income")
      {
        var data = await obj.get_data(type);
        data.forEach((row) {
          setState(() {
            income = income + int.parse(row["amount"].toString());
          });
        });
      }
    else
      {
        var data = await obj.get_data(type);
        data.forEach((row) {
          setState(() {
            expence = expence + int.parse(row["amount"].toString());
          });
        });
      }
    setState(() {
      balance = income-expence;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_expense("Expenses");
    get_expense("Income");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fiance Report"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            Container(
              width:300.0,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color:(balance<0)?Colors.red:Colors.green,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
               children: [
                 Container(
                   child: Column(
                     children: [
                       Text("Balance",style: TextStyle(
                         fontSize: 30.0
                       ),),
                       SizedBox(height: 20.0,),
                       Text("Rs. "+balance.toString(),style: TextStyle(
                           fontSize: 30.0
                       ),),

                     ],
                   ),
                 ),
               ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
          padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                   children: [
                     GestureDetector(
                       child: Container(
                         child: Column(
                           children: [
                             Text("Rs. "+expence.toString(),style: TextStyle(
                               fontSize: 30.0,
                               color: Colors.red
                             ),),
                             SizedBox(height: 20.0,),
                             Text("Expense",style: TextStyle(
                                 fontSize: 20.0
                             ),),
                           ],
                         ),
                       ),
                       onTap: (){
                         Navigator.of(context).push(
                             MaterialPageRoute(builder: (context)=>Expence(type:"Expenses"))
                         );
                       },
                     ),
                   ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                   children: [
                     GestureDetector(
                       child: Container(
                         child: Column(
                           children: [
                             Text("Rs. "+income.toString(),style: TextStyle(
                                 fontSize: 30.0,
                                 color: Colors.green
                             ),),
                             SizedBox(height: 20.0,),
                             Text("Income",style: TextStyle(
                                 fontSize: 20.0
                             ),),
                           ],
                         ),
                       ),
                       onTap: (){
                         Navigator.of(context).push(
                           MaterialPageRoute(builder: (context)=>Expence(type:"Income"))
                         );
                       },
                     ),
                   ],
                  ),
                ),
              ],
            ),
          ],
        ),
        )
          ],
        ),
      ),
    );
  }
}
