import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/bizz/component/extra/order_picked_up/order_picked_up_widget.dart';
import '/bizz/component/extra/tips_resources/tips_resources_widget.dart';
import '/bizz/component/extra/verification/verification_widget.dart';
import '/bizz/component/update_bag/mystery_bag_description_update/mystery_bag_description_update_widget.dart';
import '/bizz/component/update_bag/mystery_bag_go_live/mystery_bag_go_live_widget.dart';
import '/bizz/component/update_bag/mystery_bag_picture_update/mystery_bag_picture_update_widget.dart';
import '/bizz/component/update_bag/mystery_bag_price_update/mystery_bag_price_update_widget.dart';
import '/bizz/component/update_bag/mystery_bag_time_update/mystery_bag_time_update_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_bizz_model.dart';
export 'home_bizz_model.dart';

class HomeBizzWidget extends StatefulWidget {
  const HomeBizzWidget({super.key});

  @override
  State<HomeBizzWidget> createState() => _HomeBizzWidgetState();
}

class _HomeBizzWidgetState extends State<HomeBizzWidget> {
  late HomeBizzModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeBizzModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'homeBizz'});
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

    return StreamBuilder<List<StoreRecord>>(
      stream: queryStoreRecord(
        queryBuilder: (storeRecord) => storeRecord.where(
          'user',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).info,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).accent1,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<StoreRecord> homeBizzStoreRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final homeBizzStoreRecord = homeBizzStoreRecordList.isNotEmpty
            ? homeBizzStoreRecordList.first
            : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).info,
            drawer: Container(
              width: MediaQuery.sizeOf(context).width * 0.7,
              child: Drawer(
                elevation: 10.0,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).info,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 80.0, 0.0, 0.0),
                            child: Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/Buk.png',
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '84ey0hb6' /* StopBy */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Ubuntu',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Ubuntu'),
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 50.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '014izm3l' /* STORE */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.splitscreen_rounded,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    size: 24.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'fiyhygxj' /* Dashboard */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 40.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'sbrg7sv1' /* SUPPORT */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'HOME_BIZZ_PAGE_Container_kz26wkvh_ON_TAP');
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed('helpCenter');
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.headset_mic_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'jqzjb4p3' /* Help Center */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'HOME_BIZZ_PAGE_Container_csl77le1_ON_TAP');
                              logFirebaseEvent('Container_backend_call');
                              unawaited(
                                () async {
                                  await currentUserReference!
                                      .update(createUserRecordData(
                                    home: false,
                                  ));
                                }(),
                              );
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed('home');
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.phone_iphone_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '0xh8e1uk' /* Go to consumer app */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 40.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'HOME_BIZZ_PAGE_Container_qlvbfkyr_ON_TAP');
                              logFirebaseEvent('Container_auth');
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth('Login', context.mounted);
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 10.0, 10.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.logout_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'zcqtmrzt' /* Log out */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).info,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  valueOrDefault<String>(
                                    homeBizzStoreRecord?.logo,
                                    'None',
                                  ),
                                ).image,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    homeBizzStoreRecord?.location?.name,
                                    'Name',
                                  ).maybeHandleOverflow(
                                    maxChars: 25,
                                    replacement: '…',
                                  ),
                                  maxLines: 1,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'HOME_BIZZ_PAGE_Container_3hqw62t2_ON_TAP');
                        logFirebaseEvent('Container_drawer');
                        scaffoldKey.currentState!.openDrawer();
                      },
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.menu_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
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
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (homeBizzStoreRecord?.logo == null ||
                          homeBizzStoreRecord?.logo == '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '4zraegka' /* Welcome to StopBy Bizz */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleLargeFamily,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily),
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'HOME_BIZZ_PAGE_GET_STARTED_BTN_ON_TAP');
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                          'completBizzProfiel',
                                          queryParameters: {
                                            'store': serializeParam(
                                              homeBizzStoreRecord?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '4ol0v9j0' /* Get started */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 60.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 0.0, 40.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if ((homeBizzStoreRecord?.logo != null &&
                              homeBizzStoreRecord?.logo != '') &&
                          (homeBizzStoreRecord?.features?.mysteryBag == false))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'qy3hj57a' /* START
NOW */
                                      ,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLargeFamily,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily),
                                        ),
                                  ),
                                  Flexible(
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'HOME_BIZZ_ADD_MYSTERY_BAG_BTN_ON_TAP');
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                          'addBagBizz',
                                          queryParameters: {
                                            'store': serializeParam(
                                              homeBizzStoreRecord?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '6ykcc9ac' /* ADD MYSTERY BAG */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 60.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      showLoadingIndicator: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (homeBizzStoreRecord?.features?.mysteryBag == true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'j8x27u9j' /* Your Mystery Bag */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
                                      ),
                                      if ((homeBizzStoreRecord?.bag?.live ==
                                              true) &&
                                          (homeBizzStoreRecord!.bag.timeEnd!
                                                  .secondsSinceEpoch >
                                              getCurrentTimestamp
                                                  .secondsSinceEpoch))
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'exmxcaj2' /* ONLINE */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily),
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.dotCircle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                size: 10.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                                if (homeBizzStoreRecord!.openOrder > 0)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  't8wclsnz' /* OPEN ORDERS */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.2,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'i6cwzmf4' /* Name */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall,
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.2,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'u8rw1zzy' /* To Pay */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall,
                                                        ),
                                                      ),
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.2,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ckfj5zcn' /* Order Nr */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                StreamBuilder<
                                                    List<OrdersRecord>>(
                                                  stream: queryOrdersRecord(
                                                    queryBuilder:
                                                        (ordersRecord) =>
                                                            ordersRecord
                                                                .where(
                                                                  'store_refx',
                                                                  isEqualTo:
                                                                      homeBizzStoreRecord
                                                                          ?.reference,
                                                                )
                                                                .where(
                                                                  'picked_up',
                                                                  isEqualTo:
                                                                      false,
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child: SpinKitRipple(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<OrdersRecord>
                                                        columnOrdersRecordList =
                                                        snapshot.data!;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          columnOrdersRecordList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnOrdersRecord =
                                                            columnOrdersRecordList[
                                                                columnIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      5.0,
                                                                      10.0,
                                                                      5.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'HOME_BIZZ_PAGE_Row_u4nw6r1h_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Row_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          OrderPickedUpWidget(
                                                                        order:
                                                                            columnOrdersRecord,
                                                                        store:
                                                                            homeBizzStoreRecord!,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.2,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      columnOrdersRecord
                                                                          .userName,
                                                                      'User',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.2,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        RichText(
                                                                      textScaleFactor:
                                                                          MediaQuery.of(context)
                                                                              .textScaleFactor,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'pyt3nod7' /* RM  */,
                                                                            ),
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodySmall,
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                valueOrDefault<String>(
                                                                              formatNumber(
                                                                                valueOrDefault<double>(
                                                                                  columnOrdersRecord.priceToPay,
                                                                                  0.0,
                                                                                ).toInt(),
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.automatic,
                                                                              ),
                                                                              '0',
                                                                            ),
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.2,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      columnOrdersRecord
                                                                          .numberOrder
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 10.0, 0.0, 20.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '4hjl9hdu' /* Stock */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily),
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 140.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            size: 25.0,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            size: 25.0,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          count: _model.countControllerValue ??=
                                              valueOrDefault<int>(
                                            homeBizzStoreRecord?.bag?.quantity,
                                            0,
                                          ),
                                          updateCount: (count) async {
                                            setState(() => _model
                                                .countControllerValue = count);
                                            logFirebaseEvent(
                                                'HOME_BIZZ_CountController_m2u5r70y_ON_FO');
                                            logFirebaseEvent(
                                                'CountController_backend_call');

                                            await homeBizzStoreRecord!.reference
                                                .update(createStoreRecordData(
                                              bag: createBagStruct(
                                                quantity:
                                                    _model.countControllerValue,
                                                clearUnsetFields: false,
                                              ),
                                            ));
                                            if (homeBizzStoreRecord!
                                                    .bag.quantity <
                                                1) {
                                              logFirebaseEvent(
                                                  'CountController_backend_call');

                                              await homeBizzStoreRecord!
                                                  .reference
                                                  .update(createStoreRecordData(
                                                bag: createBagStruct(
                                                  live: false,
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            }
                                          },
                                          stepSize: 1,
                                          minimum: 0,
                                          maximum: 100,
                                        ),
                                      ),
                                      if ((homeBizzStoreRecord?.bag?.live ==
                                              false) ||
                                          (homeBizzStoreRecord!.bag.timeEnd!
                                                  .secondsSinceEpoch <
                                              getCurrentTimestamp
                                                  .secondsSinceEpoch))
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'HOME_BIZZ_PAGE_GO_LIVE_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_bottom_sheet');
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            MysteryBagGoLiveWidget(
                                                          store:
                                                              homeBizzStoreRecord!,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '668uxj4h' /* GO LIVE */,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                padding: EdgeInsets.all(20.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                elevation: 2.0,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      if ((homeBizzStoreRecord?.bag?.live ==
                                              true) &&
                                          (homeBizzStoreRecord!.bag.timeEnd!
                                                  .secondsSinceEpoch >
                                              getCurrentTimestamp
                                                  .secondsSinceEpoch))
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'HOME_BIZZ_PAGE_OUT_OF_STOCK_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await homeBizzStoreRecord!
                                                    .reference
                                                    .update(
                                                        createStoreRecordData(
                                                  bag: createBagStruct(
                                                    live: false,
                                                    quantity: 0,
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'eczbyycv' /* OUT OF STOCK */,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                padding: EdgeInsets.all(20.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                elevation: 2.0,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              valueOrDefault<String>(
                                                homeBizzStoreRecord
                                                    ?.backgroundPicture,
                                                'None',
                                              ),
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 40.0, 0.0, 0.0),
                                          child: Container(
                                            width: 80.0,
                                            height: 80.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  valueOrDefault<String>(
                                                    homeBizzStoreRecord?.logo,
                                                    'None',
                                                  ),
                                                ).image,
                                              ),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                width: 2.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 10.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_BIZZ_PAGE_Container_zqlmpccp_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          MysteryBagPictureUpdateWidget(
                                                        store1:
                                                            homeBizzStoreRecord!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.edit_square,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 5.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'r3z4rw9h' /* Name */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_BIZZ_PAGE_Container_as6eh6nb_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      MysteryBagDescriptionUpdateWidget(
                                                    store: homeBizzStoreRecord!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.edit_square,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      homeBizzStoreRecord?.bag?.name,
                                      'Mystery Bag',
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 5.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '7lzpxkl5' /* Minimum value per Mystery Bag */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_BIZZ_PAGE_Container_bnhxyjug_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      MysteryBagPriceUpdateWidget(
                                                    store1:
                                                        homeBizzStoreRecord!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.edit_square,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 10.0),
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            formatNumber(
                                              homeBizzStoreRecord?.bag?.price,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            ),
                                            '0',
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'u9j69g54' /*  RM */,
                                          ),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 5.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '4ki9dtwo' /* Price in app */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 10.0),
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            formatNumber(
                                              (valueOrDefault<double>(
                                                        homeBizzStoreRecord
                                                            ?.bag?.price,
                                                        0.0,
                                                      ) /
                                                      3)
                                                  .toInt(),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                            ),
                                            '0',
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'eilms5tf' /*  RM */,
                                          ),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 5.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'd25i0wa6' /* Pick-up time */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'HOME_BIZZ_PAGE_Container_fw9s9a8i_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      MysteryBagTimeUpdateWidget(
                                                    store: homeBizzStoreRecord!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.edit_square,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 20.0),
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                              'Hm',
                                              homeBizzStoreRecord
                                                  ?.bag?.timeStart,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            '00:00',
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'arf8z50b' /*  -  */,
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            dateTimeFormat(
                                              'Hm',
                                              homeBizzStoreRecord?.bag?.timeEnd,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            '00:00',
                                          ),
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.tipsResourcesModel,
                          updateCallback: () => setState(() {}),
                          child: TipsResourcesWidget(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 80.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'nrjtws3o' /* Need more help? */,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '4evp6gr4' /* Visit our  */,
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'b13x95q7' /* Help Center  */,
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '6yxlgv81' /* or contact us directly at  */,
                                          ),
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'flim21v0' /* +60138181014 */,
                                          ),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                          ),
                                          mouseCursor: SystemMouseCursors.click,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () async {
                                              logFirebaseEvent(
                                                  'HOME_BIZZ_RichTextSpan_gmm3u79b_ON_TAP');
                                              logFirebaseEvent(
                                                  'RichTextSpan_call_number');
                                              unawaited(
                                                () async {
                                                  await launchUrl(Uri(
                                                    scheme: 'tel',
                                                    path: '+60138181014',
                                                  ));
                                                }(),
                                              );
                                            },
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (homeBizzStoreRecord?.verified?.verified == false)
                  wrapWithModel(
                    model: _model.verificationModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: VerificationWidget(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
