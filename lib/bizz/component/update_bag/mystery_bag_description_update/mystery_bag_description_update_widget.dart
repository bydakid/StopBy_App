import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'mystery_bag_description_update_model.dart';
export 'mystery_bag_description_update_model.dart';

class MysteryBagDescriptionUpdateWidget extends StatefulWidget {
  const MysteryBagDescriptionUpdateWidget({
    super.key,
    required this.store,
  });

  final StoreRecord? store;

  @override
  State<MysteryBagDescriptionUpdateWidget> createState() =>
      _MysteryBagDescriptionUpdateWidgetState();
}

class _MysteryBagDescriptionUpdateWidgetState
    extends State<MysteryBagDescriptionUpdateWidget> {
  late MysteryBagDescriptionUpdateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MysteryBagDescriptionUpdateModel());

    _model.nameBagController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.store?.bag?.name,
      'Name',
    ));
    _model.nameBagFocusNode ??= FocusNode();

    _model.descriptionBagController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.store?.bag?.description,
      'Description',
    ));
    _model.descriptionBagFocusNode ??= FocusNode();

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
                        'psrs62hu' /* Bag Name */,
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
                          'MYSTERY_BAG_DESCRIPTION_UPDATE_Container');
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
                    '7lv3rkjn' /* Food types */,
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodySmall,
                ),
              ),
            ),
            FlutterFlowDropDown<String>(
              controller: _model.foodTypeValueController ??=
                  FormFieldController<String>(
                _model.foodTypeValue ??= valueOrDefault<String>(
                  widget.store?.bag?.foodType,
                  'Type',
                ),
              ),
              options: [
                FFLocalizations.of(context).getText(
                  'goypcslr' /* Meals */,
                ),
                FFLocalizations.of(context).getText(
                  'yz7ip208' /* Bread & Pastries */,
                ),
                FFLocalizations.of(context).getText(
                  'sp7b1qwl' /* Groceries */,
                ),
                FFLocalizations.of(context).getText(
                  '6we09uyr' /* Drinks */,
                ),
                FFLocalizations.of(context).getText(
                  'v5w0x55h' /* Other */,
                )
              ],
              onChanged: (val) => setState(() => _model.foodTypeValue = val),
              height: 50.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium,
              hintText: FFLocalizations.of(context).getText(
                'csec2ira' /* Select Food Type */,
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 25.0,
              ),
              fillColor: FlutterFlowTheme.of(context).alternate,
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
                    'uetzmxv6' /* Bag Description */,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 40.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'MYSTERY_BAG_DESCRIPTION_UPDATE_SAVE_BTN_');
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
                      logFirebaseEvent('Button_backend_call');

                      await widget.store!.reference
                          .update(createStoreRecordData(
                        bag: createBagStruct(
                          description: _model.descriptionBagController.text,
                          name: _model.nameBagController.text,
                          foodType: _model.foodTypeValue,
                          clearUnsetFields: false,
                        ),
                      ));
                      logFirebaseEvent('Button_bottom_sheet');
                      Navigator.pop(context);
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    '56ewqedx' /* Save */,
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
