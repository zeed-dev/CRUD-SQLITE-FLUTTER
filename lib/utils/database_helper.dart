import 'package:crud_regmal/models/regmal.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  static late Database _database;

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static const String _TBL_REGMAL_SATU = "regmalsatu";

  Logger _logger = Logger();

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, "regmal_satu.db"),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_TBL_REGMAL_SATU(
            nomor_ktp INTEGER PRIMARY KEY,
            nama_lengkap TEXT,
            tgl_lahir TEXT,
            jenis_kelamin TEXT,
            alamat TEXT,
            provinsi TEXT,
            asal_penemuan_kasus TEXT,
            jenis_penemuan TEXT,
            kegiatan_penemuan TEXT,
            parasit TEXT
          )
        ''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertRegmalSatu(RegmalSatu regmalSatu) async {
    _logger.d("INSERT REGMAL 1");
    final Database db = await database;
    _logger.d(regmalSatu.toMap());
    await db.insert(_TBL_REGMAL_SATU, regmalSatu.toMap());
  }

  Future<List<RegmalSatu>> getAllRegmal() async {
    _logger.d("GET REGMAL SATU");
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_TBL_REGMAL_SATU);

    return results.map((e) => RegmalSatu.fromMap(e)).toList();
  }

  Future<RegmalSatu> getRegmalByKtp(int ktp) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _TBL_REGMAL_SATU,
      where: "nomor_ktp = ?",
      whereArgs: [ktp],
    );

    return results.map((e) => RegmalSatu.fromMap(e)).first;
  }

  Future<void> updateRegmal(RegmalSatu regmalSatu) async {
    final db = await database;

    await db.update(
      _TBL_REGMAL_SATU,
      regmalSatu.toMap(),
      where: "nomor_ktp = ?",
      whereArgs: [regmalSatu.nomor_ktp],
    );
  }

  Future<void> deleteRegmalSatu(int ktp) async {
    final db = await database;

    await db.delete(
      _TBL_REGMAL_SATU,
      where: "nomor_ktp = ?",
      whereArgs: [ktp],
    );
  }
}
