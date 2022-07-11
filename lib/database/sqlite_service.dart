import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../story_pages/user_data.dart';
/*
//Create a table in SQLite
class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(join(path, "database.db"),
    onCreate: (database, version) async {
      await database.execute("CREATE TABLE (id INTEGER KEY AUTOINCREMENT, image TEXT NOT NULL, video TEXT NOT NULL)",);},
    version: 1,
    onUpgrade: (database, oldVersion, newVersion){()=> } );
    }
 // Insert data into a table in SQLite
  static Future<int> createItem(Media note) async {
    int result = 0;
    final Database db = await initializeDB();
    final id = await db.insert(
        'Media', note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);}

  //Get data from a table in SQLite
    Future<List<Media>> getItems() async {
    final db = await SqliteService.initizateDb();
    final List<Map<String, Object?>> queryResult =
    await db.query('Media', orderBy: MediaColumn.createdAt);
    return queryResult.map((e) => Media.fromMap(e)).toList();
    }

  }
*/