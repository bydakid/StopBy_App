import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bizz/component/registration_bizz/regi_restau_cont/regi_restau_cont_widget.dart';
import '/bizz/component/registration_bizz/regi_restau_cont2/regi_restau_cont2_widget.dart';
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
import 'register_store_model.dart';
export 'register_store_model.dart';

class RegisterStoreWidget extends StatefulWidget {
  const RegisterStoreWidget({super.key});

  @override
  State<RegisterStoreWidget> createState() => _RegisterStoreWidgetState();
}

class _RegisterStoreWidgetState extends State<RegisterStoreWidget> {
  late RegisterStoreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterStoreModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Register_store'});
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
                    logFirebaseEvent(
                        'REGISTER_STORE_Container_o6690gel_ON_TAP');
                    logFirebaseEvent('Container_update_app_state');
                    setState(() {
                      FFAppState().pageState = 0;
                    });
                    logFirebaseEvent('Container_navigate_back');
                    context.pop();
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
                          'bm8i11bj' /* Sign up your business */,
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
            mainAxisSize: MainAxisSize.max,
            children: [
              if (FFAppState().pageState == 0)
                wrapWithModel(
                  model: _model.regiRestauContModel,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: RegiRestauContWidget(),
                ),
              if (FFAppState().pageState == 1)
                wrapWithModel(
                  model: _model.regiRestauCont2Model,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: RegiRestauCont2Widget(
                    location: _model.regiRestauContModel.placePickerValue,
                  ),
                ),
              if (FFAppState().pageState == 1)
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 60.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'REGISTER_STORE_PAGE_SIGN_UP_BTN_ON_TAP');
                        if ((_model.regiRestauCont2Model.nameController.text == null || _model.regiRestauCont2Model.nameController.text == '') ||
                            (_model.regiRestauCont2Model.textController2.text ==
                                    null ||
                                _model.regiRestauCont2Model.textController2
                                        .text ==
                                    '') ||
                            (_model.regiRestauCont2Model.cityController.text ==
                                    null ||
                                _model.regiRestauCont2Model.cityController
                                        .text ==
                                    '') ||
                            (_model.regiRestauCont2Model.zipController.text ==
                                    null ||
                                _model.regiRestauCont2Model.zipController
                                        .text ==
                                    '')) {
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

                          var storeRecordReference =
                              StoreRecord.collection.doc();
                          await storeRecordReference.set(createStoreRecordData(
                            storeType: _model.regiRestauContModel.typeValue,
                            country: _model.regiRestauContModel.countryValue,
                            location: createLocationBagStruct(
                              city: _model
                                  .regiRestauCont2Model.cityController.text,
                              name: _model
                                  .regiRestauCont2Model.nameController.text,
                              zipcode: _model
                                  .regiRestauCont2Model.zipController.text,
                              address: _model
                                  .regiRestauCont2Model.textController2.text,
                              clearUnsetFields: false,
                              create: true,
                            ),
                            latLng: _model
                                .regiRestauContModel.placePickerValue.latLng,
                            user: currentUserReference,
                            phone:
                                '${_model.regiRestauContModel.codeValue}${_model.regiRestauContModel.textController2.text}',
                            email:
                                _model.regiRestauContModel.mailController.text,
                            verified: createVerifiedStruct(
                              verified: false,
                              blacklist: false,
                              completeProfiel: false,
                              clearUnsetFields: false,
                              create: true,
                            ),
                            features: createFeaturesStruct(
                              mysteryBag: false,
                              worldMenu: false,
                              saleMenu: false,
                              clearUnsetFields: false,
                              create: true,
                            ),
                            openOrder: 0,
                          ));
                          _model.store = StoreRecord.getDocumentFromData(
                              createStoreRecordData(
                                storeType: _model.regiRestauContModel.typeValue,
                                country:
                                    _model.regiRestauContModel.countryValue,
                                location: createLocationBagStruct(
                                  city: _model
                                      .regiRestauCont2Model.cityController.text,
                                  name: _model
                                      .regiRestauCont2Model.nameController.text,
                                  zipcode: _model
                                      .regiRestauCont2Model.zipController.text,
                                  address: _model.regiRestauCont2Model
                                      .textController2.text,
                                  clearUnsetFields: false,
                                  create: true,
                                ),
                                latLng: _model.regiRestauContModel
                                    .placePickerValue.latLng,
                                user: currentUserReference,
                                phone:
                                    '${_model.regiRestauContModel.codeValue}${_model.regiRestauContModel.textController2.text}',
                                email: _model
                                    .regiRestauContModel.mailController.text,
                                verified: createVerifiedStruct(
                                  verified: false,
                                  blacklist: false,
                                  completeProfiel: false,
                                  clearUnsetFields: false,
                                  create: true,
                                ),
                                features: createFeaturesStruct(
                                  mysteryBag: false,
                                  worldMenu: false,
                                  saleMenu: false,
                                  clearUnsetFields: false,
                                  create: true,
                                ),
                                openOrder: 0,
                              ),
                              storeRecordReference);
                          logFirebaseEvent('Button_backend_call');

                          await currentUserReference!
                              .update(createUserRecordData(
                            email:
                                _model.regiRestauContModel.mailController.text,
                            displayName:
                                _model.regiRestauCont2Model.nameController.text,
                            bizz: true,
                            phoneNumber:
                                '${_model.regiRestauContModel.codeValue}${_model.regiRestauContModel.textController2.text}',
                          ));
                          logFirebaseEvent('Button_update_app_state');
                          setState(() {
                            FFAppState().pageState = 0;
                          });
                          logFirebaseEvent('Button_navigate_to');

                          context.pushNamed('homeBizz');
                        }

                        setState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        '7ru0q8ht' /* Sign Up */,
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
