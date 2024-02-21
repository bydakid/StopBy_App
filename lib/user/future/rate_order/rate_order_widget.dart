import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rate_order_model.dart';
export 'rate_order_model.dart';

class RateOrderWidget extends StatefulWidget {
  const RateOrderWidget({
    super.key,
    required this.order,
    required this.store,
  });

  final OrdersRecord? order;
  final StoreRecord? store;

  @override
  State<RateOrderWidget> createState() => _RateOrderWidgetState();
}

class _RateOrderWidgetState extends State<RateOrderWidget>
    with TickerProviderStateMixin {
  late RateOrderModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(2.0, 2.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RateOrderModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: FFLocalizations.of(context).getText(
                          'k5s4xutt' /* How was your experience with  */,
                        ),
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: valueOrDefault<String>(
                          widget.store?.location?.name,
                          'Store',
                        ),
                        style: TextStyle(),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleLargeFamily,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleLargeFamily),
                        ),
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: const CircleBorder(),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.25,
                      height: MediaQuery.sizeOf(context).width * 0.25,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            valueOrDefault<String>(
                              widget.store?.logo,
                              'logo',
                            ),
                          ).image,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                RatingBar.builder(
                  onRatingUpdate: (newValue) =>
                      setState(() => _model.ratingBarValue = newValue),
                  itemBuilder: (context, index) => Icon(
                    Icons.star_rounded,
                    color: FlutterFlowTheme.of(context).tertiary,
                  ),
                  direction: Axis.horizontal,
                  initialRating: _model.ratingBarValue ??= 0.0,
                  unratedColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  itemCount: 5,
                  itemPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                  itemSize: 40.0,
                  glowColor: FlutterFlowTheme.of(context).tertiary,
                ),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: (_model.ratingBarValue == null)
                          ? null
                          : () async {
                              logFirebaseEvent(
                                  'RATE_ORDER_COMP_RATE_ORDER_BTN_ON_TAP');
                              logFirebaseEvent('Button_backend_call');

                              await widget.store!.reference
                                  .update(createStoreRecordData(
                                rating: createRatingStruct(
                                  fieldValues: {
                                    'total': FieldValue.increment(
                                        _model.ratingBarValue!.round()),
                                    'count': FieldValue.increment(1),
                                  },
                                  clearUnsetFields: false,
                                ),
                              ));
                              logFirebaseEvent('Button_backend_call');

                              await widget.order!.reference
                                  .update(createOrdersRecordData());
                              logFirebaseEvent('Button_bottom_sheet');
                              Navigator.pop(context);
                            },
                      text: FFLocalizations.of(context).getText(
                        'emgty4sb' /* Rate order */,
                      ),
                      options: FFButtonOptions(
                        height: 60.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyLarge
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyLargeFamily),
                            ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                        disabledColor: FlutterFlowTheme.of(context).tertiary,
                        disabledTextColor:
                            FlutterFlowTheme.of(context).secondaryText,
                      ),
                      showLoadingIndicator: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
