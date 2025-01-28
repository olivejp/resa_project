import '/components/day_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'day_row_model.dart';
export 'day_row_model.dart';

class DayRowWidget extends StatefulWidget {
  const DayRowWidget({
    super.key,
    required this.onSelectDayParam,
    this.selectedDayParam,
  });

  final Future Function(DateTime dateSelected)? onSelectDayParam;
  final DateTime? selectedDayParam;

  @override
  State<DayRowWidget> createState() => _DayRowWidgetState();
}

class _DayRowWidgetState extends State<DayRowWidget> {
  late DayRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DayRowModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((widget.selectedDayParam != null) &&
          (widget.selectedDayParam != _model.selectedDayLocal)) {
        _model.selectedDayLocal = widget.selectedDayParam;
        safeSetState(() {});
        return;
      } else {
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final list1Days =
            functions.getNext15Days(widget.selectedDayParam!).toList();

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(
            10.0,
            0,
            10.0,
            0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: list1Days.length,
          separatorBuilder: (_, __) => const SizedBox(width: 5.0),
          itemBuilder: (context, list1DaysIndex) {
            final list1DaysItem = list1Days[list1DaysIndex];
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.selectedDayLocal = list1DaysItem;
                safeSetState(() {});
                await widget.onSelectDayParam?.call(
                  _model.selectedDayLocal!,
                );
              },
              child: wrapWithModel(
                model: _model.dayCardModels.getModel(
                  list1DaysIndex.toString(),
                  list1DaysIndex,
                ),
                updateCallback: () => safeSetState(() {}),
                child: DayCardWidget(
                  key: Key(
                    'Keyntd_${list1DaysIndex.toString()}',
                  ),
                  selected: _model.selectedDayLocal == list1DaysItem,
                  dateParameter: list1DaysItem,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
