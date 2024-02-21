import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bizz/component/create_bag/mystery_bag_description/mystery_bag_description_widget.dart';
import '/bizz/component/create_bag/mystery_bag_info/mystery_bag_info_widget.dart';
import '/bizz/component/create_bag/mystery_bag_price/mystery_bag_price_widget.dart';
import '/bizz/component/create_bag/mystery_bag_time_quantity/mystery_bag_time_quantity_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_bag_bizz_model.dart';
export 'add_bag_bizz_model.dart';

class AddBagBizzWidget extends StatefulWidget {
  const AddBagBizzWidget({
    super.key,
    required this.store,
  });

  final DocumentReference? store;

  @override
  State<AddBagBizzWidget> createState() => _AddBagBizzWidgetState();
}

class _AddBagBizzWidgetState extends State<AddBagBizzWidget> {
  late AddBagBizzModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddBagBizzModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'addBagBizz'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('ADD_BAG_BIZZ_Container_712t1pmu_ON_TAP');
                    logFirebaseEvent('Container_update_app_state');
                    setState(() {
                      FFAppState().pageState = 0;
                    });
                    logFirebaseEvent('Container_navigate_back');
                    context.safePop();
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                      child: AutoSizeText(
                        FFLocalizations.of(context).getText(
                          'r4aojoos' /* Mystery Bag */,
                        ),
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleLargeFamily,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleLargeFamily),
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.5,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (FFAppState().pageState == 0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: wrapWithModel(
                    model: _model.mysteryBagInfoModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: MysteryBagInfoWidget(),
                  ),
                ),
              if (FFAppState().pageState == 1)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: wrapWithModel(
                    model: _model.mysteryBagDescriptionModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: MysteryBagDescriptionWidget(),
                  ),
                ),
              if (FFAppState().pageState == 2)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: wrapWithModel(
                    model: _model.mysteryBagTimeQuantityModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: MysteryBagTimeQuantityWidget(),
                  ),
                ),
              if (FFAppState().pageState == 3)
                wrapWithModel(
                  model: _model.mysteryBagPriceModel,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: MysteryBagPriceWidget(),
                ),
              if (FFAppState().pageState == 3)
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 60.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'ADD_BAG_BIZZ_PAGE_GO_LIVE_BTN_ON_TAP');
                        if (_model.mysteryBagPriceModel.cityController.text ==
                                null ||
                            _model.mysteryBagPriceModel.cityController.text ==
                                '') {
                          logFirebaseEvent('Button_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Values missing',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          );
                        } else {
                          logFirebaseEvent('Button_backend_call');

                          await widget.store!.update(createStoreRecordData(
                            bag: createBagStruct(
                              quantity: int.tryParse(_model
                                  .mysteryBagTimeQuantityModel
                                  .quantityController
                                  .text),
                              timeStart: _model
                                  .mysteryBagTimeQuantityModel.datePicked1,
                              timeEnd: _model
                                  .mysteryBagTimeQuantityModel.datePicked2,
                              name: _model.mysteryBagDescriptionModel
                                  .nameBagController.text,
                              description: _model.mysteryBagDescriptionModel
                                  .descriptionBagController.text,
                              price: double.tryParse(_model
                                  .mysteryBagPriceModel.cityController.text),
                              live: true,
                              foodType: _model
                                  .mysteryBagDescriptionModel.foodTypeValue,
                              clearUnsetFields: false,
                            ),
                            features: createFeaturesStruct(
                              mysteryBag: true,
                              clearUnsetFields: false,
                            ),
                          ));
                          logFirebaseEvent('Button_update_app_state');
                          setState(() {
                            FFAppState().pageState = 0;
                          });
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('homeBizz');
                        }
                      },
                      text: FFLocalizations.of(context).getText(
                        '84sqd57r' /* GO LIVE */,
                      ),
                      options: FFButtonOptions(
                        height: 60.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).accent1,
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
                      ),
                      showLoadingIndicator: false,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
