import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'location_model.dart';
export 'location_model.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  late LocationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationModel());

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'xhy4qk1e' /* Select a distance */,
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Slider(
                    activeColor: FlutterFlowTheme.of(context).primaryText,
                    inactiveColor: FlutterFlowTheme.of(context).alternate,
                    min: 1.0,
                    max: 10.0,
                    value: _model.sliderValue ??= FFAppState().distance,
                    divisions: 9,
                    onChanged: (newValue) async {
                      setState(() => _model.sliderValue = newValue);
                      logFirebaseEvent(
                          'LOCATION_Slider_ua7tsb8s_ON_FORM_WIDGET_');
                      logFirebaseEvent('Slider_update_app_state');
                      setState(() {
                        FFAppState().distance = _model.sliderValue!;
                      });
                    },
                  ),
                ),
                Text(
                  valueOrDefault<String>(
                    _model.sliderValue.toString(),
                    '5',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'q2iucvae' /*  km */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
            child: FlutterFlowPlacePicker(
              iOSGoogleMapsApiKey: 'AIzaSyDFZOXgecxYqlyJHbQ9dV53W5M-3Z4xbAg',
              androidGoogleMapsApiKey:
                  'AIzaSyDFZOXgecxYqlyJHbQ9dV53W5M-3Z4xbAg',
              webGoogleMapsApiKey: 'AIzaSyDFZOXgecxYqlyJHbQ9dV53W5M-3Z4xbAg',
              onSelect: (place) async {
                setState(() => _model.placePickerValue = place);
              },
              defaultText: FFLocalizations.of(context).getText(
                'h8z51n6g' /* Select a city */,
              ),
              icon: Icon(
                Icons.search_sharp,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 25.0,
              ),
              buttonOptions: FFButtonOptions(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 50.0,
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyLarge,
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('LOCATION_USE_MY_CURRENT_LOCATION_BTN_ON_');
                logFirebaseEvent('Button_update_app_state');
                setState(() {
                  FFAppState().location = LatLng(3.1319197, 101.6840589);
                  FFAppState().locationName = 'current location';
                });
                logFirebaseEvent('Button_bottom_sheet');
                Navigator.pop(context);
              },
              text: FFLocalizations.of(context).getText(
                'tdxuja1e' /* Use my current location */,
              ),
              icon: Icon(
                Icons.my_location_outlined,
                color: FlutterFlowTheme.of(context).accent2,
                size: 25.0,
              ),
              options: FFButtonOptions(
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyLargeFamily),
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              showLoadingIndicator: false,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
            child: FFButtonWidget(
              onPressed: (_model.placePickerValue.city == null ||
                      _model.placePickerValue.city == '')
                  ? null
                  : () async {
                      logFirebaseEvent('LOCATION_COMP_SHOW_RESULTS_BTN_ON_TAP');
                      logFirebaseEvent('Button_update_app_state');
                      setState(() {
                        FFAppState().locationName = valueOrDefault<String>(
                          _model.placePickerValue.city,
                          'current location',
                        );
                        FFAppState().location = _model.placePickerValue.latLng;
                      });
                      logFirebaseEvent('Button_bottom_sheet');
                      Navigator.pop(context);
                    },
              text: FFLocalizations.of(context).getText(
                'yvqi8xdl' /* Show results */,
              ),
              options: FFButtonOptions(
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).accent1,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                      color: Colors.white,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleSmallFamily),
                    ),
                elevation: 2.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(40.0),
                disabledColor: FlutterFlowTheme.of(context).tertiary,
                disabledTextColor: FlutterFlowTheme.of(context).secondaryText,
              ),
              showLoadingIndicator: false,
            ),
          ),
        ],
      ),
    );
  }
}
