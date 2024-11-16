import 'package:flutter/cupertino.dart';
import 'package:network_checker/connection_checker/bloc/connection_checker_bloc.dart';
import 'package:scope_provider/scope/scope_provider.dart';

class ConnectionCheckerController
    extends ScopeController<ConnectionCheckerBloc> {
  @override
  ConnectionCheckerBloc get createBloc => ConnectionCheckerBloc();

  void recheckConnection(BuildContext context) {
    getBloc(context).add(ConnectionCheckerEvent.recheckConnection());
  }

  bool isConnected(BuildContext context) {
    return getBloc(context).state.isConnected;
  }
}
