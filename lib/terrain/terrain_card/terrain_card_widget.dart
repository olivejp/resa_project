import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'terrain_card_model.dart';
export 'terrain_card_model.dart';

class TerrainCardWidget extends StatefulWidget {
  const TerrainCardWidget({
    super.key,
    required this.terrainParameter,
  });

  final TerrainRow? terrainParameter;

  @override
  State<TerrainCardWidget> createState() => _TerrainCardWidgetState();
}

class _TerrainCardWidgetState extends State<TerrainCardWidget> {
  late TerrainCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TerrainCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            widget.terrainParameter!.name,
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ),
    );
  }
}
