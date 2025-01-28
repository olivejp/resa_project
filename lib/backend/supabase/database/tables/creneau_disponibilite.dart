import '../database.dart';

class CreneauDisponibiliteTable extends SupabaseTable<CreneauDisponibiliteRow> {
  @override
  String get tableName => 'creneau_disponibilite';

  @override
  CreneauDisponibiliteRow createRow(Map<String, dynamic> data) =>
      CreneauDisponibiliteRow(data);
}

class CreneauDisponibiliteRow extends SupabaseDataRow {
  CreneauDisponibiliteRow(super.data);

  @override
  SupabaseTable get table => CreneauDisponibiliteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get dureeCreneau => getField<int>('duree_creneau')!;
  set dureeCreneau(int value) => setField<int>('duree_creneau', value);

  int get disponibiliteId => getField<int>('disponibilite_id')!;
  set disponibiliteId(int value) => setField<int>('disponibilite_id', value);
}
