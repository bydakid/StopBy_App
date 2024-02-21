import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'mystery_bag_go_live_widget.dart' show MysteryBagGoLiveWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MysteryBagGoLiveModel extends FlutterFlowModel<MysteryBagGoLiveWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for quantity widget.
  FocusNode? quantityFocusNode;
  TextEditingController? quantityController;
  String? Function(BuildContext, String?)? quantityControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    quantityFocusNode?.dispose();
    quantityController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
