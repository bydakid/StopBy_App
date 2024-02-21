import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sale/store/order_confirmation/order_confirmation_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'payment_tab_widget.dart' show PaymentTabWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentTabModel extends FlutterFlowModel<PaymentTabWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Stripe Payment] action in sg widget.
  String? paymentId;
  // Stores action output result for [Backend Call - Create Document] action in sg widget.
  OrdersRecord? orderNumberSG;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
