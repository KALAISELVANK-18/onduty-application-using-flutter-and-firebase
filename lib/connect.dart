import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:realm/realm.dart';

import 'dart:developer';
import 'dart:io';
import 'dart:convert';

class MongoDatabasee{
   late var g;
   late var user;
   final userr = FirebaseAuth.instance.currentUser;

   connect(int b) async {
     var db = await Db.create(
         "mongodb+srv://odkec:Kmm018@kecapps.fu0drkt.mongodb.net/?retryWrites=true&w=majority");


     await db.open();
     inspect(db);
     var status = db.serverStatus();

     db.databaseName = "KEC";
     var colname=userr!.email!.toString();
     var substr=colname.substring(colname.length-15,colname.length-10);

     var collection = db.collection(substr.toUpperCase());


     final pipelinee = AggregationPipelineBuilder()
         .addStage(
         Match(where.eq('email',colname).map['\$query'])).build();
      var vvvvv=await collection.aggregateToStream(pipelinee).toList();
     List<Map<String,dynamic>> bb=<Map<String,dynamic>>[];
      for(int i=0;i<vvvvv.length;i++) {
        var vvvv = vvvvv[i]["leave"];
        for (int j = 0; j < vvvv.length; j++) {
          if (vvvv[j]["level"] == b) {
            Map<String, dynamic> vxi = {
              "name":vvvvv[i]["name"],
              "roll":vvvvv[i]["Roll No"],
              "ids":vvvv[j]["ids"],
              "from": vvvv[j]["from"],
              "to": vvvv[j]["to"],
              "type": vvvv[j]["type"],
              "level": 1,
            };
            bb.add(vxi);
          }
        }
      }
    //   DbCollection vx=DbCollection(vv[0]["leave"],"gh");
    //  final pipeline = AggregationPipelineBuilder()
    //      .addStage(
    //      Match(where.eq('level', 1))).build();
    //
    //
    //   final vm=await vx.aggregateToStream(pipeline).toList();
    // print(vm);
    var bbb= await FirebaseFirestore.instance.collection(substr.toUpperCase()).doc(user).collection("leave").where("level",isEqualTo: 2).snapshots();

    return bbb;


   }

   connect1(int b) async {
     var db = await Db.create(
         "mongodb+srv://odkec:Kmm018@kecapps.fu0drkt.mongodb.net/?retryWrites=true&w=majority");


     await db.open();
     inspect(db);
     var status = db.serverStatus();

     db.databaseName = "KEC";
     var colname=userr!.email!.toString();
     var substr=colname.substring(colname.length-15,colname.length-10);

     var collection = db.collection(substr.toUpperCase());


     final pipelinee = AggregationPipelineBuilder()
         .addStage(
         Match(where.eq('email',colname).map['\$query'])).build();
     var vvvvv=await collection.aggregateToStream(pipelinee).toList();
     List<Map<String,dynamic>> bb=<Map<String,dynamic>>[];
     for(int i=0;i<vvvvv.length;i++) {
       var vvvv = vvvvv[i]["OD"];
       for (int j = 0; j < vvvv.length; j++) {
         if (vvvv[j]["level"] == b) {
           Map<String, dynamic> vxi = {
             "name":vvvvv[i]["name"],
             "roll":vvvvv[i]["Roll No"],
             "ids":vvvv[j]["ids"],
             "from": vvvv[j]["from"],
             "to": vvvv[j]["to"],
             "category": vvvv[j]["category"],
             "level": 1,
             "reason":vvvv[j]["reason"],
             "noperiods":vvvv[j]["noperiods"]
           };
           bb.add(vxi);
         }
       }
     }
     //   DbCollection vx=DbCollection(vv[0]["leave"],"gh");
     //  final pipeline = AggregationPipelineBuilder()
     //      .addStage(
     //      Match(where.eq('level', 1))).build();
     //
     //
     //   final vm=await vx.aggregateToStream(pipeline).toList();
     // print(vm);

     return bb;


   }
    zz(String email,String pass)async{
   /* final appp = App(AppConfiguration('application-0-wxtih' ,localAppName: "odkec",localAppVersion: '1.0.0+1'));
    final users= await appp.logIn(Credentials.emailPassword(email, pass));*/

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print("success");
      // if success
      return "success";

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "User not found";
      } else if (e.code == 'wrong-password') {
        return "Wrong password";
      }
    }

    return "gfd";
   }

   approve(Map<String,dynamic> bb)async{

     var db = await Db.create(
         "mongodb+srv://odkec:Kmm018@kecapps.fu0drkt.mongodb.net/?retryWrites=true&w=majority");

     var colname=userr!.email!.toString();
     var substr=colname.substring(colname.length-15,colname.length-10);
     await db.open();
     inspect(db);
     var status = db.serverStatus();

     db.databaseName = "KEC";
     var collection = db.collection(substr.toUpperCase());


      final pipelinee = AggregationPipelineBuilder()
          .addStage(
         Match(where.eq("Roll No",bb["roll"]).map['\$query'])).build();
     var vvvvv=await collection.aggregateToStream(pipelinee).toList();
     var vvvv = vvvvv[0]["leave"];
     List<Map<String,dynamic>> bbb=<Map<String,dynamic>>[];
     for (int j = 0; j < vvvv.length; j++) {

         Map<String, dynamic> vxi = {
            "ids":vvvv[j]["ids"],
           "from": vvvv[j]["from"],

           "to": vvvv[j]["to"],

           "type": vvvv[j]["type"],


           "level": (bb["ids"]==j)?2:vvvv[j]["level"],
           "reason":"vxcv",
           "others":""

         };

       bbb.add(vxi);
     }



       collection.update(where.eq("Roll No",bb["roll"]),modify.set("leave",bbb) );
   }
profile(String email)async{

  var db = await Db.create(
      "mongodb+srv://odkec:Kmm018@kecapps.fu0drkt.mongodb.net/?retryWrites=true&w=majority");
  await db.open();
  inspect(db);
  var status = db.serverStatus();

  db.databaseName = "KEC";
  var colname=email.toString();
  var substr=colname.substring(colname.length-15,colname.length-10);
  var collection = db.collection(substr.toUpperCase());


  final pipelinee = AggregationPipelineBuilder()
      .addStage(
      Match(where.eq('email',email).map['\$query'])).build();
  var vvvvv=await collection.aggregateToStream(pipelinee).toList();

  print(substr.toUpperCase());






}

leavepush(String from,String to,String type,String others,String reason,List<List<TextEditingController>> edit,List<String> editt)async {
  var db = await Db.create(
      "mongodb+srv://odkec:Kmm018@kecapps.fu0drkt.mongodb.net/?retryWrites=true&w=majority");
  await db.open();
  inspect(db);
  var status = db.serverStatus();

  db.databaseName = "KEC";
  var colname = userr!.email!.toString();
  var substr = colname.substring(colname.length - 15, colname.length - 10);
  var collection = db.collection(substr.toUpperCase());
  final pipelinee = AggregationPipelineBuilder()
      .addStage(
      Match(where.eq('email',colname).map['\$query'])).build();
  var vvvvv=await collection.aggregateToStream(pipelinee).toList();


  int c=vvvvv[0]["idsarr"][1];

  Map<String,List> bb={};
  int total=0;

  for(int i=0;i<editt.length;i++){
    if(editt[i]=="select periods") {

      bb[i.toString()]= <int>[int.parse(edit[i][0].text),int.parse(edit[i][1].text)];
      total+=int.parse(edit[i][1].text)-int.parse(edit[i][0].text);}
    else if(editt[i]=="Full day"){
      bb[i.toString()]=(<int>[1,7]);
      total+=7;}
    else if(editt[i]=="First Half"){
      bb[i.toString()]=(<int>[1,4]);
      total+=4;}
    else if(editt[i]=="Second half"){
      bb[i.toString()]=(<int>[5,7]);
      total+=3;}
  }

  await collection.updateOne(where.eq('email', colname), modify.push("leave", {

    "from": from,
    "to": to,
    "type": type,
    "prdlist":bb,
    "noperiods":total,
    "level": 1,
    "reason": reason,
    "others": others,
    "timestamp":0
  }));
  await FirebaseFirestore.instance.collection(substr.toUpperCase()).doc(userr?.email.toString()).collection("leave").add({
    "ids":c,
    "from": from,
    "to": to,
    "type": type,
    "prdlist":bb,
    "noperiods":total,
    "level": 1,
    "name":"Kalaiselvan K",
    "roll":"21CSR072",
    "reason": reason,
    "others": others,
    "timestamp":FieldValue.serverTimestamp()
  });


  await collection.updateOne(where.eq('email',colname), modify.set("idsarr", [vvvvv[0]["idsarr"][0],++c]));
  await collection.updateOne(where.eq('email',colname), modify.set("notapproved", [vvvvv[0]["notapproved"][0],vvvvv[0]["notapproved"][1],++vvvvv[0]["notapproved"][2]]));


}



preodpush(String from, String to,List<List<TextEditingController>> edit,List<String> editt,String category,
    String others,String participated,String college,String organization,String reason)async
{
  var db = await Db.create(
      "mongodb+srv://odkec:Kmm018@kecapps.fu0drkt.mongodb.net/?retryWrites=true&w=majority");
  await db.open();
  inspect(db);
  var status = db.serverStatus();

  db.databaseName = "KEC";
  var colname=userr!.email!.toString();
  var substr=colname.substring(colname.length-15,colname.length-10);
  var collection = db.collection(substr.toUpperCase());
  Map<String,List> bb={};
  int total=0;

  for(int i=0;i<editt.length;i++){
    if(editt[i]=="select periods") {

      bb[i.toString()]= <int>[int.parse(edit[i][0].text),int.parse(edit[i][1].text)];
      total+=int.parse(edit[i][1].text)-int.parse(edit[i][0].text);}
    else if(editt[i]=="Full day"){
      bb[i.toString()]=(<int>[1,7]);
      total+=7;}
    else if(editt[i]=="First Half"){
      bb[i.toString()]=(<int>[1,4]);
      total+=4;}
    else if(editt[i]=="Second half"){
      bb[i.toString()]=(<int>[5,7]);
      total+=3;}
  }

  final pipelinee = AggregationPipelineBuilder()
      .addStage(
      Match(where.eq('email',colname).map['\$query'])).build();
  var vvvvv=await collection.aggregateToStream(pipelinee).toList();


  int c=vvvvv[0]["idsarr"][0];
  await collection.updateOne(where.eq('email',colname), modify.push("OD", {
    "from":from,
    "to":to,
    "name":"Kalaiselva",
      "roll":"gy",
    "ids":c,
    "prdlist":bb,
    "noperiods":total,
    "category":category,
    "level":1,
    (participated=="others")?"organization":"college":(participated=="Outside")?college:(participated=="Inside")?"Kongu engineering college":organization,
    "reason":reason,"others":others,"timestamp":0,
  }));


  await FirebaseFirestore.instance.collection(substr.toUpperCase()).doc(userr?.email.toString()).collection("OD").add({
      "from":from,
      "to":to,
      "prdlist":bb,
      "noperiods":total,
      "category":category,
      "level":1,
      "name":"Kalaiselvan K",
      "roll":"21CSR072",
  (participated=="others")?"organization":"college":(participated=="Outside")?college:(participated=="Inside")?"Kongu engineering college":organization,
      "reason":reason,"others":others,"timestamp":FieldValue.serverTimestamp(),});

      await collection.updateOne(where.eq('email',colname), modify.set("idsarr", [++c,vvvvv[0]["idsarr"][1]]));
  await collection.updateOne(where.eq('email',colname), modify.set("notapproved", [++vvvvv[0]["notapproved"][0],vvvvv[0]["notapproved"][1],vvvvv[0]["notapproved"][2]]));

}}

