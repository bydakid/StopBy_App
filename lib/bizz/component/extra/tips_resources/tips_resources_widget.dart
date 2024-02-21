import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tips_resources_model.dart';
export 'tips_resources_model.dart';

class TipsResourcesWidget extends StatefulWidget {
  const TipsResourcesWidget({super.key});

  @override
  State<TipsResourcesWidget> createState() => _TipsResourcesWidgetState();
}

class _TipsResourcesWidgetState extends State<TipsResourcesWidget> {
  late TipsResourcesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TipsResourcesModel());

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                '7p1pb7u9' /* Tips and resources */,
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Container(
                  color: Colors.white,
                  child: ExpandableNotifier(
                    controller: _model.expandableController1,
                    child: ExpandablePanel(
                      header: Text(
                        FFLocalizations.of(context).getText(
                          'fyhpeyrv' /* What is a Mystery Bag? */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      collapsed: Container(),
                      expanded: Text(
                        FFLocalizations.of(context).getText(
                          'hugdqfrw' /* A Mystery Bag is what customer... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: true,
                        tapBodyToCollapse: true,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Container(
                  color: Colors.white,
                  child: ExpandableNotifier(
                    controller: _model.expandableController2,
                    child: ExpandablePanel(
                      header: Text(
                        FFLocalizations.of(context).getText(
                          'uc0zis0r' /* Earnings and payouts */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      collapsed: Container(),
                      expanded: Text(
                        FFLocalizations.of(context).getText(
                          'cdcfu9yf' /* We institute a reservation fee... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: true,
                        tapBodyToCollapse: true,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Container(
                  color: Colors.white,
                  child: ExpandableNotifier(
                    controller: _model.expandableController3,
                    child: ExpandablePanel(
                      header: Text(
                        FFLocalizations.of(context).getText(
                          'jx0uu61p' /* How do I sell my surplus food ... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      collapsed: Container(),
                      expanded: Text(
                        FFLocalizations.of(context).getText(
                          'gfsilfus' /* After establishing your accoun... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      theme: ExpandableThemeData(
                        tapHeaderToExpand: true,
                        tapBodyToExpand: true,
                        tapBodyToCollapse: true,
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        hasIcon: true,
                        iconColor: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(),
            ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ],
        ),
      ),
    );
  }
}
