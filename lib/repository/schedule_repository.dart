import 'package:exemplo_projeto_final/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ScheduleRepository {

  final String scheduleTable = 'schedule_table';

  final String idColumn = 'id_column';
  final String nameColumn = 'name_column';
  final String phoneColumn = 'phone_column';
  final String dateColumn = 'date_column';
  final String hourColumn = 'hour_column';
  final String kindOfServiceColumn = 'kind_of_service_column';

  Future<Database> initializeDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'schedules.db');

    return openDatabase(path, version: 1,
    onCreate: (Database database, int newerVersion) async {
      await database.execute(
        'CREATE TABLE $scheduleTable($idColumn INTEGER PRIMARY KEI, $nameColumn TEXT, $phoneColumn TEXT, $dateColumn TEXT, $hourColumn TEXT, $kindOfServiceColumn TEXT)'
      );
    });
  }
  Future<int> save(Schedule schedule) async {
    final Database database = await initializeDB();
    return await database.insert(this.scheduleTable, schedule.toMap());
  }

  Future<int> saveAll(List<Schedule> schedules) async {
    int result = 0;
    final Database database = await initializeDB();
    for(var schedule in schedules) {
      result = await database.insert(this.scheduleTable, schedule.toMap());
    }
    return result;
  }

  Future<List<Schedule>> fetchAll() async {
    final Database database = await initializeDB();
    final List<Map<String, Object?>> query = await database.query(
      this.scheduleTable,
      columns: [idColumn, nameColumn, phoneColumn, dateColumn, hourColumn, kindOfServiceColumn],
    );
    return query.map((element) => Schedule.fromMap(element)).toList();
  }

  Future<Schedule?> findById(int id) async {
    final Database database = await initializeDB();
    final List<Map> maps = await database.query(
      scheduleTable,
      columns: [idColumn, nameColumn, phoneColumn, dateColumn, hourColumn, kindOfServiceColumn],
      where: '$idColumn = ?',
      whereArgs: [id]
    );
    if(maps.length > 0) {
      return Schedule.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    final Database database = await initializeDB();
    return await database.delete(
      scheduleTable,
      where: '$idColumn = ?',
      whereArgs: [id]
    );
  }

  Future<int> update(Schedule schedule) async {
    final Database database = await initializeDB();

    return await database.update(
      scheduleTable,
      schedule.toMap(),
      where: '$idColumn = ?',
      whereArgs: [schedule.id]
    );
  }

  Future<int?> getSize() async {
    final Database database = await initializeDB();
    return Sqflite.firstIntValue(await database.rawQuery('select count(*) from $scheduleTable'));
  }
}