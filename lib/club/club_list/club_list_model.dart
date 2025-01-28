import '/club/club_card/club_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'club_list_widget.dart' show ClubListWidget;
import 'package:flutter/material.dart';

class ClubListModel extends FlutterFlowModel<ClubListWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for ClubCard dynamic component.
  late FlutterFlowDynamicModels<ClubCardModel> clubCardModels;

  @override
  void initState(BuildContext context) {
    clubCardModels = FlutterFlowDynamicModels(() => ClubCardModel());
  }

  @override
  void dispose() {
    clubCardModels.dispose();
  }
}
