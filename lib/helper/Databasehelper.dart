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
        "type text,description text,category text,amount number)");
  }


  Future<int> insertdata(title,type,description,category,amount)async{
    var db =await create_db();
    //create database
    create_db();
    //create database
  //  Insert data
   var id = await db.rawInsert("insert into expense (title,type,description,category,amount) values (?,?,?,?,?)",[title,type,description,category,amount]);
  //  Insert data
    return id;



  }

  Future<List> get_data()async{
    var db =await create_db();
    var data=await db.rawQuery("select * from expense");
    return data.toList();
  }

}