import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'address.dart';

class DbHelper {
  static Database _db;
  static const String DB_NAME = 'address.db';
  static const String TABLE = 'addressList';
  static const String ID = 'id';
  static const String ADDTYPE = 'addType';
  static const String HOUSENUM = 'houseNum';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $ADDTYPE TEXT, $HOUSENUM TEXT)");
  }

  Future<Address> save(Address address) async {
    var dbClient = await db;
    address.id = await dbClient.insert(TABLE, address.toMap());
    return address;
  }

  Future<List<Address>> getAddress() async {
    var dbClient = await db;
    // List<Map> maps =
    //     await dbClient.query(TABLE, columns: [ID, ADDTYPE, HOUSENUM]);
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Address> address = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        address.add(Address.fromMap(maps[i]));
      }
    }
    return address;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
