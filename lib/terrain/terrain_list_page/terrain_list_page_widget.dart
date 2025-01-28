import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/terrain/terrain_card/terrain_card_widget.dart';
import 'package:flutter/material.dart';
import 'terrain_list_page_model.dart';
export 'terrain_list_page_model.dart';

class TerrainListPageWidget extends StatefulWidget {
  const TerrainListPageWidget({
    super.key,
    required this.clubParameter,
  });

  final ClubRow? clubParameter;

  @override
  State<TerrainListPageWidget> createState() => _TerrainListPageWidgetState();
}

class _TerrainListPageWidgetState extends State<TerrainListPageWidget> {
  late TerrainListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TerrainListPageModel());

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
              context.safePop();
            },
          ),
          title: Text(
            widget.clubParameter!.name,
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
          child: StreamBuilder<List<TerrainRow>>(
            stream: _model.listViewSupabaseStream ??= SupaFlow.client
                .from("terrain")
                .stream(primaryKey: ['id'])
                .eqOrNull(
                  'club_id',
                  widget.clubParameter?.id,
                )
                .map((list) => list.map((item) => TerrainRow(item)).toList()),
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
              List<TerrainRow> listViewTerrainRowList = snapshot.data!;

              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  15.0,
                  0,
                  0,
                ),
                scrollDirection: Axis.vertical,
                itemCount: listViewTerrainRowList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewTerrainRow =
                      listViewTerrainRowList[listViewIndex];
                  return wrapWithModel(
                    model: _model.terrainCardModels.getModel(
                      listViewTerrainRow.id.toString(),
                      listViewIndex,
                    ),
                    updateCallback: () => safeSetState(() {}),
                    child: TerrainCardWidget(
                      key: Key(
                        'Keyvo8_${listViewTerrainRow.id.toString()}',
                      ),
                      terrainParameter: listViewTerrainRow,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
