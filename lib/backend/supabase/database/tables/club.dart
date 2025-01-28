import '../database.dart';

class ClubTable extends SupabaseTable<ClubRow> {
  @override
  String get tableName => 'club';

  @override
  ClubRow createRow(Map<String, dynamic> data) => ClubRow(data);
}

class ClubRow extends SupabaseDataRow {
  ClubRow(super.data);

  @override
  SupabaseTable get table => ClubTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int get owner => getField<int>('owner')!;
  set owner(int value) => setField<int>('owner', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get postalCode => getField<String>('postal_code');
  set postalCode(String? value) => setField<String>('postal_code', value);

  int? get telephone => getField<int>('telephone');
  set telephone(int? value) => setField<int>('telephone', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);
}
