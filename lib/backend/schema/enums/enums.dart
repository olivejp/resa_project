import 'package:collection/collection.dart';

enum JourSemaine {
  LUNDI,
  MARDI,
  MERCREDI,
  JEUDI,
  VENDREDI,
  SAMEDI,
  DIMANCHE,
}

enum TypeTerrain {
  SQUASH,
  TENNIS,
  PADEL,
  PICKLE,
  TENNIS_VOLLEY,
}

enum TypeUtilisateur {
  GERANT,
  UTILISATEUR,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (JourSemaine):
      return JourSemaine.values.deserialize(value) as T?;
    case (TypeTerrain):
      return TypeTerrain.values.deserialize(value) as T?;
    case (TypeUtilisateur):
      return TypeUtilisateur.values.deserialize(value) as T?;
    default:
      return null;
  }
}
