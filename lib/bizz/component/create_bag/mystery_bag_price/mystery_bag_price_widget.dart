import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mystery_bag_price_model.dart';
export 'mystery_bag_price_model.dart';

class MysteryBagPriceWidget extends StatefulWidget {
  const MysteryBagPriceWidget({super.key});

  @override
  State<MysteryBagPriceWidget> createState() => _MysteryBagPriceWidgetState();
}

class _MysteryBagPriceWidgetState extends State<MysteryBagPriceWidget> {
  late MysteryBagPriceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MysteryBagPriceModel());

    _model.cityController ??= TextEditingController();
    _model.cityFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  't92i0a92' /* Price */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '0pwptbr1' /* Decide the cost of your Myster... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 40.0, 0.0, 10.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'r6pubaq8' /* Price - RM */,
                ),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodySmall,
              ),
            ),
            Container(
              width: 400.0,
              child: TextFormField(
                controller: _model.cityController,
                focusNode: _model.cityFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.cityController',
                  Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: FFLocalizations.of(context).getText(
                    'mqjeecy9' /* Set Price */,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                keyboardType: TextInputType.number,
                validator: _model.cityControllerValidator.asValidator(context),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
