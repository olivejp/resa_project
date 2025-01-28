import '../database.dart';

class TerrainTable extends SupabaseTable<TerrainRow> {
  @override
  String get tableName => 'terrain';

  @override
  TerrainRow createRow(Map<String, dynamic> data) => TerrainRow(data);
}

class TerrainRow extends SupabaseDataRow {
  TerrainRow(super.data);

  @override
  SupabaseTable get table => TerrainTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int get clubId => getField<int>('club_id')!;
  set clubId(int value) => setField<int>('club_id', value);

  String get type => getField<String>('type')!;
  set type(String value) => setField<String>('type', value);
}
