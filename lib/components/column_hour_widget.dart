import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'column_hour_model.dart';
export 'column_hour_model.dart';

class ColumnHourWidget extends StatefulWidget {
  const ColumnHourWidget({
    super.key,
    required this.dateDebutHeureParam,
    required this.dateFinHeureParam,
    required this.intervalMinuteParam,
    int? heightPixelParam,
    required this.listReservationParam,
    required this.reservationBuilder,
  }) : heightPixelParam = heightPixelParam ?? 30;

  final DateTime? dateDebutHeureParam;
  final DateTime? dateFinHeureParam;
  final int? intervalMinuteParam;
  final int heightPixelParam;
  final List<ReservationView1Row>? listReservationParam;
  final Widget Function(ReservationView1Row reservation)? reservationBuilder;

  @override
  State<ColumnHourWidget> createState() => _ColumnHourWidgetState();
}

class _ColumnHourWidgetState extends State<ColumnHourWidget> {
  late ColumnHourModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColumnHourModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      final heure = functions
                          .getListHour(
                              widget.dateDebutHeureParam!,
                              widget.dateFinHeureParam!,
                              widget.intervalMinuteParam!)
                          .toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: heure.length,
                        itemBuilder: (context, heureIndex) {
                          final heureItem = heure[heureIndex];
                          return Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Container(
                              height: widget.heightPixelParam.toDouble(),
                              decoration: const BoxDecoration(),
                              child: Text(
                                dateTimeFormat(
                                  "Hm",
                                  heureItem,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Builder(
                  builder: (context) {
                    final reservation = widget.listReservationParam!.toList();

                    return SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      child: Stack(
                        children: List.generate(reservation.length,
                            (reservationIndex) {
                          final reservationItem = reservation[reservationIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                valueOrDefault<double>(
                                  functions.getTopPadding(
                                      widget.dateDebutHeureParam!,
                                      reservationItem.debut!,
                                      widget.intervalMinuteParam!,
                                      widget.heightPixelParam),
                                  0.0,
                                ),
                                0.0,
                                0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: functions.getTopPadding(
                                  reservationItem.debut!,
                                  reservationItem.fin!,
                                  widget.intervalMinuteParam!,
                                  widget.heightPixelParam),
                              decoration: const BoxDecoration(),
                              child: Builder(builder: (_) {
                                return widget.reservationBuilder!(
                                  reservationItem,
                                );
                              }),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
