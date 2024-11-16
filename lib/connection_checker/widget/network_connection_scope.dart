import 'package:flutter/material.dart';
import 'package:network_checker/connection_checker/bloc/connection_checker_bloc.dart';
import 'package:network_checker/connection_checker/bloc/connection_checker_controller.dart';
import 'package:scope_provider/scope/scope_provider.dart';

class InternetConnectionScope extends StatefulWidget {
  const InternetConnectionScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<InternetConnectionScope> createState() =>
      _InternetConnectionScopeState();
}

class _InternetConnectionScopeState extends ScopeProvider<
    InternetConnectionScope,
    ConnectionCheckerState,
    ConnectionCheckerBloc,
    ConnectionCheckerController> {
  @override
  ConnectionCheckerController createController() {
    return ConnectionCheckerController();
  }

  @override
  Widget onBuild(BuildContext context) {
    return widget.child;
  }

  @override
  void onListen(
    BuildContext context,
    ConnectionCheckerState state,
    ConnectionCheckerController controller,
  ) {}
}
