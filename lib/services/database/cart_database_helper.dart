import 'package:e_nosa/models/product_cart_model.dart';
import 'package:e_nosa/views/constant.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database!;
    _database = await initDB();

    return _database;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE $tableCartProduct(
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL,
      $columnPrice TEXT NOT NULL,
     
      )''');
    });
  }

  insert(ProductCartModel model) async {
    var dbClient = await database;
    await dbClient?.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
