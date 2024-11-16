import 'package:flutter/material.dart';
import 'package:network_checker/connection_checker/bloc/connection_checker_controller.dart';
import 'package:scope_provider/scope/scope_provider.dart';

class NetworkCheckerWidget extends StatelessWidget {
  const NetworkCheckerWidget({
    super.key,
    required this.connectedChild,
    this.doOnConnect,
  });

  final Widget? connectedChild;
  final VoidCallback? doOnConnect;

  @override
  Widget build(BuildContext context) {
    final connectionController =
        ScopeProvider.of<ConnectionCheckerController>(context);
    return Column(
      children: [
        if (!connectionController.isConnected(context))
          const SizedBox(
            height: 15,
            child: Text("Connection lost"),
          ),
        connectedChild ?? const SizedBox.shrink()
      ],
    );
  }
}
