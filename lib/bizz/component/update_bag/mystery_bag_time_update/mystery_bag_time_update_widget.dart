import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mystery_bag_time_update_model.dart';
export 'mystery_bag_time_update_model.dart';

class MysteryBagTimeUpdateWidget extends StatefulWidget {
  const MysteryBagTimeUpdateWidget({
    super.key,
    required this.store,
  });

  final StoreRecord? store;

  @override
  State<MysteryBagTimeUpdateWidget> createState() =>
      _MysteryBagTimeUpdateWidgetState();
}

class _MysteryBagTimeUpdateWidgetState
    extends State<MysteryBagTimeUpdateWidget> {
  late MysteryBagTimeUpdateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MysteryBagTimeUpdateModel());

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
                        'fsh62fzm' /* Collect Time */,
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
                          'MYSTERY_BAG_TIME_UPDATE_Container_ij5wmd');
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
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
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
                            'MYSTERY_BAG_TIME_UPDATE_Container_iwnbp8');
                        logFirebaseEvent('Container_date_time_picker');
                        await showModalBottomSheet<bool>(
                            context: context,
                            builder: (context) {
                              return ScrollConfiguration(
                                behavior:
                                    const MaterialScrollBehavior().copyWith(
                                  dragDevices: {
                                    PointerDeviceKind.mouse,
                                    PointerDeviceKind.touch,
                                    PointerDeviceKind.stylus,
                                    PointerDeviceKind.unknown
                                  },
                                ),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
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
                        logFirebaseEvent('Container_backend_call');

                        await widget.store!.reference
                            .update(createStoreRecordData(
                          bag: createBagStruct(
                            timeStart: _model.datePicked1,
                            clearUnsetFields: false,
                          ),
                        ));
                        logFirebaseEvent('Container_bottom_sheet');
                        Navigator.pop(context);
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                                      widget.store?.bag?.timeStart,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '1mgk3f6f' /* - */,
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
                            'MYSTERY_BAG_TIME_UPDATE_Container_7758a2');
                        logFirebaseEvent('Container_date_time_picker');
                        await showModalBottomSheet<bool>(
                            context: context,
                            builder: (context) {
                              return ScrollConfiguration(
                                behavior:
                                    const MaterialScrollBehavior().copyWith(
                                  dragDevices: {
                                    PointerDeviceKind.mouse,
                                    PointerDeviceKind.touch,
                                    PointerDeviceKind.stylus,
                                    PointerDeviceKind.unknown
                                  },
                                ),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
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
                        logFirebaseEvent('Container_backend_call');

                        await widget.store!.reference
                            .update(createStoreRecordData(
                          bag: createBagStruct(
                            timeEnd: _model.datePicked2,
                            clearUnsetFields: false,
                          ),
                        ));
                        logFirebaseEvent('Container_bottom_sheet');
                        Navigator.pop(context);
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                                      widget.store?.bag?.timeEnd,
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
            ),
          ],
        ),
      ),
    );
  }
}
