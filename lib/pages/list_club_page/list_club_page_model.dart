import '/backend/supabase/supabase.dart';
import '/club/club_list/club_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_club_page_widget.dart' show ListClubPageWidget;
import 'package:flutter/material.dart';

class ListClubPageModel extends FlutterFlowModel<ListClubPageWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<ClubRow>>? containerSupabaseStream;
  // Model for ClubList component.
  late ClubListModel clubListModel;
  Stream<List<UtilisateurRow>>? circleImageSupabaseStream;

  @override
  void initState(BuildContext context) {
    clubListModel = createModel(context, () => ClubListModel());
  }

  @override
  void dispose() {
    clubListModel.dispose();
  }
}
