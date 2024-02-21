import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sale/store/order_confirmation/order_confirmation_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_tab_model.dart';
export 'payment_tab_model.dart';

class PaymentTabWidget extends StatefulWidget {
  const PaymentTabWidget({
    super.key,
    required this.store,
  });

  final StoreRecord? store;

  @override
  State<PaymentTabWidget> createState() => _PaymentTabWidgetState();
}

class _PaymentTabWidgetState extends State<PaymentTabWidget> {
  late PaymentTabModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentTabModel());

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
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.store?.location?.name,
                    'name',
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: Icon(
                      Icons.access_time_filled,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 30.0,
                    ),
                  ),
                  Flexible(
                    child: RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'kmq7kv62' /* Collect today at  */,
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              dateTimeFormat(
                                'Hm',
                                widget.store?.bag?.timeStart,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              '00:00',
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'qxfeivew' /*  -  */,
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              dateTimeFormat(
                                'Hm',
                                widget.store?.bag?.timeEnd,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              '00:00',
                            ),
                            style: TextStyle(),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                    child: Icon(
                      Icons.payments,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 30.0,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '9d595pp4' /* Make the reservation fee payme... */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ogwqzroe' /* Select quantity */,
                  ),
                  textAlign: TextAlign.center,
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
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: FlutterFlowCountController(
                    decrementIconBuilder: (enabled) => FaIcon(
                      FontAwesomeIcons.minusCircle,
                      color: enabled
                          ? FlutterFlowTheme.of(context).secondaryText
                          : FlutterFlowTheme.of(context).secondaryText,
                      size: 35.0,
                    ),
                    incrementIconBuilder: (enabled) => FaIcon(
                      FontAwesomeIcons.plusCircle,
                      color: enabled
                          ? FlutterFlowTheme.of(context).accent1
                          : FlutterFlowTheme.of(context).secondaryText,
                      size: 35.0,
                    ),
                    countBuilder: (count) => Text(
                      count.toString(),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).displaySmallFamily,
                            fontWeight: FontWeight.w800,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .displaySmallFamily),
                          ),
                    ),
                    count: _model.countControllerValue ??= 1,
                    updateCount: (count) async {
                      setState(() => _model.countControllerValue = count);
                      logFirebaseEvent(
                          'PAYMENT_TAB_CountController_x3w3kryk_ON_');
                      logFirebaseEvent('CountController_update_app_state');
                      setState(() {});
                    },
                    stepSize: 1,
                    minimum: 1,
                    maximum: 10,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'qgniaksz' /* By reserving this meal you agr... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'tw2s5o21' /* Mystery Bag */,
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
                                'dvrr5nc9' /* RM  */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                formatNumber(
                                  ((valueOrDefault<double>(
                                                widget.store?.bag?.price,
                                                0.0,
                                              ) *
                                              (_model.countControllerValue!)) /
                                          3)
                                      .toInt(),
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '8w1re62z' /* Reservation fee */,
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
                                '8rfdlk30' /* RM  */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                formatNumber(
                                  ((((valueOrDefault<double>(
                                                        widget
                                                            .store?.bag?.price,
                                                        0.0,
                                                      ) *
                                                      (_model
                                                          .countControllerValue!)) /
                                                  10) /
                                              3) +
                                          2)
                                      .toInt(),
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '7iugofin' /* Total */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyLargeFamily),
                        ),
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
                                'yp9f1gzi' /* RM  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            TextSpan(
                              text: valueOrDefault<String>(
                                formatNumber(
                                  (((valueOrDefault<double>(
                                                    widget.store?.bag?.price,
                                                    0.0,
                                                  ) *
                                                  (_model
                                                      .countControllerValue!)) /
                                              3) +
                                          ((((valueOrDefault<double>(
                                                            widget.store?.bag
                                                                ?.price,
                                                            0.0,
                                                          ) *
                                                          (_model
                                                              .countControllerValue!)) /
                                                      3) /
                                                  10) +
                                              2))
                                      .toInt(),
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                ),
                                '0',
                              ),
                              style: TextStyle(),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyLargeFamily,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyLargeFamily),
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: (widget.store!.bag.quantity <
                          _model.countControllerValue!)
                      ? null
                      : () async {
                          logFirebaseEvent('PAYMENT_TAB_COMP_sg_ON_TAP');
                          var _shouldSetState = false;
                          logFirebaseEvent('sg_stripe_payment');
                          final paymentResponse = await processStripePayment(
                            context,
                            amount: valueOrDefault<int>(
                              ((((valueOrDefault<double>(
                                                        widget
                                                            .store?.bag?.price,
                                                        0.0,
                                                      ) *
                                                      (_model
                                                          .countControllerValue!)) /
                                                  10) /
                                              3) +
                                          2)
                                      .toInt() *
                                  100,
                              200,
                            ),
                            currency: 'MYR',
                            customerEmail: currentUserEmail,
                            customerName: valueOrDefault<String>(
                              currentUserDisplayName,
                              'None',
                            ),
                            description: 'StopBy - Mystery Bag Reservation',
                            allowGooglePay: true,
                            allowApplePay: true,
                            themeStyle: ThemeMode.system,
                            buttonColor: FlutterFlowTheme.of(context).accent1,
                            buttonTextColor: FlutterFlowTheme.of(context).info,
                          );
                          if (paymentResponse.paymentId == null &&
                              paymentResponse.errorMessage != null) {
                            showSnackbar(
                              context,
                              'Error: ${paymentResponse.errorMessage}',
                            );
                          }
                          _model.paymentId = paymentResponse.paymentId ?? '';

                          _shouldSetState = true;
                          if (_model.paymentId != null &&
                              _model.paymentId != '') {
                            logFirebaseEvent('sg_backend_call');

                            var ordersRecordReference =
                                OrdersRecord.collection.doc();
                            await ordersRecordReference
                                .set(createOrdersRecordData(
                              quantity: _model.countControllerValue,
                              pickedUp: false,
                              userRef: currentUserReference,
                              storeRefx: widget.store?.reference,
                              time: getCurrentTimestamp,
                              userName: valueOrDefault<String>(
                                currentUserDisplayName,
                                'User',
                              ),
                              priceToPay: valueOrDefault<double>(
                                (valueOrDefault<double>(
                                          widget.store?.bag?.price,
                                          0.0,
                                        ) *
                                        (_model.countControllerValue!)) /
                                    3,
                                0.0,
                              ),
                              numberOrder: random_data.randomInteger(1, 100000),
                            ));
                            _model.orderNumberSG =
                                OrdersRecord.getDocumentFromData(
                                    createOrdersRecordData(
                                      quantity: _model.countControllerValue,
                                      pickedUp: false,
                                      userRef: currentUserReference,
                                      storeRefx: widget.store?.reference,
                                      time: getCurrentTimestamp,
                                      userName: valueOrDefault<String>(
                                        currentUserDisplayName,
                                        'User',
                                      ),
                                      priceToPay: valueOrDefault<double>(
                                        (valueOrDefault<double>(
                                                  widget.store?.bag?.price,
                                                  0.0,
                                                ) *
                                                (_model
                                                    .countControllerValue!)) /
                                            3,
                                        0.0,
                                      ),
                                      numberOrder:
                                          random_data.randomInteger(1, 100000),
                                    ),
                                    ordersRecordReference);
                            _shouldSetState = true;
                            logFirebaseEvent('sg_backend_call');

                            await widget.store!.reference.update({
                              ...createStoreRecordData(
                                bag: createBagStruct(
                                  fieldValues: {
                                    'quantity': FieldValue.increment(
                                        -(_model.countControllerValue!)),
                                  },
                                  clearUnsetFields: false,
                                ),
                              ),
                              ...mapToFirestore(
                                {
                                  'openOrder': FieldValue.increment(1),
                                },
                              ),
                            });
                            logFirebaseEvent('sg_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: OrderConfirmationWidget(
                                    order: _model.orderNumberSG!,
                                    store: widget.store!,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          } else {
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_shouldSetState) setState(() {});
                        },
                  text: FFLocalizations.of(context).getText(
                    'hgxhtfzc' /* Reserve Now */,
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.creditCard,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsets.all(0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    color: FlutterFlowTheme.of(context).accent1,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleLargeFamily,
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleLargeFamily),
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
    );
  }
}
