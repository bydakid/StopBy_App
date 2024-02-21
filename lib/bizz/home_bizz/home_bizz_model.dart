import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bizz/component/extra/order_picked_up/order_picked_up_widget.dart';
import '/bizz/component/extra/tips_resources/tips_resources_widget.dart';
import '/bizz/component/extra/verification/verification_widget.dart';
import '/bizz/component/update_bag/mystery_bag_description_update/mystery_bag_description_update_widget.dart';
import '/bizz/component/update_bag/mystery_bag_go_live/mystery_bag_go_live_widget.dart';
import '/bizz/component/update_bag/mystery_bag_picture_update/mystery_bag_picture_update_widget.dart';
import '/bizz/component/update_bag/mystery_bag_price_update/mystery_bag_price_update_widget.dart';
import '/bizz/component/update_bag/mystery_bag_time_update/mystery_bag_time_update_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'home_bizz_widget.dart' show HomeBizzWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeBizzModel extends FlutterFlowModel<HomeBizzWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Model for tipsResources component.
  late TipsResourcesModel tipsResourcesModel;
  // Model for verification component.
  late VerificationModel verificationModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    tipsResourcesModel = createModel(context, () => TipsResourcesModel());
    verificationModel = createModel(context, () => VerificationModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tipsResourcesModel.dispose();
    verificationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
