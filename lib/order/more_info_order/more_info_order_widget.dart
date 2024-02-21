import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'more_info_order_model.dart';
export 'more_info_order_model.dart';

class MoreInfoOrderWidget extends StatefulWidget {
  const MoreInfoOrderWidget({
    super.key,
    required this.store,
    required this.order,
  });

  final StoreRecord? store;
  final OrdersRecord? order;

  @override
  State<MoreInfoOrderWidget> createState() => _MoreInfoOrderWidgetState();
}

class _MoreInfoOrderWidgetState extends State<MoreInfoOrderWidget> {
  late MoreInfoOrderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreInfoOrderModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
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
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: RichText(
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          't2551wob' /* Order Number:  */,
                        ),
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'ry1fox8t' /* # */,
                        ),
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget.order?.numberOrder?.toString(),
                          '0',
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyLargeFamily),
                            ),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            if (widget.order?.pickedUp == false)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 10.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '9k1hjri9' /* Order picked up: */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyLargeFamily),
                        ),
                  ),
                ),
              ),
            if (widget.order?.pickedUp == true)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '8zztv3g9' /* Order has been picked up */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyLargeFamily),
                        ),
                  ),
                ),
              ),
            if (widget.order?.pickedUp == false)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('MORE_INFO_ORDER_COMP_YES_BTN_ON_TAP');
                    logFirebaseEvent('Button_backend_call');

                    await widget.order!.reference.update(createOrdersRecordData(
                      pickedUp: true,
                    ));
                    logFirebaseEvent('Button_backend_call');

                    await widget.store!.reference.update({
                      ...mapToFirestore(
                        {
                          'openOrder': FieldValue.increment(-(1)),
                        },
                      ),
                    });
                    logFirebaseEvent('Button_navigate_to');

                    context.pushNamed('order_collected');
                  },
                  text: FFLocalizations.of(context).getText(
                    'bfec7ike' /* YES */,
                  ),
                  options: FFButtonOptions(
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).accent1,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontWeight: FontWeight.bold,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '6sipupmr' /* Order */,
                ),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleLargeFamily),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '922wpo95' /* Mystery Bag */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: RichText(
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '2ginxspn' /* RM  */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                formatNumber(
                                  valueOrDefault<double>(
                                    widget.order?.priceToPay,
                                    0.0,
                                  ).toInt(),
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                ),
                                '0',
                              ),
                              style: TextStyle(),
                            )
                          ],
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'k2to69xc' /* Location */,
                ),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).titleLargeFamily,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleLargeFamily),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_pin,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 25.0,
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: SelectionArea(
                          child: Text(
                        valueOrDefault<String>(
                          widget.store?.location?.address,
                          'Address',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MORE_INFO_ORDER_Container_ryumx3nu_ON_TA');
                  logFirebaseEvent('Container_launch_map');
                  await launchMap(
                    mapType: $ml.MapType.apple,
                    address: widget.store?.location?.address,
                    title: '',
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'duc4yols' /* Open in Apple Maps */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyLargeFamily),
                          ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MORE_INFO_ORDER_Container_umicwk5v_ON_TA');
                  logFirebaseEvent('Container_launch_map');
                  await launchMap(
                    mapType: $ml.MapType.google,
                    address: widget.store?.location?.address,
                    title: '',
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '9x0we0eo' /* Open in Google Maps */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyLargeFamily),
                          ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 40.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('MORE_INFO_ORDER_Container_oxefu99x_ON_TA');
                  logFirebaseEvent('Container_launch_map');
                  await launchMap(
                    mapType: $ml.MapType.waze,
                    address: widget.store?.location?.address,
                    title: '',
                  );
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'qnwbehp1' /* Open in Waze */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyLargeFamily),
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
