import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profil_page_widget.dart' show ProfilPageWidget;
import 'package:flutter/material.dart';

class ProfilPageModel extends FlutterFlowModel<ProfilPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in imageBorder widget.
  List<UtilisateurRow>? listUserUpdated;
  // State field(s) for tf_nom widget.
  FocusNode? tfNomFocusNode;
  TextEditingController? tfNomTextController;
  String? Function(BuildContext, String?)? tfNomTextControllerValidator;
  // State field(s) for tf_prenom widget.
  FocusNode? tfPrenomFocusNode;
  TextEditingController? tfPrenomTextController;
  String? Function(BuildContext, String?)? tfPrenomTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tfNomFocusNode?.dispose();
    tfNomTextController?.dispose();

    tfPrenomFocusNode?.dispose();
    tfPrenomTextController?.dispose();
  }
}
