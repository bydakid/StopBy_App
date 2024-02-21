import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'regi_restau_cont_widget.dart' show RegiRestauContWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegiRestauContModel extends FlutterFlowModel<RegiRestauContWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for type widget.
  String? typeValue;
  FormFieldController<String>? typeValueController;
  // State field(s) for mail widget.
  FocusNode? mailFocusNode;
  TextEditingController? mailController;
  String? Function(BuildContext, String?)? mailControllerValidator;
  // State field(s) for country widget.
  String? countryValue;
  FormFieldController<String>? countryValueController;
  // State field(s) for code widget.
  String? codeValue;
  FormFieldController<String>? codeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    mailFocusNode?.dispose();
    mailController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
