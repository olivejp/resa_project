import '../database.dart';

class ReservationTable extends SupabaseTable<ReservationRow> {
  @override
  String get tableName => 'reservation';

  @override
  ReservationRow createRow(Map<String, dynamic> data) => ReservationRow(data);
}

class ReservationRow extends SupabaseDataRow {
  ReservationRow(super.data);

  @override
  SupabaseTable get table => ReservationTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get owner => getField<int>('owner')!;
  set owner(int value) => setField<int>('owner', value);

  DateTime get start => getField<DateTime>('start')!;
  set start(DateTime value) => setField<DateTime>('start', value);

  DateTime get end => getField<DateTime>('end')!;
  set end(DateTime value) => setField<DateTime>('end', value);

  int? get terrainId => getField<int>('terrain_id');
  set terrainId(int? value) => setField<int>('terrain_id', value);
}
