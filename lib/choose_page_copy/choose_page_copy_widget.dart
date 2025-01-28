import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/column_hour_widget.dart';
import '/components/day_row_widget.dart';
import '/components/reservation_component_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'choose_page_copy_model.dart';
export 'choose_page_copy_model.dart';

class ChoosePageCopyWidget extends StatefulWidget {
  const ChoosePageCopyWidget({
    super.key,
    required this.pTypeParam,
  });

  final TypeTerrain? pTypeParam;

  @override
  State<ChoosePageCopyWidget> createState() => _ChoosePageCopyWidgetState();
}

class _ChoosePageCopyWidgetState extends State<ChoosePageCopyWidget> {
  late ChoosePageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoosePageCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'pk322n8w' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  constraints: const BoxConstraints(
                    maxHeight: 100.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.dayRowModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: DayRowWidget(
                      selectedDayParam:
                          functions.getDateWithoutTime(getCurrentTimestamp),
                      onSelectDayParam: (dateSelected) async {},
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<TerrainRow>>(
                    future: TerrainTable().queryRows(
                      queryFn: (q) => q.eqOrNull(
                        'type',
                        widget.pTypeParam?.name,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<TerrainRow> containerTerrainRowList = snapshot.data!;

                      return Container(
                        decoration: const BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final terrain = containerTerrainRowList.toList();

                            return FlutterFlowSwipeableStack(
                              onSwipeFn: (index) {},
                              onLeftSwipe: (index) {},
                              onRightSwipe: (index) {},
                              onUpSwipe: (index) {},
                              onDownSwipe: (index) {},
                              itemBuilder: (context, terrainIndex) {
                                final terrainItem = terrain[terrainIndex];
                                return wrapWithModel(
                                  model: _model.columnHourModels.getModel(
                                    terrainItem.id.toString(),
                                    terrainIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: ColumnHourWidget(
                                    key: Key(
                                      'Keyg5u_${terrainItem.id.toString()}',
                                    ),
                                    intervalMinuteParam: 30,
                                    dateDebutHeureParam:
                                        _model.dispoHeureDebutLocal!,
                                    dateFinHeureParam:
                                        _model.dispoHeureFinLocal!,
                                    heightPixelParam: 60,
                                    listReservationParam:
                                        _model.listReservationLocal,
                                    reservationBuilder:
                                        (ReservationView1Row reservation) =>
                                            ReservationComponentWidget(
                                      reservation: reservation,
                                    ),
                                  ),
                                );
                              },
                              itemCount: terrain.length,
                              controller: _model.swipeableStackController,
                              loop: false,
                              cardDisplayCount: 1,
                              scale: 1.0,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ].divide(const SizedBox(height: 10.0)).around(const SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
