import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mystery_bag_description_model.dart';
export 'mystery_bag_description_model.dart';

class MysteryBagDescriptionWidget extends StatefulWidget {
  const MysteryBagDescriptionWidget({super.key});

  @override
  State<MysteryBagDescriptionWidget> createState() =>
      _MysteryBagDescriptionWidgetState();
}

class _MysteryBagDescriptionWidgetState
    extends State<MysteryBagDescriptionWidget> {
  late MysteryBagDescriptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MysteryBagDescriptionModel());

    _model.nameBagController ??= TextEditingController();
    _model.nameBagFocusNode ??= FocusNode();

    _model.descriptionBagController ??= TextEditingController();
    _model.descriptionBagFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.nameBagController?.text = FFLocalizations.of(context).getText(
            '2widsrlp' /* Mystery Bag */,
          );
          _model.descriptionBagController?.text =
              FFLocalizations.of(context).getText(
            'e95wp57t' /* It's a mystery! When you buy a... */,
          );
        }));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'b62jebd6' /* Bag Description */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '2j5zlerr' /* Choose a unique name and descr... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 40.0, 0.0, 10.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '1uhim6vk' /* Bag Name */,
                ),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodySmall,
              ),
            ),
            Container(
              width: 400.0,
              child: TextFormField(
                controller: _model.nameBagController,
                focusNode: _model.nameBagFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.nameBagController',
                  Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                textCapitalization: TextCapitalization.words,
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
                keyboardType: TextInputType.name,
                validator:
                    _model.nameBagControllerValidator.asValidator(context),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 10.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'ul5yri9s' /* Food types */,
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
              ),
            ),
            FlutterFlowDropDown<String>(
              controller: _model.foodTypeValueController ??=
                  FormFieldController<String>(null),
              options: [
                FFLocalizations.of(context).getText(
                  '81larqvv' /* Meals */,
                ),
                FFLocalizations.of(context).getText(
                  '0cdxixmc' /* Bread & Pastries */,
                ),
                FFLocalizations.of(context).getText(
                  'ymhcvbeo' /* Groceries */,
                ),
                FFLocalizations.of(context).getText(
                  'ca9g87n8' /* Other */,
                )
              ],
              onChanged: (val) => setState(() => _model.foodTypeValue = val),
              height: 50.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium,
              hintText: FFLocalizations.of(context).getText(
                'd50vqxaq' /* Select Food Type */,
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 25.0,
              ),
              fillColor: FlutterFlowTheme.of(context).primaryBackground,
              elevation: 2.0,
              borderColor: FlutterFlowTheme.of(context).secondaryBackground,
              borderWidth: 2.0,
              borderRadius: 10.0,
              margin: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 12.0, 0.0),
              hidesUnderline: true,
              isSearchable: false,
              isMultiSelect: false,
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 0.0, 10.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'l4ue207k' /* Bag Description */,
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
              ),
            ),
            Container(
              width: 400.0,
              child: TextFormField(
                controller: _model.descriptionBagController,
                focusNode: _model.descriptionBagFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.descriptionBagController',
                  Duration(milliseconds: 2000),
                  () => setState(() {}),
                ),
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
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
                maxLines: null,
                minLines: 4,
                keyboardType: TextInputType.multiline,
                validator: _model.descriptionBagControllerValidator
                    .asValidator(context),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 60.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('MYSTERY_BAG_DESCRIPTION_NEXT_BTN_ON_TAP');
                    if ((_model.nameBagController.text == null ||
                            _model.nameBagController.text == '') ||
                        (_model.foodTypeValue == null ||
                            _model.foodTypeValue == '') ||
                        (_model.descriptionBagController.text == null ||
                            _model.descriptionBagController.text == '')) {
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodySmallFamily),
                                ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      );
                    } else {
                      logFirebaseEvent('Button_update_app_state');
                      setState(() {
                        FFAppState().pageState = 2;
                      });
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    'moo26xhh' /* Next */,
                  ),
                  options: FFButtonOptions(
                    height: 60.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).accent1,
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
