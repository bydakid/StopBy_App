import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'regi_restau_cont_model.dart';
export 'regi_restau_cont_model.dart';

class RegiRestauContWidget extends StatefulWidget {
  const RegiRestauContWidget({super.key});

  @override
  State<RegiRestauContWidget> createState() => _RegiRestauContWidgetState();
}

class _RegiRestauContWidgetState extends State<RegiRestauContWidget> {
  late RegiRestauContModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegiRestauContModel());

    _model.mailController ??= TextEditingController(text: currentUserEmail);
    _model.mailFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Container(
          width: 400.0,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'c2adbenf' /* Join StopBy and monetize your ... */,
                      ),
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '21nu0scc' /* Embrace sustainability, boost ... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 40.0, 0.0, 10.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'gnebx1rf' /* Type */,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.typeValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'ecrifs5l' /* Meals */,
                      ),
                      FFLocalizations.of(context).getText(
                        'l221sdh5' /* Groceries */,
                      ),
                      FFLocalizations.of(context).getText(
                        'lkj046hi' /* Bread & Pastries */,
                      ),
                      FFLocalizations.of(context).getText(
                        'q8qnuyum' /* Drinks */,
                      ),
                      FFLocalizations.of(context).getText(
                        '7731fyb7' /* Other */,
                      )
                    ],
                    onChanged: (val) => setState(() => _model.typeValue = val),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: FFLocalizations.of(context).getText(
                      't8isa0i7' /* Type */,
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 25.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    elevation: 2.0,
                    borderColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    borderWidth: 2.0,
                    borderRadius: 10.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 12.0, 0.0),
                    hidesUnderline: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'gi5b8oty' /* Email */,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    child: TextFormField(
                      controller: _model.mailController,
                      focusNode: _model.mailFocusNode,
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          _model.mailControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ixgoyqgg' /* Country */,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.countryValueController ??=
                        FormFieldController<String>(
                      _model.countryValue ??=
                          FFLocalizations.of(context).getText(
                        'bprra9sd' /* Malaysia */,
                      ),
                    ),
                    options: [
                      FFLocalizations.of(context).getText(
                        'rejkgn8y' /* Malaysia */,
                      )
                    ],
                    onChanged: (val) =>
                        setState(() => _model.countryValue = val),
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium,
                    hintText: FFLocalizations.of(context).getText(
                      '4j3t5zd8' /* Choose Country */,
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 25.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    elevation: 2.0,
                    borderColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    borderWidth: 2.0,
                    borderRadius: 10.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 12.0, 0.0),
                    hidesUnderline: true,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'at82at4f' /* Phone Number */,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: 100.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.codeValueController ??=
                                FormFieldController<String>(
                              _model.codeValue ??=
                                  FFLocalizations.of(context).getText(
                                'vmhz319d' /* +60 */,
                              ),
                            ),
                            options: [
                              FFLocalizations.of(context).getText(
                                'l451zm8l' /* +60 */,
                              )
                            ],
                            onChanged: (val) =>
                                setState(() => _model.codeValue = val),
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 25.0,
                            ),
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 0.0,
                            borderRadius: 10.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
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
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.phone,
                            validator: _model.textController2Validator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'j5q8fixe' /* Enter your store's name in the... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'f0f2assr' /* Location */,
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ),
                FlutterFlowPlacePicker(
                  iOSGoogleMapsApiKey:
                      'AIzaSyDFZOXgecxYqlyJHbQ9dV53W5M-3Z4xbAg',
                  androidGoogleMapsApiKey:
                      'AIzaSyDFZOXgecxYqlyJHbQ9dV53W5M-3Z4xbAg',
                  webGoogleMapsApiKey:
                      'AIzaSyDFZOXgecxYqlyJHbQ9dV53W5M-3Z4xbAg',
                  onSelect: (place) async {
                    setState(() => _model.placePickerValue = place);
                  },
                  defaultText: FFLocalizations.of(context).getText(
                    '8qx4rb7l' /* Set location */,
                  ),
                  buttonOptions: FFButtonOptions(
                    width: 400.0,
                    height: 60.0,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyLargeFamily),
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 60.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'REGI_RESTAU_CONT_COMP_SIGN_UP_BTN_ON_TAP');
                        if ((_model.typeValue == null ||
                                _model.typeValue == '') ||
                            (_model.codeValue == null ||
                                _model.codeValue == '') ||
                            (_model.countryValue == null ||
                                _model.countryValue == '') ||
                            (_model.mailController.text == null ||
                                _model.mailController.text == '') ||
                            (_model.textController2.text == null ||
                                _model.textController2.text == '') ||
                            (_model.placePickerValue == null)) {
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
                          logFirebaseEvent('Button_update_app_state');
                          setState(() {
                            FFAppState().pageState = 1;
                          });
                        }
                      },
                      text: FFLocalizations.of(context).getText(
                        '7cev6krx' /* Sign Up */,
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
      ),
    );
  }
}
