import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/club/club_list/club_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('ChoosePage');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: FaIcon(
            FontAwesomeIcons.solidCalendarPlus,
            color: FlutterFlowTheme.of(context).info,
            size: 24.0,
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '5anup5c5' /* Home */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              StreamBuilder<List<UtilisateurRow>>(
                stream: _model.circleImageSupabaseStream ??= SupaFlow.client
                    .from("utilisateur")
                    .stream(primaryKey: ['id'])
                    .eqOrNull(
                      'email',
                      currentUserEmail,
                    )
                    .map((list) =>
                        list.map((item) => UtilisateurRow(item)).toList()),
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
                  List<UtilisateurRow> circleImageUtilisateurRowList =
                      snapshot.data!;

                  final circleImageUtilisateurRow =
                      circleImageUtilisateurRowList.isNotEmpty
                          ? circleImageUtilisateurRowList.first
                          : null;

                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('ProfilPage');
                    },
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        circleImageUtilisateurRow?.photoUrl != null &&
                                circleImageUtilisateurRow?.photoUrl != ''
                            ? circleImageUtilisateurRow!.photoUrl!
                            : 'https://picsum.photos/seed/967/600',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<ClubRow>>(
                  stream: _model.containerSupabaseStream ??= SupaFlow.client
                      .from("club")
                      .stream(primaryKey: ['id']).map(
                          (list) => list.map((item) => ClubRow(item)).toList()),
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
                    List<ClubRow> containerClubRowList = snapshot.data!;

                    return Container(
                      decoration: const BoxDecoration(),
                      child: wrapWithModel(
                        model: _model.clubListModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ClubListWidget(
                          clubList: containerClubRowList,
                          onClubTap: (club) async {
                            context.pushNamed(
                              'TerrainListPage',
                              queryParameters: {
                                'clubParameter': serializeParam(
                                  club,
                                  ParamType.SupabaseRow,
                                ),
                              }.withoutNulls,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
