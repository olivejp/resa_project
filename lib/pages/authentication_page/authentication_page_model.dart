import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'authentication_page_widget.dart' show AuthenticationPageWidget;
import 'package:flutter/material.dart';

class AuthenticationPageModel
    extends FlutterFlowModel<AuthenticationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for authentication_nom widget.
  FocusNode? authenticationNomFocusNode;
  TextEditingController? authenticationNomTextController;
  String? Function(BuildContext, String?)?
      authenticationNomTextControllerValidator;
  // State field(s) for authentication_prenom widget.
  FocusNode? authenticationPrenomFocusNode;
  TextEditingController? authenticationPrenomTextController;
  String? Function(BuildContext, String?)?
      authenticationPrenomTextControllerValidator;
  // State field(s) for authentication_email widget.
  FocusNode? authenticationEmailFocusNode;
  TextEditingController? authenticationEmailTextController;
  String? Function(BuildContext, String?)?
      authenticationEmailTextControllerValidator;
  // State field(s) for authentication_password widget.
  FocusNode? authenticationPasswordFocusNode;
  TextEditingController? authenticationPasswordTextController;
  late bool authenticationPasswordVisibility;
  String? Function(BuildContext, String?)?
      authenticationPasswordTextControllerValidator;
  // State field(s) for authentication_password_confirm widget.
  FocusNode? authenticationPasswordConfirmFocusNode;
  TextEditingController? authenticationPasswordConfirmTextController;
  late bool authenticationPasswordConfirmVisibility;
  String? Function(BuildContext, String?)?
      authenticationPasswordConfirmTextControllerValidator;
  // State field(s) for authentication_type widget.
  FormFieldController<String>? authenticationTypeValueController;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UtilisateurRow? userInserted;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    authenticationPasswordVisibility = false;
    authenticationPasswordConfirmVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    authenticationNomFocusNode?.dispose();
    authenticationNomTextController?.dispose();

    authenticationPrenomFocusNode?.dispose();
    authenticationPrenomTextController?.dispose();

    authenticationEmailFocusNode?.dispose();
    authenticationEmailTextController?.dispose();

    authenticationPasswordFocusNode?.dispose();
    authenticationPasswordTextController?.dispose();

    authenticationPasswordConfirmFocusNode?.dispose();
    authenticationPasswordConfirmTextController?.dispose();
  }

  /// Additional helper methods.
  String? get authenticationTypeValue =>
      authenticationTypeValueController?.value;
}
