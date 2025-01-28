import '/components/column_hour_widget.dart';
import '/components/day_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_page_copy_widget.dart' show ChoosePageCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class ChoosePageCopyModel extends FlutterFlowModel<ChoosePageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DayRow component.
  late DayRowModel dayRowModel;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Models for ColumnHour dynamic component.
  late FlutterFlowDynamicModels<ColumnHourModel> columnHourModels;

  @override
  void initState(BuildContext context) {
    dayRowModel = createModel(context, () => DayRowModel());
    swipeableStackController = CardSwiperController();
    columnHourModels = FlutterFlowDynamicModels(() => ColumnHourModel());
  }

  @override
  void dispose() {
    dayRowModel.dispose();
    columnHourModels.dispose();
  }
}
