import '../database.dart';

class ReservationView1Table extends SupabaseTable<ReservationView1Row> {
  @override
  String get tableName => 'reservation_view_1';

  @override
  ReservationView1Row createRow(Map<String, dynamic> data) =>
      ReservationView1Row(data);
}

class ReservationView1Row extends SupabaseDataRow {
  ReservationView1Row(super.data);

  @override
  SupabaseTable get table => ReservationView1Table();

  int? get reservationId => getField<int>('reservation_id');
  set reservationId(int? value) => setField<int>('reservation_id', value);

  DateTime? get debut => getField<DateTime>('debut');
  set debut(DateTime? value) => setField<DateTime>('debut', value);

  DateTime? get fin => getField<DateTime>('fin');
  set fin(DateTime? value) => setField<DateTime>('fin', value);

  int? get terrainId => getField<int>('terrain_id');
  set terrainId(int? value) => setField<int>('terrain_id', value);

  String? get terrainName => getField<String>('terrain_name');
  set terrainName(String? value) => setField<String>('terrain_name', value);

  String? get utilisateurNom => getField<String>('utilisateur_nom');
  set utilisateurNom(String? value) =>
      setField<String>('utilisateur_nom', value);

  String? get utilisationPrenom => getField<String>('utilisation_prenom');
  set utilisationPrenom(String? value) =>
      setField<String>('utilisation_prenom', value);

  double? get duree => getField<double>('duree');
  set duree(double? value) => setField<double>('duree', value);
}
