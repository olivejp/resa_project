import '/components/day_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'day_row_widget.dart' show DayRowWidget;
import 'package:flutter/material.dart';

class DayRowModel extends FlutterFlowModel<DayRowWidget> {
  ///  Local state fields for this component.

  DateTime? selectedDayLocal;

  ///  State fields for stateful widgets in this component.

  // Models for DayCard dynamic component.
  late FlutterFlowDynamicModels<DayCardModel> dayCardModels;

  @override
  void initState(BuildContext context) {
    dayCardModels = FlutterFlowDynamicModels(() => DayCardModel());
  }

  @override
  void dispose() {
    dayCardModels.dispose();
  }
}
