import '../database.dart';

class ClubTerrainTable extends SupabaseTable<ClubTerrainRow> {
  @override
  String get tableName => 'club_terrain';

  @override
  ClubTerrainRow createRow(Map<String, dynamic> data) => ClubTerrainRow(data);
}

class ClubTerrainRow extends SupabaseDataRow {
  ClubTerrainRow(super.data);

  @override
  SupabaseTable get table => ClubTerrainTable();

  int? get clubId => getField<int>('club_id');
  set clubId(int? value) => setField<int>('club_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get postalCode => getField<String>('postal_code');
  set postalCode(String? value) => setField<String>('postal_code', value);

  int? get telephone => getField<int>('telephone');
  set telephone(int? value) => setField<int>('telephone', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  int? get terrainId => getField<int>('terrain_id');
  set terrainId(int? value) => setField<int>('terrain_id', value);

  String? get terrainName => getField<String>('terrain_name');
  set terrainName(String? value) => setField<String>('terrain_name', value);

  String? get typeTerrain => getField<String>('type_terrain');
  set typeTerrain(String? value) => setField<String>('type_terrain', value);

  String? get ownerNom => getField<String>('owner_nom');
  set ownerNom(String? value) => setField<String>('owner_nom', value);

  String? get ownerPrenom => getField<String>('owner_prenom');
  set ownerPrenom(String? value) => setField<String>('owner_prenom', value);

  String? get ownerPhotoUrl => getField<String>('owner_photoUrl');
  set ownerPhotoUrl(String? value) => setField<String>('owner_photoUrl', value);

  String? get nomComplet => getField<String>('nom_complet');
  set nomComplet(String? value) => setField<String>('nom_complet', value);
}
