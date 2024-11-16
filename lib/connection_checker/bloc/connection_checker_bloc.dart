import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:scope_provider/scope/scope_provider.dart';

part 'connection_checker_state.dart';

part 'connection_checker_event.dart';

class ConnectionCheckerBloc
    extends Bloc<ConnectionCheckerEvent, ConnectionCheckerState> {
  final _connectivity = Connectivity();
  late final StreamSubscription _connectivityStream;

  ConnectionCheckerBloc() : super(ConnectionCheckerState.unknown()) {
    on<ConnectionCheckerEvent>((event, emit) {
      switch (event) {
        case RecheckConnection():
          _recheckConnection(event, emit);
        case ConnectionChangedToConnected():
          _connectionChangedToConnected(event, emit);
        case ConnectionChangedToOffline():
          _connectionChangedToOffline(event, emit);
        case ConnectionChangedToUnknown():
          _connectionChangedToUnknown(event, emit);
      }
    });
    _connectivityStream =
        _connectivity.onConnectivityChanged.listen(_connectivityListener);
  }

  void _connectivityListener(List<ConnectivityResult> res) {
    if (res.contains(ConnectivityResult.wifi) ||
        res.contains(ConnectivityResult.mobile)) {
      add(ConnectionCheckerEvent.connectionChangedToConnected());
    } else if (res.contains(ConnectivityResult.none)) {
      add(ConnectionCheckerEvent.connectionChangedToOffline());
    } else {
      add(ConnectionCheckerEvent.connectionChangedToUnknown());
    }
  }

  Future<void> _connectionChangedToConnected(
    ConnectionChangedToConnected event,
    Emitter<ConnectionCheckerState> emit,
  ) async {
    emit(
      ConnectionCheckerState.connected(),
    );
  }

  Future<void> _connectionChangedToOffline(
    ConnectionChangedToOffline event,
    Emitter<ConnectionCheckerState> emit,
  ) async {
    emit(
      ConnectionCheckerState.offline(),
    );
  }

  Future<void> _connectionChangedToUnknown(
    ConnectionChangedToUnknown event,
    Emitter<ConnectionCheckerState> emit,
  ) async {
    emit(
      ConnectionCheckerState.unknown(),
    );
  }

  Future<void> _recheckConnection(
    RecheckConnection event,
    Emitter<ConnectionCheckerState> emit,
  ) async =>
      _connectivityListener(await _connectivity.checkConnectivity());

  @override
  Future<void> close() {
    _connectivityStream.cancel();
    return super.close();
  }
}
