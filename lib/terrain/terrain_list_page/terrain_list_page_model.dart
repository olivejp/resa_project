import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/terrain/terrain_card/terrain_card_widget.dart';
import 'terrain_list_page_widget.dart' show TerrainListPageWidget;
import 'package:flutter/material.dart';

class TerrainListPageModel extends FlutterFlowModel<TerrainListPageWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<TerrainRow>>? listViewSupabaseStream;
  // Models for TerrainCard dynamic component.
  late FlutterFlowDynamicModels<TerrainCardModel> terrainCardModels;

  @override
  void initState(BuildContext context) {
    terrainCardModels = FlutterFlowDynamicModels(() => TerrainCardModel());
  }

  @override
  void dispose() {
    terrainCardModels.dispose();
  }
}
