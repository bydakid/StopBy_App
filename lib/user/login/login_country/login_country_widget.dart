import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_country_model.dart';
export 'login_country_model.dart';

class LoginCountryWidget extends StatefulWidget {
  const LoginCountryWidget({super.key});

  @override
  State<LoginCountryWidget> createState() => _LoginCountryWidgetState();
}

class _LoginCountryWidgetState extends State<LoginCountryWidget> {
  late LoginCountryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginCountryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Login_Country'});
    _model.nameController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.nameFocusNode ??= FocusNode();

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
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: 400.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: AutoSizeText(
                              FFLocalizations.of(context).getText(
                                'wvug2ezt' /* Let's get started */,
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleLargeFamily,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleLargeFamily),
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 40.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'rpkld5si' /* Username */,
                              ),
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 20.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  width: 1.0,
                                ),
                              ),
                              child: AuthUserStreamWidget(
                                builder: (context) => TextFormField(
                                  controller: _model.nameController,
                                  focusNode: _model.nameFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.nameController',
                                    Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  textCapitalization: TextCapitalization.words,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  keyboardType: TextInputType.name,
                                  validator: _model.nameControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '9ujlikme' /* Country */,
                              ),
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 20.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  width: 1.0,
                                ),
                              ),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue ??=
                                      FFLocalizations.of(context).getText(
                                    'fxn2w140' /* Malaysia */,
                                  ),
                                ),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'ixmwbb68' /* Malaysia */,
                                  )
                                ],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue = val),
                                width: double.infinity,
                                height: 40.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: FFLocalizations.of(context).getText(
                                  '447z0bxi' /* Select Country */,
                                ),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 25.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'sjqpqaxx' /* Language */,
                              ),
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: FlutterFlowLanguageSelector(
                            width: double.infinity,
                            height: 50.0,
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dropdownIconColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            borderRadius: 10.0,
                            textStyle: FlutterFlowTheme.of(context).bodyMedium,
                            hideFlags: true,
                            flagSize: 25.0,
                            flagTextGap: 10.0,
                            currentLanguage:
                                FFLocalizations.of(context).languageCode,
                            languages: FFLocalizations.languages(),
                            onChanged: (lang) => setAppLanguage(context, lang),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 40.0, 20.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: ((_model.dropDownValue == null ||
                                        _model.dropDownValue == '') ||
                                    (_model.nameController.text == null ||
                                        _model.nameController.text == ''))
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'LOGIN_COUNTRY_PAGE_CONTINUE_BTN_ON_TAP');
                                    logFirebaseEvent('Button_backend_call');

                                    await currentUserReference!
                                        .update(createUserRecordData(
                                      country: _model.dropDownValue,
                                      displayName: _model.nameController.text,
                                    ));
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'home',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.bottomToTop,
                                        ),
                                      },
                                    );
                                  },
                            text: FFLocalizations.of(context).getText(
                              'rwundztx' /* Continue */,
                            ),
                            options: FFButtonOptions(
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 0.0, 40.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).accent1,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyLargeFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyLargeFamily),
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                              disabledColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              disabledTextColor:
                                  FlutterFlowTheme.of(context).success,
                            ),
                            showLoadingIndicator: false,
                          ),
                        ),
                      ],
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
