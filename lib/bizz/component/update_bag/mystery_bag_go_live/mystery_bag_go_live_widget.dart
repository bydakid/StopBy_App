import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mystery_bag_go_live_model.dart';
export 'mystery_bag_go_live_model.dart';

class MysteryBagGoLiveWidget extends StatefulWidget {
  const MysteryBagGoLiveWidget({
    super.key,
    required this.store,
  });

  final StoreRecord? store;

  @override
  State<MysteryBagGoLiveWidget> createState() => _MysteryBagGoLiveWidgetState();
}

class _MysteryBagGoLiveWidgetState extends State<MysteryBagGoLiveWidget> {
  late MysteryBagGoLiveModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MysteryBagGoLiveModel());

    _model.quantityController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.store?.bag?.quantity?.toString(),
      '0',
    ));
    _model.quantityFocusNode ??= FocusNode();

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

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'uz7rt80e' /* Collect Time */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MYSTERY_BAG_GO_LIVE_Container_nwx4ofwt_O');
                      logFirebaseEvent('Container_bottom_sheet');
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MYSTERY_BAG_GO_LIVE_Container_9085oczj_O');
                      logFirebaseEvent('Container_date_time_picker');
                      await showModalBottomSheet<bool>(
                          context: context,
                          builder: (context) {
                            return ScrollConfiguration(
                              behavior: const MaterialScrollBehavior().copyWith(
                                dragDevices: {
                                  PointerDeviceKind.mouse,
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.stylus,
                                  PointerDeviceKind.unknown
                                },
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width,
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.time,
                                  minimumDate: DateTime(1900),
                                  initialDateTime: getCurrentTimestamp,
                                  maximumDate: DateTime(2050),
                                  use24hFormat: false,
                                  onDateTimeChanged: (newDateTime) =>
                                      safeSetState(() {
                                    _model.datePicked1 = newDateTime;
                                  }),
                                ),
                              ),
                            );
                          });
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 15.0, 10.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    _model.datePicked1,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  '00:00',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '1zgkpylx' /* - */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'MYSTERY_BAG_GO_LIVE_Container_wbou0dje_O');
                      logFirebaseEvent('Container_date_time_picker');
                      await showModalBottomSheet<bool>(
                          context: context,
                          builder: (context) {
                            return ScrollConfiguration(
                              behavior: const MaterialScrollBehavior().copyWith(
                                dragDevices: {
                                  PointerDeviceKind.mouse,
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.stylus,
                                  PointerDeviceKind.unknown
                                },
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width,
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.time,
                                  minimumDate: DateTime(1900),
                                  initialDateTime:
                                      (_model.datePicked2 ?? DateTime.now()),
                                  maximumDate: DateTime(2050),
                                  use24hFormat: false,
                                  onDateTimeChanged: (newDateTime) =>
                                      safeSetState(() {
                                    _model.datePicked2 = newDateTime;
                                  }),
                                ),
                              ),
                            );
                          });
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 15.0, 10.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'Hm',
                                    _model.datePicked2,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  '00:00',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 10.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'mmyk1h7s' /* Quantity */,
                ),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodySmall,
              ),
            ),
            Container(
              width: 400.0,
              child: TextFormField(
                controller: _model.quantityController,
                focusNode: _model.quantityFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.quantityController',
                  Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
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
                validator:
                    _model.quantityControllerValidator.asValidator(context),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 40.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('MYSTERY_BAG_GO_LIVE_GO_LIVE_BTN_ON_TAP');
                    logFirebaseEvent('Button_backend_call');

                    await widget.store!.reference.update(createStoreRecordData(
                      bag: createBagStruct(
                        timeStart: _model.datePicked1,
                        timeEnd: _model.datePicked2,
                        quantity: int.tryParse(_model.quantityController.text),
                        live: true,
                        clearUnsetFields: false,
                      ),
                    ));
                    logFirebaseEvent('Button_bottom_sheet');
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'j82ycftx' /* GO LIVE */,
                  ),
                  options: FFButtonOptions(
                    height: 60.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).accent2,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          color: FlutterFlowTheme.of(context).info,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyLargeFamily),
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  showLoadingIndicator: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
