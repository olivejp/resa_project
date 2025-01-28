import '../database.dart';

class JourDisponibiliteTable extends SupabaseTable<JourDisponibiliteRow> {
  @override
  String get tableName => 'jour_disponibilite';

  @override
  JourDisponibiliteRow createRow(Map<String, dynamic> data) =>
      JourDisponibiliteRow(data);
}

class JourDisponibiliteRow extends SupabaseDataRow {
  JourDisponibiliteRow(super.data);

  @override
  SupabaseTable get table => JourDisponibiliteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get terrainId => getField<int>('terrain_id')!;
  set terrainId(int value) => setField<int>('terrain_id', value);

  String get jourSemaine => getField<String>('jour_semaine')!;
  set jourSemaine(String value) => setField<String>('jour_semaine', value);

  PostgresTime get heureDebut => getField<PostgresTime>('heure_debut')!;
  set heureDebut(PostgresTime value) =>
      setField<PostgresTime>('heure_debut', value);

  PostgresTime get heureFin => getField<PostgresTime>('heure_fin')!;
  set heureFin(PostgresTime value) =>
      setField<PostgresTime>('heure_fin', value);
}
