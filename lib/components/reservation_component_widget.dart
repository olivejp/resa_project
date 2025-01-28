import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'reservation_component_model.dart';
export 'reservation_component_model.dart';

class ReservationComponentWidget extends StatefulWidget {
  const ReservationComponentWidget({
    super.key,
    required this.reservation,
  });

  final ReservationView1Row? reservation;

  @override
  State<ReservationComponentWidget> createState() =>
      _ReservationComponentWidgetState();
}

class _ReservationComponentWidgetState
    extends State<ReservationComponentWidget> {
  late ReservationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReservationComponentModel());

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
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${widget.reservation?.utilisateurNom} ${widget.reservation?.utilisationPrenom}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
