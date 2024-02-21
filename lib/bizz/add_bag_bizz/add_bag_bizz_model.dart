import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bizz/component/create_bag/mystery_bag_description/mystery_bag_description_widget.dart';
import '/bizz/component/create_bag/mystery_bag_info/mystery_bag_info_widget.dart';
import '/bizz/component/create_bag/mystery_bag_price/mystery_bag_price_widget.dart';
import '/bizz/component/create_bag/mystery_bag_time_quantity/mystery_bag_time_quantity_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_bag_bizz_widget.dart' show AddBagBizzWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddBagBizzModel extends FlutterFlowModel<AddBagBizzWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for mysteryBagInfo component.
  late MysteryBagInfoModel mysteryBagInfoModel;
  // Model for mysteryBagDescription component.
  late MysteryBagDescriptionModel mysteryBagDescriptionModel;
  // Model for mysteryBagTimeQuantity component.
  late MysteryBagTimeQuantityModel mysteryBagTimeQuantityModel;
  // Model for mysteryBagPrice component.
  late MysteryBagPriceModel mysteryBagPriceModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mysteryBagInfoModel = createModel(context, () => MysteryBagInfoModel());
    mysteryBagDescriptionModel =
        createModel(context, () => MysteryBagDescriptionModel());
    mysteryBagTimeQuantityModel =
        createModel(context, () => MysteryBagTimeQuantityModel());
    mysteryBagPriceModel = createModel(context, () => MysteryBagPriceModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mysteryBagInfoModel.dispose();
    mysteryBagDescriptionModel.dispose();
    mysteryBagTimeQuantityModel.dispose();
    mysteryBagPriceModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
