import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bizz/component/registration_bizz/complete_bizz_profiel/complete_bizz_profiel_widget.dart';
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
import 'complet_bizz_profiel_model.dart';
export 'complet_bizz_profiel_model.dart';

class CompletBizzProfielWidget extends StatefulWidget {
  const CompletBizzProfielWidget({
    super.key,
    required this.store,
  });

  final DocumentReference? store;

  @override
  State<CompletBizzProfielWidget> createState() =>
      _CompletBizzProfielWidgetState();
}

class _CompletBizzProfielWidgetState extends State<CompletBizzProfielWidget> {
  late CompletBizzProfielModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompletBizzProfielModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'completBizzProfiel'});
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
                        'COMPLET_BIZZ_PROFIEL_Container_270urd9q_');
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
                          'o18bi7qj' /* Complete Profiel */,
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
              wrapWithModel(
                model: _model.completeBizzProfielModel,
                updateCallback: () => setState(() {}),
                child: CompleteBizzProfielWidget(),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 60.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('COMPLET_BIZZ_PROFIEL_NEXT_BTN_ON_TAP');
                      if ((_model.completeBizzProfielModel.uploadedFileUrl1 ==
                                  null ||
                              _model.completeBizzProfielModel
                                      .uploadedFileUrl1 ==
                                  '') ||
                          (_model.completeBizzProfielModel.uploadedFileUrl2 ==
                                  null ||
                              _model.completeBizzProfielModel
                                      .uploadedFileUrl2 ==
                                  '')) {
                        logFirebaseEvent('Button_show_snack_bar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Upload Photo',
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
                          logo:
                              _model.completeBizzProfielModel.uploadedFileUrl1,
                          backgroundPicture:
                              _model.completeBizzProfielModel.uploadedFileUrl2,
                        ));
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed('homeBizz');
                      }
                    },
                    text: FFLocalizations.of(context).getText(
                      '5ytx5ysd' /* Next */,
                    ),
                    options: FFButtonOptions(
                      height: 60.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).accent1,
                      textStyle: FlutterFlowTheme.of(context)
                          .bodyLarge
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyLargeFamily,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
