import 'package:expensemanager/helper/Databasehelper.dart';
import 'package:expensemanager/screens/ViewExpenses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class Addexpenses extends StatefulWidget {
  @override
  State<Addexpenses> createState() => _AddexpensesState();
}

class _AddexpensesState extends State<Addexpenses> {
  TextEditingController _title=TextEditingController();
  TextEditingController _description=TextEditingController();
  TextEditingController _amount=TextEditingController();
  TextEditingController dateinput=TextEditingController();
  var _value="Expenses";
  var _selected ="Shopping";
  var _method ="Cash";
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
                            Text("Date",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            TextField(
                              controller: dateinput,
                              //editing controller of this TextField
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.calendar_today),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blue ,),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color:Colors.black ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              readOnly: true,
                              //set it true, so that user will not able to edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: Color(0xff283593), // <-- SEE HERE
                                            onPrimary: Colors.white, // <-- SEE HERE
                                            onSurface: Colors.blueAccent, // <-- SEE HERE
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              primary: Colors.blueAccent, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    }
                                );
                                Container(
                                  child: SfDateRangePicker(
                                    selectionMode: DateRangePickerSelectionMode.range,
                                  ),
                                );
                                if (pickedDate != null) {
                                  String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                                  setState(() {
                                    dateinput.text =formattedDate.toString(); //set output date to TextField value.
                                  });
                                }
                              },
                            ),
                            SizedBox(height: 10.0,),
                            Text("Categories",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 3.0,),
                            Container(
                              width:MediaQuery.of(context).size.width,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                value: _selected,
                                onChanged: (val) {
                                  setState(() {
                                    _selected = val!;
                                  });
                                },
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Shopping",style: TextStyle(
                                    ),),
                                    value: "Shopping",),
                                  DropdownMenuItem(
                                    child: Text("Health Care"),
                                    value: "Health Care",),
                                  DropdownMenuItem(
                                    child: Text("Food & Drinks"),
                                    value: "food",),
                                  DropdownMenuItem(
                                    child: Text("Travel"),
                                    value: "Travel",),
                                ],
                            ),
                              ),
                            ),
                            Text("Payment Method",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 3.0,),
                            Container(
                              width:MediaQuery.of(context).size.width,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: _method,
                                  onChanged: (val) {
                                    setState(() {
                                      _method = val!;
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("Cash",style: TextStyle(
                                      ),),
                                      value: "Cash",),
                                    DropdownMenuItem(
                                      child: Text("Check"),
                                      value: "Check",),
                                    DropdownMenuItem(
                                      child: Text("Bank"),
                                      value: "Bank",),
                                    DropdownMenuItem(
                                      child: Text("Card"),
                                      value: "Card",),
                                  ],
                                ),
                              ),
                            ),
                            Center(
                              child:  ElevatedButton(onPressed: () async{
                                var title=_title.text.toString();
                                var type=_value.toString();
                                var description=_description.text.toString();
                                var amount=_amount.text.toString();
                                var category=_selected.toString();
                                var date = dateinput.text.toString();
                                var method = _method.toString();
                                Databasehelper obj = Databasehelper();
                                var id = await obj.insertdata(title,type,description,category,amount,date,method);
                                print("this is id :"+ id.toString());

                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>ViewExpenses())
                                );

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
