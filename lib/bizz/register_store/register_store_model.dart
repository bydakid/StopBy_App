import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bizz/component/registration_bizz/regi_restau_cont/regi_restau_cont_widget.dart';
import '/bizz/component/registration_bizz/regi_restau_cont2/regi_restau_cont2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'register_store_widget.dart' show RegisterStoreWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterStoreModel extends FlutterFlowModel<RegisterStoreWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for regiRestauCont component.
  late RegiRestauContModel regiRestauContModel;
  // Model for regiRestauCont2 component.
  late RegiRestauCont2Model regiRestauCont2Model;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  StoreRecord? store;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    regiRestauContModel = createModel(context, () => RegiRestauContModel());
    regiRestauCont2Model = createModel(context, () => RegiRestauCont2Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    regiRestauContModel.dispose();
    regiRestauCont2Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
