import 'package:flutter/material.dart';

class viewdemo extends StatefulWidget {
  @override
  State<viewdemo> createState() => _viewdemoState();
}

class _viewdemoState extends State<viewdemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Demo")
      ),
      // body: Container(
      //   padding: EdgeInsets.only(left: 10.0,right: 10.0),
      //   child: Container(
      //     padding: EdgeInsets.all(20.0),
      //     height: 165.0,
      //     margin: EdgeInsets.all(10.0),
      //     decoration: BoxDecoration(
      //         color: Color(0xffF4F4F4),
      //       borderRadius: BorderRadius.circular(20.0),
      //     ),
      //     child: Column(
      //       children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //            Container(
      //              padding: EdgeInsets.all(3.0),
      //              decoration: BoxDecoration(
      //                border: Border.all(color: Colors.black38),
      //                color: Colors.black12,
      //                borderRadius: BorderRadius.circular(20.0)
      //              ),
      //              child: Row(
      //                children: [
      //                  Icon(Icons.edit,size: 15.0,color: Colors.black26 ,),
      //                  Text("Edit",style: TextStyle(
      //                      color: Colors.black26
      //                  ),)
      //                ],
      //              ),
      //            )
      //           ],
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             ClipRect(
      //               child: Image.asset("img/food1.png",width: 50.0,),
      //             ),
      //           Text("Title : "+ snapshot.data![index]["title"].toString(),style: TextStyle(
      //             fontSize: 18.0,
      //             fontWeight: FontWeight.bold
      //           ),),
      //             Text("Amount : "+ snapshot.data![index]["amount"].toString(),style: TextStyle(
      //                 fontSize: 18.0
      //             ),),
      //           ],
      //         ),
      //         SizedBox(height: 10.0,),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Column(
      //               children: [
      //
      //                 Text("Date",style: TextStyle(
      //                   color: Colors.black26
      //                 ),),
      //                 SizedBox(height: 2.0,),
      //                 Text("Date : "+ snapshot.data![index]["date"].toString(),style: TextStyle(
      //                     fontSize: 18.0
      //                 ),),
      //               ],
      //             ),
      //             Column(
      //               children: [
      //
      //                 Text("Category",style: TextStyle(
      //                     color: Colors.black26
      //                 ),),
      //                 SizedBox(height: 2.0,),
      //                 Text(snapshot.data![index]["category"].toString(),style: TextStyle(
      //                     fontSize: 18.0
      //                 ),),
      //               ],
      //             ),
      //             Column(
      //               children: [
      //
      //                 Text("Payment Method",style: TextStyle(
      //                     color: Colors.black26
      //                 ),),
      //                 SizedBox(height: 2.0,),
      //                 Text("Date",style: TextStyle(
      //                   fontSize: 18.0
      //                 ),),
      //               ],
      //             ),
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
