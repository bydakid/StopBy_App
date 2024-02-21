import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bizz/component/registration_bizz/complete_bizz_profiel/complete_bizz_profiel_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'complet_bizz_profiel_widget.dart' show CompletBizzProfielWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompletBizzProfielModel
    extends FlutterFlowModel<CompletBizzProfielWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for completeBizzProfiel component.
  late CompleteBizzProfielModel completeBizzProfielModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    completeBizzProfielModel =
        createModel(context, () => CompleteBizzProfielModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    completeBizzProfielModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
