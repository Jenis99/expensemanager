import 'package:expensemanager/helper/Databasehelper.dart';
import 'package:expensemanager/screens/Addexpenses.dart';
import 'package:expensemanager/screens/Reportscreen.dart';
import 'package:expensemanager/screens/UpdateData.dart';
import 'package:flutter/material.dart';

class Income extends StatefulWidget {
  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  Future<List> ? allexpenses;
  Future<List> get_expense(type)async{
    Databasehelper obj=Databasehelper();
    var data = await obj.get_data(type);
    return data;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      allexpenses=get_expense("Income");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: allexpenses,
          builder: (context,snapshot){
            if(snapshot.hasData)
            {
              if(snapshot.data!.length == 0)
              {
                return Center(
                  child: Text("No Income"),
                );
              }
              else
              {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        height: 185.0,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: (snapshot.data![index]["type"].toString()=="Income")?Colors.green.shade50:Colors.red.shade50,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    padding: EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black38),
                                        color: Colors.black12,
                                        borderRadius:
                                        BorderRadius.circular(20.0)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateData(
                                                        uid: snapshot.data![index]["pid"].toString()
                                                    ))
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            size: 15.0,
                                            color: Colors.black26,
                                          ),
                                          Text(
                                            "Edit",
                                            style: TextStyle(color: Colors.black26),
                                          )
                                        ],
                                      ),
                                    )
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRect(
                                  child: Image.asset(
                                    (snapshot.data![index]["category"].toString()=="Shopping")?"img/shopping.png":(snapshot.data![index]["category"].toString()=="food")?"img/food1.png"
                                        :(snapshot.data![index]["category"].toString()=="Travel")?"img/ntravel.png":"img/healthcare.png",
                                    width: 50.0,
                                  ),
                                ),
                                Text(
                                  snapshot.data![index]["title"].toString(),
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Rs."+snapshot.data![index]["amount"].toString(),
                                  style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Date",
                                      style: TextStyle(color: Colors.black26),
                                    ),
                                    SizedBox(
                                      height: 2.0,
                                    ),
                                    Text(
                                      snapshot.data![index]["date"].toString(),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Category",
                                      style: TextStyle(color: Colors.black26),
                                    ),
                                    SizedBox(
                                      height: 2.0,
                                    ),
                                    Text(
                                      snapshot.data![index]["category"]
                                          .toString(),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Payment Method",
                                      style: TextStyle(color: Colors.black26),
                                    ),
                                    SizedBox(
                                      height: 2.0,
                                    ),
                                    Text(
                                      snapshot.data![index]["method"]
                                          .toString(),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    SizedBox(
                                      height: 2.0,
                                    ),
                                    Text(
                                      snapshot.data![index]["type"].toString(),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                    // return ListTile(
                    //   title: Text(snapshot.data![index]["pname"].toString()),
                    //   subtitle:  Text("Rs."+snapshot.data![index]["price"].toString()),
                    // );
                  },
                );
                // return ListView.builder(
                //   itemCount: snapshot.data!.length,
                //   itemBuilder: (context,index)
                //   {
                //     return Card(
                //       elevation: 15.0,
                //       child: Container(
                //         width: MediaQuery.of(context).size.width,
                //         margin: EdgeInsets.all(15.0),
                //         alignment: Alignment.center,
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text("Type : "+ snapshot.data![index]["type"].toString(),style: TextStyle(
                //               fontSize: 18.0
                //             ),),
                //             SizedBox(height: 5.0,),
                //             Text("No. : "+ snapshot.data![index]["pid"].toString(),style: TextStyle(
                //                 fontSize: 18.0
                //             ),),
                //             SizedBox(height: 5.0,),
                //             Text("Title : "+ snapshot.data![index]["title"].toString(),style: TextStyle(
                //                 fontSize: 18.0
                //             ),),
                //             SizedBox(height: 5.0,),
                //             Text("Description : "+ snapshot.data![index]["description"].toString(),style: TextStyle(
                //                 fontSize: 18.0
                //             ),),
                //             SizedBox(height: 5.0,),
                //             Text("Category : "+ snapshot.data![index]["category"].toString(),style: TextStyle(
                //                 fontSize: 18.0
                //             ),),
                //             SizedBox(height: 5.0,),
                //             Text("Amount : "+ snapshot.data![index]["amount"].toString(),style: TextStyle(
                //                 fontSize: 18.0
                //             ),),
                //             SizedBox(height: 5.0,),
                //             Text("Date : "+ snapshot.data![index]["date"].toString(),style: TextStyle(
                //                 fontSize: 18.0
                //             ),),
                //             SizedBox(height: 5.0,),
                //             Row(
                //               children: [
                //                 ElevatedButton(onPressed: ()
                //                 {
                //                   Navigator.of(context).push(
                //                       MaterialPageRoute(builder: (context) => UpdateData(
                //                           uid:snapshot.data![index]["pid"].toString()
                //                       ))
                //                   );
                //                 },
                //                     child: Text("Edit")),
                //                 SizedBox(width: 20.0,),
                //                 ElevatedButton(onPressed: () async
                //                 {
                //                   AlertDialog alert = new AlertDialog(
                //                     title: Text("Warning!"),
                //                     content: Text("Are you sure you want to delete?"),
                //                     actions: [
                //                       ElevatedButton(onPressed: () async{
                //                         Navigator.of(context).pop();
                //                         var id = snapshot.data![index]["pid"].toString();
                //                         Databasehelper obj = new Databasehelper();
                //                         var status = await obj.delete_data(id);
                //                         if(status==1)
                //                         {
                //                           print("Record Deleted");
                //                           setState(() {
                //                             allexpenses = get_expense("all");
                //                           });
                //                         }
                //                         else
                //                         {
                //                           print("Record not Deleted");
                //                         }
                //                       }, child: Text("Yes")),
                //                       ElevatedButton(onPressed: (){
                //                         Navigator.of(context).pop();
                //                       }, child: Text("No")),
                //                     ],
                //                   );
                //
                //                   showDialog(context: context, builder: (context){
                //                     return alert;
                //                   });
                //
                //                 },
                //                     child: Text("Delete")),
                //                 SizedBox(width: 20.0,),
                //                 ElevatedButton(onPressed: (){
                //                   var id = snapshot.data![index]["pid"].toString();
                //
                //
                //                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Addexpenses(
                //                   )));
                //
                //
                //                 }, child:Text("View"))
                //               ],
                //             )
                //           ],
                //         ),
                //       ),
                //     );
                //     // return ListTile(
                //     //   title: Text(snapshot.data![index]["pname"].toString()),
                //     //   subtitle:  Text("Rs."+snapshot.data![index]["price"].toString()),
                //     // );
                //   },
                // );
              }
            }
            else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}
