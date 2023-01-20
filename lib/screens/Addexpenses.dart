import 'package:expensemanager/helper/Databasehelper.dart';
import 'package:flutter/material.dart';

class Addexpenses extends StatefulWidget {
  @override
  State<Addexpenses> createState() => _AddexpensesState();
}

class _AddexpensesState extends State<Addexpenses> {
  TextEditingController _title=TextEditingController();
  TextEditingController _description=TextEditingController();
  TextEditingController _amount=TextEditingController();
  var _value="Expenses";
  var _selected ="Bike";

  Future<List> ? allexpenses;
  Future<List> get_expense()async{
    Databasehelper obj=Databasehelper();
    var data = await obj.get_data();
    return data;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      allexpenses=get_expense();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: SingleChildScrollView(
          child: (
              Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0,),
                            Text("Types",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            Row(
                              children: [
                                Radio(
                                  value: "Expenses", groupValue: _value, onChanged: (value){
                                  setState(() {
                                    _value=value!;
                                  });
                                },),
                                Text("Expenses") ,
                                Radio(
                                  value: "Income", groupValue: _value, onChanged: (value){
                                  setState(() {
                                    _value=value!;
                                  });
                                },),
                                Text("Income"),
                              ],
                            ),
                            Text("Title",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            TextField(
                              decoration: InputDecoration (
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _title,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 10.0,),
                            Text("Description",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            TextField(
                              decoration: InputDecoration (
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _description,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 10.0,),
                            Text("Amount",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            TextField(
                              decoration: InputDecoration (
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _amount,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 10.0,),
                            Text("Categories",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 3.0,),
                            Container(child: DropdownButton(
                              value: _selected,
                              onChanged: (val) {
                                setState(() {
                                  _selected = val!;
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  child: Text("Household",style: TextStyle(
                                    fontSize: 13.0,
                                  ),),
                                  value: "Household",),
                                DropdownMenuItem(
                                  child: Text("Personal"),
                                  value: "Personal",),
                                DropdownMenuItem(
                                  child: Text("Bike"),
                                  value: "Bike",),
                                DropdownMenuItem(
                                  child: Text("Other"),
                                  value: "Other",),
                              ],
                            ),
                            ),
                            Center(
                              child:  ElevatedButton(onPressed: () async{
                                var title=_title.text.toString();
                                var type=_value.toString();
                                var description=_description.text.toString();
                                var amount=_amount.text.toString();
                                var category=_selected.toString();
                                Databasehelper obj = Databasehelper();
                                var id = await obj.insertdata(title,type,description,category,amount);
                                print("this is id :"+ id.toString());

                                //Database
                              }, child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
                                child: Text("Add",style: TextStyle(
                                    fontSize: 20.0
                                ),),
                              )),
                            )
                          ],
                        )
                    ),
                  ]
              )
          )
      ),
    );
  }
}
