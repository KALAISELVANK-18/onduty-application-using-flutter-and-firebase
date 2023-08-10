

import 'package:mongo_dart/mongo_dart.dart';
import 'package:realm/realm.dart';

import 'dart:developer';
import 'dart:io';
import 'dart:convert';

class MongoDatabaseee{
  late var g;
  late var user;

  connectt() async {
    var db = await Db.create(
        "mongodb+srv://odkec:Kmm018@kecapps.fu0drkt.mongodb.net/?retryWrites=true&w=majority");


    await db.open();
    inspect(db);
    var status = db.serverStatus();

    db.databaseName = "KEC";
    return db;
  }}