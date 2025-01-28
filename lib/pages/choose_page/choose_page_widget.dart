import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/column_hour_widget.dart';
import '/components/day_row_widget.dart';
import '/components/reservation_component_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'choose_page_model.dart';
export 'choose_page_model.dart';

class ChoosePageWidget extends StatefulWidget {
  const ChoosePageWidget({super.key});

  @override
  State<ChoosePageWidget> createState() => _ChoosePageWidgetState();
}

class _ChoosePageWidgetState extends State<ChoosePageWidget> {
  late ChoosePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoosePageModel());

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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '1hs1kg9o' /* Book */,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: FlutterFlowDropDown<TypeTerrain>(
                        controller: _model.selectTypeTerrainValueController ??=
                            FormFieldController<TypeTerrain>(
                          _model.selectTypeTerrainValue ??= null,
                        ),
                        options: List<TypeTerrain>.from(TypeTerrain.values),
                        optionLabels:
                            TypeTerrain.values.map((e) => e.name).toList(),
                        onChanged: (val) async {
                          safeSetState(
                              () => _model.selectTypeTerrainValue = val);
                          _model.typeTerrainLocal =
                              _model.selectTypeTerrainValue;
                          _model.listTerrain =
                              await ClubTerrainTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'type_terrain',
                              _model.typeTerrainLocal?.name,
                            ),
                          );

                          safeSetState(() {});
                        },
                        height: 40.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'm2wtjh88' /* Select... */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor: FlutterFlowTheme.of(context).alternate,
                        elevation: 2.0,
                        borderColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  ),
                  if (_model.listTerrain != null &&
                      (_model.listTerrain)!.isNotEmpty)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: FlutterFlowDropDown<int>(
                          controller: _model.terrainDropDownValueController ??=
                              FormFieldController<int>(
                            _model.terrainDropDownValue ??= null,
                          ),
                          options: List<int>.from(_model.listTerrain!
                              .map((e) => e.terrainId)
                              .withoutNulls
                              .toList()),
                          optionLabels: _model.listTerrain!
                              .map((e) => e.nomComplet)
                              .withoutNulls
                              .toList(),
                          onChanged: (val) async {
                            safeSetState(
                                () => _model.terrainDropDownValue = val);
                            await _model.queryJourDispo(context);
                            safeSetState(() {});
                          },
                          width: 200.0,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'm4we5aeg' /* Select... */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                  Container(
                    height: 80.0,
                    decoration: const BoxDecoration(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          wrapWithModel(
                            model: _model.dayRowModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: DayRowWidget(
                              selectedDayParam: functions
                                  .getDateWithoutTime(getCurrentTimestamp),
                              onSelectDayParam: (dateSelected) async {
                                _model.dateSelectedLocal = dateSelected;
                                _model.jourSemaineSelected =
                                    functions.getJourFromDateTime(dateSelected);
                                await _model.queryJourDispo(context);
                                await _model.queryReservationByTerrainAndDate(
                                  context,
                                  terrainId: _model.terrainDropDownValue,
                                  dateSelected: _model.dateSelectedLocal,
                                );
                                safeSetState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 10.0)).around(const SizedBox(height: 10.0)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        if ((_model.dispoHeureDebutLocal != null) &&
                            (_model.dispoHeureFinLocal != null)) {
                          return wrapWithModel(
                            model: _model.columnHourModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ColumnHourWidget(
                              intervalMinuteParam: 30,
                              dateDebutHeureParam: _model.dispoHeureDebutLocal!,
                              dateFinHeureParam: _model.dispoHeureFinLocal!,
                              heightPixelParam: 60,
                              listReservationParam: _model.listReservationLocal,
                              reservationBuilder:
                                  (ReservationView1Row reservation) =>
                                      ReservationComponentWidget(
                                reservation: reservation,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: const BoxDecoration(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
