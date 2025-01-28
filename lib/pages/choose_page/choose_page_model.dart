import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/column_hour_widget.dart';
import '/components/day_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'choose_page_widget.dart' show ChoosePageWidget;
import 'package:flutter/material.dart';

class ChoosePageModel extends FlutterFlowModel<ChoosePageWidget> {
  ///  Local state fields for this page.

  DateTime? dateSelectedLocal;

  TypeTerrain? typeTerrainLocal = TypeTerrain.PADEL;

  JourSemaine? jourSemaineSelected = JourSemaine.LUNDI;

  DateTime? dispoHeureDebutLocal;

  DateTime? dispoHeureFinLocal;

  List<ReservationView1Row> listReservationLocal = [];
  void addToListReservationLocal(ReservationView1Row item) =>
      listReservationLocal.add(item);
  void removeFromListReservationLocal(ReservationView1Row item) =>
      listReservationLocal.remove(item);
  void removeAtIndexFromListReservationLocal(int index) =>
      listReservationLocal.removeAt(index);
  void insertAtIndexInListReservationLocal(
          int index, ReservationView1Row item) =>
      listReservationLocal.insert(index, item);
  void updateListReservationLocalAtIndex(
          int index, Function(ReservationView1Row) updateFn) =>
      listReservationLocal[index] = updateFn(listReservationLocal[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for SelectTypeTerrain widget.
  TypeTerrain? selectTypeTerrainValue;
  FormFieldController<TypeTerrain>? selectTypeTerrainValueController;
  // Stores action output result for [Backend Call - Query Rows] action in SelectTypeTerrain widget.
  List<ClubTerrainRow>? listTerrain;
  // State field(s) for TerrainDropDown widget.
  int? terrainDropDownValue;
  FormFieldController<int>? terrainDropDownValueController;
  // Model for DayRow component.
  late DayRowModel dayRowModel;
  // Model for ColumnHour component.
  late ColumnHourModel columnHourModel;

  @override
  void initState(BuildContext context) {
    dayRowModel = createModel(context, () => DayRowModel());
    columnHourModel = createModel(context, () => ColumnHourModel());
  }

  @override
  void dispose() {
    dayRowModel.dispose();
    columnHourModel.dispose();
  }

  /// Action blocks.
  Future queryJourDispo(BuildContext context) async {
    List<JourDisponibiliteRow>? disponibilites;

    if ((jourSemaineSelected != null) &&
        (terrainDropDownValue != null) &&
        (dateSelectedLocal != null)) {
      // QueryListDisponibilite
      disponibilites = await JourDisponibiliteTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'jour_semaine',
              jourSemaineSelected?.name,
            )
            .eqOrNull(
              'terrain_id',
              terrainDropDownValue,
            ),
      );
      // Set heure debut et heure de fin
      dispoHeureDebutLocal = functions.mapHour(
          dateSelectedLocal, disponibilites.firstOrNull?.heureDebut.time);
      dispoHeureFinLocal = functions.mapHour(
          dateSelectedLocal, disponibilites.firstOrNull?.heureFin.time);
      return;
    } else {
      return;
    }
  }

  Future queryReservationByTerrainAndDate(
    BuildContext context, {
    required int? terrainId,
    required DateTime? dateSelected,
  }) async {
    List<ReservationView1Row>? listReservations;

    // Query list reservation by date and terrain id
    listReservations = await ReservationView1Table().queryRows(
      queryFn: (q) => q
          .gteOrNull(
            'debut',
            supaSerialize<DateTime>(functions.getMinHourDateTime(dateSelected)),
          )
          .lteOrNull(
            'fin',
            supaSerialize<DateTime>(functions.getMaxHourDateTime(dateSelected)),
          )
          .eqOrNull(
            'terrain_id',
            terrainId,
          )
          .order('debut', ascending: true),
    );
    listReservationLocal =
        listReservations.toList().cast<ReservationView1Row>();
  }
}
