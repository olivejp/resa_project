import '../database.dart';

class UtilisateurTable extends SupabaseTable<UtilisateurRow> {
  @override
  String get tableName => 'utilisateur';

  @override
  UtilisateurRow createRow(Map<String, dynamic> data) => UtilisateurRow(data);
}

class UtilisateurRow extends SupabaseDataRow {
  UtilisateurRow(super.data);

  @override
  SupabaseTable get table => UtilisateurTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nom => getField<String>('nom');
  set nom(String? value) => setField<String>('nom', value);

  String? get prenom => getField<String>('prenom');
  set prenom(String? value) => setField<String>('prenom', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  String get type => getField<String>('type')!;
  set type(String value) => setField<String>('type', value);
}
