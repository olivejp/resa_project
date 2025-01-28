import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'day_card_model.dart';
export 'day_card_model.dart';

class DayCardWidget extends StatefulWidget {
  const DayCardWidget({
    super.key,
    required this.dateParameter,
    bool? selected,
  }) : selected = selected ?? true;

  final DateTime? dateParameter;
  final bool selected;

  @override
  State<DayCardWidget> createState() => _DayCardWidgetState();
}

class _DayCardWidgetState extends State<DayCardWidget> {
  late DayCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DayCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        color: widget.selected
            ? FlutterFlowTheme.of(context).primary
            : FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            dateTimeFormat(
              "EEEE",
              widget.dateParameter,
              locale: FFLocalizations.of(context).languageCode,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: widget.selected
                      ? FlutterFlowTheme.of(context).secondaryBackground
                      : FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
          ),
          Text(
            dateTimeFormat(
              "d",
              widget.dateParameter,
              locale: FFLocalizations.of(context).languageCode,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: widget.selected
                      ? FlutterFlowTheme.of(context).secondaryBackground
                      : FlutterFlowTheme.of(context).primaryText,
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w900,
                ),
          ),
          Text(
            dateTimeFormat(
              "MMM",
              widget.dateParameter,
              locale: FFLocalizations.of(context).languageCode,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  color: widget.selected
                      ? FlutterFlowTheme.of(context).secondaryBackground
                      : FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
