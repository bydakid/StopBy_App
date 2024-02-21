import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'mystery_bag_description_update_widget.dart'
    show MysteryBagDescriptionUpdateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MysteryBagDescriptionUpdateModel
    extends FlutterFlowModel<MysteryBagDescriptionUpdateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nameBag widget.
  FocusNode? nameBagFocusNode;
  TextEditingController? nameBagController;
  String? Function(BuildContext, String?)? nameBagControllerValidator;
  // State field(s) for foodType widget.
  String? foodTypeValue;
  FormFieldController<String>? foodTypeValueController;
  // State field(s) for descriptionBag widget.
  FocusNode? descriptionBagFocusNode;
  TextEditingController? descriptionBagController;
  String? Function(BuildContext, String?)? descriptionBagControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameBagFocusNode?.dispose();
    nameBagController?.dispose();

    descriptionBagFocusNode?.dispose();
    descriptionBagController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
