part of 'services.dart';

class DatabaseService {
  static DatabaseService _databaseService;
  static Database _database;

  DatabaseService._createInstance();

  factory DatabaseService() {
    if (_databaseService == null) {
      _databaseService = DatabaseService._createInstance();
    }

    return _databaseService;
  }

  Future<Database> initDB() async {
    //// Ambil direktori aplikasi di perangkat
    var dbDir = await getApplicationDocumentsDirectory();
    var dbPath = join(dbDir.path, 'alune_wemale.sqlite');

    ///// Copy database dari asset ke direktori smartphone jika database tidak tersedia
    if (FileSystemEntity.typeSync(dbPath) == FileSystemEntityType.notFound) {
      // ambil database dari asset kemudian Copy
      ByteData data = await rootBundle
          .load(join('assets', 'database', 'alune_wemale.sqlite'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // simpan hasil copy ke direktori
      await File(dbPath).writeAsBytes(bytes);
    }
    var db = await openDatabase(dbPath);
    // return getDB();
    return db;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  // ambil data kamus dengan kondisi
  Future<List<Kamus>> getWhere(String kategori, {String search}) async {
    Database db = await this.database;
    var sql;
    if (search != null) {
      sql =
          "SELECT * FROM kamus WHERE kategori = '$kategori' AND ( kata LIKE '%$search%' OR makna LIKE '%$search%' ) ORDER BY kata ASC";
    } else {
      sql =
          "SELECT * FROM kamus WHERE kategori = '$kategori' ORDER BY kata ASC";
    }

    var mapObject = await db.rawQuery(sql);

    int mapLength = mapObject.length;
    List<Kamus> listKamus = new List<Kamus>();
    for (int i = 0; i < mapLength; i++) {
      listKamus.add(Kamus.fromMapObject(mapObject[i]));
    }
    return listKamus;
  }
}
