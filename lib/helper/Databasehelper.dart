import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Databasehelper{


   Database ? db;


  Future<Database> create_db()async{
    if(db==null){
      Directory dir =await getApplicationDocumentsDirectory();
      String path = join(dir.path,"Expense_db");
      var db = await openDatabase(path,version: 1,onCreate: create_table);
      return db;
    }
    else{
      print("Database Already Created");
      return  db!;
    }
  }

  create_table(Database db,int version)async
  {
    print("table created");
    db.execute("create table expense(pid integer primary key autoincrement,title text,"
        "type text,description text,category text,amount number,date text,method text)");
  }


  Future<int> insertdata(title,type,description,category,amount,date,method)async{
    var db =await create_db();
    //create database
    create_db();
    //create database
  //  Insert data
   var id = await db.rawInsert("insert into expense (title,type,description,category,amount,date,method) values (?,?,?,?,?,?,?)",[title,type,description,category,amount,date,method]);
  //  Insert data
    return id;
  }

  Future<List> get_data(type)async{
    var db = await create_db();
    var query = "";
    if (type == "all")
    {
      query = "select * from expense";
    }
    else if(type=="Expenses")
    {
      query = "select * from expense where type='Expenses'";
    }
    else
    {
      query = "select * from expense where type='Income'";
    }
    var data = await db.rawQuery(query);
    return data.toList();
  }

  Future<int> delete_data(id)async{
    var db =await create_db();
    create_db();
    var status= await db.rawDelete("delete from expense where pid=?",[id]);
    return status ;
  }

   Future<List> get_singledata(id)async{
     var db =await create_db();
     var data=await db.rawQuery("select * from expense where pid=?",[id]);
     return data;
   }

   Future<int> updatedata(title,type,description,amount,category,date,method,id)async{
     var db =await create_db();
     var status=await db.rawUpdate("update expense set title=?,type=?,description=?,category=?,amount=?,date=?,method=? where pid=?",[title,type,description,category,amount,date,method,id]);
     return status;
   }

}