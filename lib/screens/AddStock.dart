import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddStock extends StatefulWidget {
  @override
  State<AddStock> createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  TextEditingController dateinput=TextEditingController();
  TextEditingController _sharename=TextEditingController();
  TextEditingController _quantity=TextEditingController();
  TextEditingController _entry=TextEditingController();
  TextEditingController _stop=TextEditingController();
  TextEditingController _target=TextEditingController();
  TextEditingController _description=TextEditingController();
  TextEditingController _amount=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Stock"),
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
                            SizedBox(height: 20.0,),
                            TextField(
                              style: TextStyle(
                                  fontSize: 20.0
                              ),
                              controller: dateinput,
                              //editing controller of this TextField
                              decoration: InputDecoration(
                                labelText: "Date",
                                labelStyle:TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                                prefixIcon: Icon(Icons.calendar_today),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blue ,),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color:Colors.black ),
                                  // borderRadius: BorderRadius.circular(10.0),
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
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                                  setState(() {
                                    dateinput.text =formattedDate.toString(); //set output date to TextField value.
                                  });
                                }
                              },
                            ),
                            SizedBox(height: 20.0,),
                            TextField(
                              style: TextStyle(
                                  fontSize: 20.0
                              ),
                              decoration: InputDecoration (
                                labelText: "Share Name",
                                labelStyle:TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _sharename,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 20.0,),
                            TextField(
                              style: TextStyle(
                                  fontSize: 20.0
                              ),
                              decoration: InputDecoration (
                                labelText: "Quantity",
                                labelStyle:TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _quantity,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 20.0,),
                            TextField(
                              style: TextStyle(
                                  fontSize: 20.0
                              ),
                              decoration: InputDecoration (
                                labelText: "Entry",
                                labelStyle:TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _entry,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 20.0,),
                            TextField(
                              style: TextStyle(
                                  fontSize: 20.0
                              ),
                              decoration: InputDecoration (
                                labelText: "Stop Loss",
                                labelStyle:TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _stop,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 20.0,),
                            TextField(
                              style: TextStyle(
                                  fontSize: 20.0
                              ),
                              decoration: InputDecoration (
                                labelText: "Target",
                                labelStyle:TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _target,
                              keyboardType: TextInputType.number,
                            ),

                            SizedBox(height: 20.0,),
                            TextField(
                              style: TextStyle(
                                fontSize: 20.0
                            ),
                              decoration: InputDecoration (
                                labelText: "Description",
                                labelStyle:TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _description,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 20.0,),
                            TextField(
                              style: TextStyle(
                                fontSize: 20.0
                              ),
                              decoration: InputDecoration (
                                labelText: "Total Amount",
                                labelStyle:TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _amount,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 20.0,),
                            Center(
                              child:  SizedBox(
                                width: 150.0,
                                height: 40.0,
                                child: ElevatedButton(onPressed: () async{
                                  var date = dateinput.text.toString();
                                  var sharename=_sharename.text.toString();
                                  var qty=_quantity.text.toString();
                                  var entry=_entry.text.toString();
                                  var stop=_stop.text.toString();
                                  var target=_target.text.toString();
                                  var description=_description.text.toString();
                                  var amount=_amount.text.toString();
                                  var loss = (int.parse(entry)-(int.parse(entry)*int.parse(stop)/100)).toString();
                                  var profit =(int.parse(entry)+(int.parse(entry)*int.parse(target)/100)).toString();
                                   var total =(int.parse(entry)*int.parse(qty)).toString();

                                  print(loss);
                                  print(profit);
                                  print(total);

                                  // Databasehelper obj=Databasehelper();
                                  // obj.insert_stock(sharename,type,description,amount,category,date,method);
                                },child: Text("Add",style: TextStyle(
                                    fontSize: 20.0
                                ),),
                                ),
                              )
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
