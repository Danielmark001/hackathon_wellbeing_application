import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loginhealthai_model.dart';
export 'loginhealthai_model.dart';

class LoginhealthaiWidget extends StatefulWidget {
  const LoginhealthaiWidget({super.key});

  @override
  State<LoginhealthaiWidget> createState() => _LoginhealthaiWidgetState();
}

class _LoginhealthaiWidgetState extends State<LoginhealthaiWidget> {
  late LoginhealthaiModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginhealthaiModel());

    _model.emailAddressLoginTextController ??= TextEditingController();
    _model.emailAddressLoginFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: TextFormField(
              controller: _model.emailAddressLoginTextController,
              focusNode: _model.emailAddressLoginFocusNode,
              obscureText: false,
              decoration: InputDecoration(
                labelText: FFLocalizations.of(context).getText(
                  '0b409ocf' /* Email Address */,
                ),
                labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Lexend',
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                    ),
                hintText: FFLocalizations.of(context).getText(
                  '4pjtu9er' /* Enter your email... */,
                ),
                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Lexend',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lexend',
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                  ),
              validator: _model.emailAddressLoginTextControllerValidator
                  .asValidator(context),
            ),
          ),
        ),
      ),
    );
  }
}
