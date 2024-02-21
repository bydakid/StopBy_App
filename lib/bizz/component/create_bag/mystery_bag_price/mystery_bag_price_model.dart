import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mystery_bag_price_widget.dart' show MysteryBagPriceWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MysteryBagPriceModel extends FlutterFlowModel<MysteryBagPriceWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cityFocusNode?.dispose();
    cityController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
